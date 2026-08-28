/* Flipbook partagé — rend un PDF en livre feuilletable (page-flip).
   Rendu par images (méthode stable) + couche de liens cliquables superposée
   (table des matières internes + liens externes), recalée sur la double page.
   Requiert pdf.js et page-flip (St.PageFlip). Le conteneur #flip porte
   l'URL du PDF dans data-pdf (et data-scale optionnel). */
(function(){
  var el = document.getElementById('flip');
  if(!el) return;
  var PDF_URL = el.getAttribute('data-pdf');
  var SCALE = parseFloat(el.getAttribute('data-scale') || '0');   // 0 = auto (densité écran)
  var DPR = Math.min(window.devicePixelRatio || 1, 2);            // plafonné à 2
  var IS_MOBILE = window.matchMedia('(max-width: 860px)').matches; // mobile → défilement vertical
  var loadingEl = document.getElementById('loading'),
      controls  = document.getElementById('controls'),
      hint      = document.getElementById('hint'),
      countEl   = document.getElementById('count'),
      prevBtn   = document.getElementById('prev'),
      nextBtn   = document.getElementById('next');
  var pageFlip = null, total = 0, pages = [], currentIdx = 0, overlay = null;

  if(!window.pdfjsLib){ if(loadingEl) loadingEl.textContent = "Impossible de charger la visionneuse."; return; }
  pdfjsLib.GlobalWorkerOptions.workerSrc = "https://cdnjs.cloudflare.com/ajax/libs/pdf.js/3.11.174/pdf.worker.min.js";

  // PDF incorporé en base64 (window.__PDF_DATA__) → fonctionne même en local (file://)
  function b64ToBytes(b64){
    var bin = atob(b64), len = bin.length, bytes = new Uint8Array(len);
    for(var i=0;i<len;i++){ bytes[i] = bin.charCodeAt(i); }
    return bytes;
  }
  var PDF_SRC = (typeof window.__PDF_DATA__ === 'string' && window.__PDF_DATA__)
    ? { data: b64ToBytes(window.__PDF_DATA__) }
    : PDF_URL;

  function setCount(cur){
    if(total<=0) return;
    var right = cur+1;
    if(cur===0){ countEl.textContent = "1 / "+total; }
    else if(right>=total){ countEl.textContent = total+" / "+total; }
    else { countEl.textContent = (cur+1)+"–"+(right+1)+" / "+total; }
    prevBtn.disabled = (cur<=0);
    nextBtn.disabled = (cur>=total-1);
  }

  function resolveDest(pdf, dest){
    var p = (typeof dest==='string') ? pdf.getDestination(dest) : Promise.resolve(dest);
    return p.then(function(d){
      if(!d || !d[0]) return null;
      return pdf.getPageIndex(d[0]).then(function(i){ return i; }).catch(function(){ return null; });
    }).catch(function(){ return null; });
  }
  function buildLinks(pdf, anns, vp){
    var out = [], tasks = [];
    (anns||[]).forEach(function(a){
      if(a.subtype!=='Link') return;
      var r = vp.convertToViewportRectangle(a.rect);
      var x1=Math.min(r[0],r[2]), y1=Math.min(r[1],r[3]), x2=Math.max(r[0],r[2]), y2=Math.max(r[1],r[3]);
      var box = { left:x1/vp.width*100, top:y1/vp.height*100, width:(x2-x1)/vp.width*100, height:(y2-y1)/vp.height*100 };
      if(a.url){ out.push({box:box, url:a.url}); }
      else if(a.dest){ tasks.push(resolveDest(pdf, a.dest).then(function(idx){ if(idx!=null) out.push({box:box, page:idx}); })); }
    });
    return Promise.all(tasks).then(function(){ return out; });
  }

  pdfjsLib.getDocument(PDF_SRC).promise.then(function(pdf){
    total = pdf.numPages;
    pages = new Array(total);
    // Résolution adaptative : plus nette sur écrans haute densité (mobile),
    // plafonnée selon le nombre de pages pour préserver la mémoire.
    if(!SCALE){
      if(IS_MOBILE){
        SCALE = 3.0;   // net + zoomable ; le chargement paresseux gère la mémoire
      } else {
        var maxS = total > 28 ? 2.8 : (total > 16 ? 3.2 : 3.6);
        SCALE = Math.min(2.2 * DPR, maxS);
        if(SCALE < 2.2) SCALE = 2.2;
      }
    }
    var ratio = 1.414, done = 0;
    var chain = Promise.resolve();
    for(let i=1;i<=total;i++){
      chain = chain.then(function(){
        return pdf.getPage(i).then(function(page){
          var vp = page.getViewport({scale:SCALE});
          if(i===1) ratio = vp.height/vp.width;
          var canvas = document.createElement('canvas');
          canvas.width = vp.width; canvas.height = vp.height;
          return page.render({canvasContext:canvas.getContext('2d'), viewport:vp}).promise.then(function(){
            var img = canvas.toDataURL('image/jpeg', 0.9);
            return page.getAnnotations().then(function(anns){ return buildLinks(pdf, anns, vp); })
              .catch(function(){ return []; })
              .then(function(links){
                pages[i-1] = { img:img, links:links };
                done++; if(loadingEl) loadingEl.textContent = "Rendu des pages… "+done+" / "+total;
              });
          });
        });
      });
    }
    chain.then(function(){ IS_MOBILE ? initScroll() : initFlip(ratio); });
  }).catch(function(){
    if(loadingEl) loadingEl.innerHTML = 'Le document n\'a pas pu être chargé ici. Vous pouvez l\'ouvrir directement : <a href="'+PDF_URL+'" target="_blank" rel="noopener">le PDF</a>.<br><span style="font-size:.75rem">(La visionneuse fonctionne sur le site publié.)</span>';
  });

  /* Mode mobile : défilement vertical des pages en pleine largeur (lisible, zoomable),
     avec les liens du document cliquables (sommaire interne + liens externes). */
  function initScroll(){
    el.classList.add('pf-scroll');
    pages.forEach(function(pg, i){
      var wrap = document.createElement('div');
      wrap.className = 'pf-page';
      wrap.id = 'pf-p-' + i;
      var im = document.createElement('img');
      im.className = 'pf-page-img';
      im.src = pg.img;
      im.loading = 'lazy';
      im.alt = 'Page ' + (i+1);
      wrap.appendChild(im);
      if(pg.links && pg.links.length){
        var ll = document.createElement('div');
        ll.className = 'pf-ll-scroll';
        pg.links.forEach(function(l){
          var a = document.createElement('a');
          a.style.left = l.box.left+'%'; a.style.top = l.box.top+'%';
          a.style.width = l.box.width+'%'; a.style.height = l.box.height+'%';
          if(l.url){ a.href = l.url; a.target = '_blank'; a.rel = 'noopener'; a.title = l.url; }
          else {
            a.href = '#pf-p-' + l.page;
            a.title = 'Aller à la page ' + (l.page+1);
            a.addEventListener('click', function(ev){
              ev.preventDefault();
              var t = document.getElementById('pf-p-' + l.page);
              if(t) t.scrollIntoView({behavior:'smooth', block:'start'});
            });
          }
          ll.appendChild(a);
        });
        wrap.appendChild(ll);
      }
      el.appendChild(wrap);
    });
    if(loadingEl) loadingEl.style.display = 'none';
    if(controls) controls.style.display = 'none';
    if(hint){ hint.style.display = 'block'; hint.textContent = 'Faites défiler pour lire ; pincez pour zoomer. Les liens du document sont cliquables.'; }
  }

  function initFlip(ratio){
    var baseW = 760, baseH = Math.round(baseW*ratio);
    pageFlip = new St.PageFlip(el, {
      width:baseW, height:baseH,
      size:"stretch", minWidth:320, maxWidth:820,
      minHeight:Math.round(320*ratio), maxHeight:Math.round(820*ratio),
      drawShadow:true, flippingTime:700, usePortrait:true, showCover:true,
      autoSize:true, mobileScrollSupport:true, maxShadowOpacity:0.5
    });
    pageFlip.loadFromImages(pages.map(function(p){ return p.img; }));

    overlay = document.createElement('div');
    overlay.className = 'pf-overlay';
    el.appendChild(overlay);

    if(loadingEl) loadingEl.style.display = 'none';
    if(controls) controls.style.display = 'flex';
    if(hint) hint.style.display = 'block';
    setCount(0);

    pageFlip.on('flip', function(e){ currentIdx = e.data; setCount(e.data); layout(); });
    pageFlip.on('changeState', function(e){ if(e.data==='read'){ layout(); } else { hideOverlay(); } });
    window.addEventListener('resize', function(){ layout(); });
    // premier rendu de la couche de liens
    setTimeout(layout, 60);
  }

  function orientation(){
    try { return pageFlip.getOrientation(); } catch(e){ return 'landscape'; }
  }
  function hideOverlay(){ if(overlay) overlay.innerHTML=''; }

  function layout(){
    if(!overlay || !pageFlip) return;
    overlay.innerHTML = '';
    var block = el.querySelector('.stf__block') || el.querySelector('.stf__parent');
    var fr = el.getBoundingClientRect();
    var br = block ? block.getBoundingClientRect() : fr;
    var ox = br.left - fr.left, oy = br.top - fr.top, W = br.width, H = br.height;

    var ori = orientation();
    var idx = currentIdx;
    var slots = [];
    if(ori==='portrait'){ slots.push({page:idx, x:ox, w:W}); }
    else if(idx===0){ slots.push({page:0, x:ox + W/2, w:W/2}); }
    else {
      slots.push({page:idx, x:ox, w:W/2});
      if(idx+1 < total) slots.push({page:idx+1, x:ox + W/2, w:W/2});
    }
    slots.forEach(function(s){
      var pg = pages[s.page];
      if(!pg || !pg.links) return;
      pg.links.forEach(function(l){
        var a = document.createElement('a');
        a.style.left   = (s.x + l.box.left/100*s.w) + 'px';
        a.style.top    = (oy + l.box.top/100*H) + 'px';
        a.style.width  = (l.box.width/100*s.w) + 'px';
        a.style.height = (l.box.height/100*H) + 'px';
        if(l.url){ a.href = l.url; a.target = '_blank'; a.rel = 'noopener'; a.title = l.url; }
        else { a.href = '#'; a.title = 'Aller à la page '+(l.page+1);
               a.addEventListener('click', function(ev){ ev.preventDefault(); hideOverlay(); pageFlip.flip(l.page); }); }
        // empêcher la zone de tournage de capter l'appui sur un lien (coins compris)
        ['mousedown','pointerdown','touchstart'].forEach(function(evt){
          a.addEventListener(evt, function(ev){ ev.stopPropagation(); }, {passive:true});
        });
        overlay.appendChild(a);
      });
    });
  }

  if(prevBtn) prevBtn.addEventListener('click', function(){ if(pageFlip) pageFlip.flipPrev(); });
  if(nextBtn) nextBtn.addEventListener('click', function(){ if(pageFlip) pageFlip.flipNext(); });
  document.addEventListener('keydown', function(e){
    if(!pageFlip) return;
    if(e.key==='ArrowLeft') pageFlip.flipPrev();
    if(e.key==='ArrowRight') pageFlip.flipNext();
  });
})();
