/* Visionneuse de slides partagée — affiche un PDF de présentation une slide à la fois.
   Rendu à la demande (pdf.js) avec préchargement des voisines, liens du document
   cliquables, navigation clavier / boutons / swipe, mode plein écran.
   Le conteneur #slides porte l'URL du PDF dans data-pdf.
   Requiert pdf.js. Éléments optionnels : #loading, #controls, #prev, #next, #count,
   #fsBtn, #hint. Lien direct vers une slide : ?slide=12 ou #12. */
(function(){
  var stage = document.getElementById('slides');
  if(!stage) return;
  var PDF_URL   = stage.getAttribute('data-pdf');
  var loadingEl = document.getElementById('loading'),
      controls  = document.getElementById('controls'),
      hint      = document.getElementById('hint'),
      countEl   = document.getElementById('count'),
      prevBtn   = document.getElementById('prev'),
      nextBtn   = document.getElementById('next'),
      fsBtn     = document.getElementById('fsBtn');
  var shell = stage.parentNode;            // élément mis en plein écran (contient la slide et les contrôles)
  var DPR = Math.min(window.devicePixelRatio || 1, 2);
  var pdf = null, total = 0, cur = 0, ratio = 9/16, cache = {}, cacheW = 0, renderToken = 0;

  if(!window.pdfjsLib){ if(loadingEl) loadingEl.textContent = "Impossible de charger la visionneuse."; return; }
  pdfjsLib.GlobalWorkerOptions.workerSrc = "https://cdnjs.cloudflare.com/ajax/libs/pdf.js/3.11.174/pdf.worker.min.js";

  // structure : une image + une couche de liens
  var img = document.createElement('img');
  img.className = 'sv-img'; img.alt = '';
  var links = document.createElement('div');
  links.className = 'sv-links';
  stage.appendChild(img); stage.appendChild(links);

  function isFs(){ return !!(document.fullscreenElement || document.webkitFullscreenElement); }

  /* Taille de la slide : pleine largeur du conteneur, ou ajustée à l'écran en plein écran */
  function layout(){
    var w, h;
    if(isFs()){
      var bar = controls ? controls.offsetHeight + 16 : 0;
      var vw = window.innerWidth, vh = window.innerHeight - bar;
      w = Math.min(vw, vh / ratio); h = w * ratio;
    } else {
      w = shell.clientWidth; h = w * ratio;
    }
    stage.style.width = Math.floor(w) + 'px';
    stage.style.height = Math.floor(h) + 'px';
    return Math.floor(w);
  }

  function resolveDest(dest){
    var p = (typeof dest === 'string') ? pdf.getDestination(dest) : Promise.resolve(dest);
    return p.then(function(d){
      if(!d || !d[0]) return null;
      return pdf.getPageIndex(d[0]).catch(function(){ return null; });
    }).catch(function(){ return null; });
  }

  /* Rendu d'une slide (index 0..total-1) à la largeur w, mis en cache */
  function render(i, w){
    if(cacheW !== w){ cache = {}; cacheW = w; }
    if(cache[i]) return cache[i];
    cache[i] = pdf.getPage(i+1).then(function(page){
      var base = page.getViewport({scale:1});
      var vp = page.getViewport({scale: (w * DPR) / base.width});
      var canvas = document.createElement('canvas');
      canvas.width = Math.round(vp.width); canvas.height = Math.round(vp.height);
      return page.render({canvasContext: canvas.getContext('2d'), viewport: vp}).promise.then(function(){
        var src = canvas.toDataURL('image/jpeg', 0.92);
        return page.getAnnotations().then(function(anns){
          var out = [], tasks = [];
          (anns || []).forEach(function(a){
            if(a.subtype !== 'Link') return;
            var r = vp.convertToViewportRectangle(a.rect);
            var x1 = Math.min(r[0], r[2]), y1 = Math.min(r[1], r[3]), x2 = Math.max(r[0], r[2]), y2 = Math.max(r[1], r[3]);
            var box = {left: x1/vp.width*100, top: y1/vp.height*100, width: (x2-x1)/vp.width*100, height: (y2-y1)/vp.height*100};
            if(a.url) out.push({box: box, url: a.url});
            else if(a.dest) tasks.push(resolveDest(a.dest).then(function(k){ if(k != null) out.push({box: box, page: k}); }));
          });
          return Promise.all(tasks).then(function(){ return {src: src, links: out}; });
        }).catch(function(){ return {src: src, links: []}; });
      });
    });
    return cache[i];
  }

  function drawLinks(list){
    links.innerHTML = '';
    list.forEach(function(l){
      var a = document.createElement('a');
      a.style.left = l.box.left + '%'; a.style.top = l.box.top + '%';
      a.style.width = l.box.width + '%'; a.style.height = l.box.height + '%';
      if(l.url){ a.href = l.url; a.target = '_blank'; a.rel = 'noopener'; a.title = l.url; }
      else {
        a.href = '#' + (l.page + 1); a.title = 'Aller à la slide ' + (l.page + 1);
        a.addEventListener('click', function(e){ e.preventDefault(); go(l.page); });
      }
      links.appendChild(a);
    });
  }

  function update(){
    if(countEl) countEl.textContent = (cur + 1) + ' / ' + total;
    if(prevBtn) prevBtn.disabled = (cur <= 0);
    if(nextBtn) nextBtn.disabled = (cur >= total - 1);
  }

  function show(){
    var w = layout(), token = ++renderToken, i = cur;
    update();
    stage.classList.add('sv-busy');
    render(i, w).then(function(r){
      if(token !== renderToken) return;            // une autre slide a été demandée entre-temps
      img.src = r.src; img.alt = 'Slide ' + (i + 1);
      drawLinks(r.links);
      stage.classList.remove('sv-busy');
      // préchargement des voisines
      if(i + 1 < total) render(i + 1, w);
      if(i - 1 >= 0) render(i - 1, w);
    }).catch(function(){ stage.classList.remove('sv-busy'); });
  }

  function go(i){
    i = Math.max(0, Math.min(total - 1, i));
    if(i === cur && img.src) return;
    cur = i; show();
    try{ history.replaceState(null, '', '#' + (cur + 1)); }catch(e){}
  }

  function toggleFs(){
    if(isFs()){ (document.exitFullscreen || document.webkitExitFullscreen).call(document); }
    else {
      var req = shell.requestFullscreen || shell.webkitRequestFullscreen;
      if(req) req.call(shell);
    }
  }

  /* Chargement */
  pdfjsLib.getDocument(PDF_URL).promise.then(function(doc){
    pdf = doc; total = doc.numPages;
    return doc.getPage(1).then(function(p){
      var v = p.getViewport({scale: 1}); ratio = v.height / v.width;
    });
  }).then(function(){
    var q = new URLSearchParams(location.search).get('slide') || location.hash.replace('#', '');
    var n = parseInt(q, 10);
    cur = (n >= 1 && n <= total) ? n - 1 : 0;
    if(loadingEl) loadingEl.style.display = 'none';
    shell.style.display = '';
    if(controls) controls.style.display = '';
    if(hint) hint.style.display = '';
    show();
  }).catch(function(){
    if(loadingEl) loadingEl.innerHTML = 'Le document n\'a pas pu être chargé ici. Vous pouvez l\'ouvrir directement : <a href="' + PDF_URL + '" target="_blank" rel="noopener">le PDF</a>.<br><span style="font-size:.75rem">(La visionneuse fonctionne sur le site publié.)</span>';
  });

  /* Navigation */
  if(prevBtn) prevBtn.addEventListener('click', function(){ go(cur - 1); });
  if(nextBtn) nextBtn.addEventListener('click', function(){ go(cur + 1); });
  if(fsBtn)   fsBtn.addEventListener('click', toggleFs);

  // clic sur la slide : moitié gauche = précédente, moitié droite = suivante (hors liens)
  stage.addEventListener('click', function(e){
    if(e.target.closest && e.target.closest('a')) return;
    var r = stage.getBoundingClientRect();
    if(e.clientX - r.left < r.width * 0.3) go(cur - 1); else go(cur + 1);
  });

  document.addEventListener('keydown', function(e){
    if(!pdf || e.altKey || e.ctrlKey || e.metaKey) return;
    var t = e.target && e.target.tagName;
    if(t === 'INPUT' || t === 'TEXTAREA') return;
    var k = e.key;
    if(k === 'ArrowRight' || k === 'ArrowDown' || k === 'PageDown' || k === ' '){ e.preventDefault(); go(cur + 1); }
    else if(k === 'ArrowLeft' || k === 'ArrowUp' || k === 'PageUp' || k === 'Backspace'){ e.preventDefault(); go(cur - 1); }
    else if(k === 'Home'){ e.preventDefault(); go(0); }
    else if(k === 'End'){ e.preventDefault(); go(total - 1); }
    else if(k === 'f' || k === 'F'){ e.preventDefault(); toggleFs(); }
  });

  // swipe (mobile)
  var x0 = null, y0 = null;
  stage.addEventListener('touchstart', function(e){ var t = e.touches[0]; x0 = t.clientX; y0 = t.clientY; }, {passive: true});
  stage.addEventListener('touchend', function(e){
    if(x0 === null) return;
    var t = e.changedTouches[0], dx = t.clientX - x0, dy = t.clientY - y0;
    if(Math.abs(dx) > 40 && Math.abs(dx) > Math.abs(dy)){ go(cur + (dx < 0 ? 1 : -1)); }
    x0 = y0 = null;
  });

  // redimensionnement / plein écran : nouvelle mise en page et rendu net
  var rt = null;
  function relayout(){ clearTimeout(rt); rt = setTimeout(function(){ if(pdf) show(); }, 150); }
  window.addEventListener('resize', relayout);
  document.addEventListener('fullscreenchange', function(){
    if(fsBtn) fsBtn.textContent = isFs() ? '⤡ Quitter' : '⤢ Plein écran';
    relayout();
  });
  document.addEventListener('webkitfullscreenchange', relayout);
})();
