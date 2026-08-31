/* Antoine Géré — commun : bascule de thème + globe terrestre animé + copie de code */
(function(){
  var root=document.documentElement;
  var saved;
  try{ saved=localStorage.getItem('theme'); }catch(e){}
  var theme = (saved==='dark'||saved==='light')
    ? saved
    : (window.matchMedia('(prefers-color-scheme: dark)').matches?'dark':'light');
  root.setAttribute('data-theme',theme);
  document.addEventListener('click',function(e){
    var b=e.target.closest('#themeToggle'); if(!b) return;
    var next=root.getAttribute('data-theme')==='dark'?'light':'dark';
    root.setAttribute('data-theme',next);
    try{ localStorage.setItem('theme',next); }catch(e){}
  });
})();

/* Menu repliable (mobile) : bouton ☰ qui déplie/replie la navigation latérale */
(function(){
  var aside=document.querySelector('aside');
  if(!aside) return;
  var nav=aside.querySelector('nav');
  if(!nav) return;
  var btn=document.createElement('button');
  btn.type='button';
  btn.className='nav-toggle';
  btn.setAttribute('aria-expanded','false');
  btn.setAttribute('aria-controls', (nav.id || (nav.id='site-nav')));
  btn.textContent='☰ Menu';
  var brandRow=aside.querySelector('.brand-row');
  if(brandRow){ brandRow.appendChild(btn); } else { nav.parentNode.insertBefore(btn, nav); }
  document.documentElement.classList.add('has-navmenu');   // n'active le repli du menu que si le bouton existe
  function close(){ nav.classList.remove('open'); btn.setAttribute('aria-expanded','false'); btn.textContent='☰ Menu'; }
  function open(){ nav.classList.add('open'); btn.setAttribute('aria-expanded','true'); btn.textContent='✕ Fermer'; }
  btn.addEventListener('click', function(){ nav.classList.contains('open') ? close() : open(); });
  nav.addEventListener('click', function(e){ if(e.target.closest('a')) close(); });
})();

/* Bouton « copier » sur les cadres de code (hors sorties .out) */
(function(){
  var blocks=document.querySelectorAll('pre:not(.out)');
  blocks.forEach(function(pre){
    if(pre.querySelector('.copy-btn')) return;
    var code=pre.querySelector('code');
    var btn=document.createElement('button');
    btn.type='button';btn.className='copy-btn';btn.textContent='copier';
    btn.setAttribute('aria-label','Copier le code');
    btn.addEventListener('click',function(){
      var txt=(code?code.innerText:pre.innerText);
      var done=function(){btn.textContent='copié !';btn.classList.add('ok');setTimeout(function(){btn.textContent='copier';btn.classList.remove('ok');},1500);};
      if(navigator.clipboard&&navigator.clipboard.writeText){navigator.clipboard.writeText(txt).then(done,function(){fallback(txt);done();});}
      else{fallback(txt);done();}
    });
    pre.appendChild(btn);
  });
  function fallback(t){var ta=document.createElement('textarea');ta.value=t;ta.style.position='fixed';ta.style.opacity='0';document.body.appendChild(ta);ta.select();try{document.execCommand('copy');}catch(e){}document.body.removeChild(ta);}
})();

(function(){
  var cv=document.getElementById('globeCanvas');
  if(!cv||!cv.getContext) return;
  var ctx=cv.getContext('2d'),host=cv.parentNode,dpr=Math.max(1,window.devicePixelRatio||1),size,cx,cy,R;
  function resize(){size=host.clientWidth||52;cv.width=size*dpr;cv.height=size*dpr;ctx.setTransform(dpr,0,0,dpr,0,0);cx=size/2;cy=size/2;R=size/2-3;}
  resize();window.addEventListener('resize',resize);
  var WORLD=[[],[[-50,-15]],[[-110,-70],[-58,-15],[55,110]],[[-125,-70],[-56,-20],[18,32],[60,175]],[[-165,-65],[-52,-25],[8,42],[45,180]],[[-166,-58],[-48,-38],[4,180]],[[-162,-55],[-9,180]],[[-132,-55],[-11,180]],[[-126,-64],[-6,180]],[[-125,-69],[-10,52],[52,146]],[[-123,-75],[-9,40],[34,145]],[[-119,-79],[-9,32],[32,135]],[[-115,-96],[-13,35],[36,122]],[[-110,-96],[-16,36],[38,120]],[[-106,-86],[-17,42],[43,53],[72,111]],[[-93,-82],[-17,46],[74,82],[93,109],[120,127]],[[-84,-76],[-13,48],[99,119],[121,127]],[[-80,-49],[7,44],[99,120]],[[-81,-44],[9,43],[45,50],[100,136]],[[-79,-37],[11,41],[43,50],[104,141]],[[-76,-37],[12,41],[43,50],[122,144]],[[-73,-39],[12,39],[43,50],[113,148]],[[-72,-41],[14,36],[112,153]],[[-74,-47],[15,34],[113,153]],[[-74,-52],[17,31],[114,151]],[[-74,-56],[137,151]],[[-75,-64],[144,149],[166,179]],[[-76,-66]],[[-75,-68]],[],[[-65,-58]],[[-180,180]],[[-180,180]],[[-180,180]],[[-180,180]],[[-180,180]]];
  function isLand(lat,lon){var row=Math.floor((90-lat)/5);if(row<0)row=0;if(row>35)row=35;var rg=WORLD[row];for(var k=0;k<rg.length;k++){if(lon>=rg[k][0]&&lon<=rg[k][1])return true;}return false;}
  var N=620,pts=[],i,phi=Math.PI*(3-Math.sqrt(5)),RAD=180/Math.PI;
  for(i=0;i<N;i++){var y=1-(i/(N-1))*2,r=Math.sqrt(1-y*y),t=phi*i;var x=Math.cos(t)*r,z=Math.sin(t)*r;var lat=Math.asin(y)*RAD,lon=Math.atan2(z,x)*RAD;pts.push([x,y,z,isLand(lat,lon)?1:0]);}
  var ang=0,reduce=window.matchMedia('(prefers-reduced-motion:reduce)').matches;
  function draw(){
    var col=getComputedStyle(cv).color,m=col.match(/\d+/g)||[32,32,29],rgb=m[0]+','+m[1]+','+m[2];
    ctx.clearRect(0,0,size,size);
    ctx.beginPath();ctx.arc(cx,cy,R,0,6.2832);ctx.strokeStyle='rgba('+rgb+',0.28)';ctx.lineWidth=1;ctx.stroke();
    var ca=Math.cos(ang),sa=Math.sin(ang);
    for(i=0;i<N;i++){var p=pts[i],land=p[3];var xr=p[0]*ca-p[2]*sa,zr=p[0]*sa+p[2]*ca;var depth=(zr+1)/2;var sx=cx+xr*R,sy=cy+p[1]*R;
      if(!land&&depth<0.5)continue;ctx.beginPath();
      if(land){ctx.arc(sx,sy,0.45+depth*0.5,0,6.2832);ctx.fillStyle='rgba('+rgb+','+(0.28+depth*0.55).toFixed(3)+')';}
      else{ctx.arc(sx,sy,0.35,0,6.2832);ctx.fillStyle='rgba('+rgb+','+(depth*0.12).toFixed(3)+')';}
      ctx.fill();}
    if(!reduce)ang+=0.006;requestAnimationFrame(draw);
  }
  draw();
})();
