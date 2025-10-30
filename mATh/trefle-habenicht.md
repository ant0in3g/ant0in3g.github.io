### Trèfle de Habenicht

L'équation polaire est 
$$
\rho = 1 +\cos\left(n\theta\right) + \sin^2\left(n\theta\right)
$$

La courbe est : 

<iframe src="https://www.desmos.com/calculator/g8iyyrakaz"
        width="600"
        height="400"
        style="border: 1px solid #ccc;"
        frameborder="0"></iframe>



On se plave dans le plan orthonormé $(O, \vec{i}, \vec{j})$. Pour un paramètre $\theta$ réel, on pose

$$
\overrightarrow{u_{\theta}}=\cos \theta \vec{i}+\sin \theta \vec{j} \quad \text { et } \quad \overrightarrow{v_{\theta}}=-\sin \theta \vec{i}+\cos \theta \vec{j}=\overrightarrow{u_{\theta+\pi / 2}} \text {. }
$$

$M$ étant un point du plan, on dit que [ $r: \theta$ ] est un couple de coordonnées polaires du point $M$ si et seulement si $\overrightarrow{O M}=r \overrightarrow{u_{\theta}}$.

$$
M=[r: \theta] \Longleftrightarrow \overrightarrow{O M}=r \overrightarrow{u_{\theta}} \Longleftrightarrow M=O+r \overrightarrow{u_{\theta}} .
$$

![](https://cdn.mathpix.com/cropped/2025_10_30_af7e7d68bab7eb330d44g-24.jpg?height=418&width=643&top_left_y=2055&top_left_x=451)
![](https://cdn.mathpix.com/cropped/2025_10_30_af7e7d68bab7eb330d44g-24.jpg?height=375&width=478&top_left_y=2095&top_left_x=1119)

### 5.2. Courbes d'équations polaires

La courbe d'équation polaire $r=f(\theta)$ est l'application suivante, où les coordonnées des points sont données en coordonnées polaires :

$$
\begin{array}{lllc}
F: & D & \rightarrow & \mathbb{R}^{2} \\
& \theta & \mapsto & M(\theta)=[r(\theta): \theta]=O+r(\theta) \vec{u}_{\theta}
\end{array}
$$

ou encore, sous forme complexe, $\theta \mapsto r(\theta) e^{\mathrm{i} \theta}$.

## Exemple 18.

Voici une spirale d'équation polaire $r=\sqrt{\theta}$, définie pour $\theta \in[0,+\infty[$.
Par exemple pour $\theta=0, r(\theta)=0$, donc l'origine appartient à la courbe $\mathscr{C}$. Pour $\theta=\frac{\pi}{2}, r(\theta)=\sqrt{\frac{\pi}{2}}$, donc $M\left(\frac{\pi}{2}\right)= \left[\sqrt{\frac{\pi}{2}}: \frac{\pi}{2}\right]$, soit en coordonnées cartésiennes $M\left(\frac{\pi}{2}\right)=(0,1,25 \ldots) \in \mathscr{C}$. Puis $M(\pi)=[\sqrt{\pi}: \pi]=(-1,77 \ldots, 0) \in \mathscr{C}$, $M(2 \pi)=[\sqrt{2 \pi}: 2 \pi]=[\sqrt{2 \pi}: 0]=(2,50 \ldots, 0) \in \mathscr{C}, \ldots$
![](https://cdn.mathpix.com/cropped/2025_10_30_af7e7d68bab7eb330d44g-25.jpg?height=1066&width=1089&top_left_y=799&top_left_x=485)

Une telle équation ( $r=f(\theta)$ ) ressemble à une équation cartésienne ( $y=f(x)$ ). Mais la non unicité d'un couple de coordonnées polaires en fait un objet plus compliqué. Reprenons l'exemple de la spirale d'équation polaire $r=\sqrt{\theta}$. Le point de coordonnées polaires [ $\sqrt{\pi}$ : $\pi$ ] est sur la spirale, mais aussi le point [ $-\sqrt{\pi}: 2 \pi$ ] ( $\operatorname{car}[-\sqrt{\pi}: 2 \pi]=[\sqrt{\pi}: \pi]$ ). Ainsi, si en cartésien on peut écrire $M(x, y) \in \mathscr{C}_{f} \Longleftrightarrow y=f(x)$, ce n'est pas le cas en polaires, où l'on a seulement $r=f(\theta) \Longrightarrow M[r: \theta] \in \mathscr{C}$.
Pour avoir une équivalence, avec $\mathscr{C}$ la courbe d'équation polaire $r=f(\theta)$ et $M$ un point du plan, il faut écrire :

$$
M \in \mathscr{C} \Longleftrightarrow \begin{gathered}
\text { il existe un couple }[r: \theta] \text { de coordonnées } \\
\text { polaires de } M \text { tel que } r=f(\theta)
\end{gathered}
$$

Remarque.

- Dans cette présentation, la lettre $r$ désigne à la fois la première des deux coordonnées polaires du point $[r: \theta]$ et aussi la fonction $\theta \mapsto r(\theta)$, cette confusion des notations étant résumée dans l'égalité $r=r(\theta)$.
- $r(\theta)$ n'est pas nécessairement la distance $O M(\theta)$ car la fonction $r$ peut tout à fait prendre des valeurs strictement négatives. La formule générale est $O M(\theta)=|r(\theta)|$.
- Grâce aux relations usuelles entre les coordonnées cartésiennes et les coordonnées polaires d'un point, on peut à tout moment écrire une représentation polaire sous la forme d'une représentation paramétrique classique :

$$
\theta \mapsto\left\{\begin{array}{l}
x(\theta)=r(\theta) \cos (\theta) \\
y(\theta)=r(\theta) \sin (\theta)
\end{array} .\right.
$$

### 5.3. Calcul de la vitesse en polaires

Pour pouvoir dériver un arc en coordonnées polaires, il faut d'abord savoir dériver le vecteur $\overrightarrow{u_{\theta}}=\cos \theta \vec{i}+\sin \theta \vec{j}$ en tant que fonction de $\theta$ :

$$
\begin{aligned}
& \frac{\mathrm{d} \overrightarrow{u_{\theta}}}{\mathrm{d} \theta}(\theta)=-\sin \theta \vec{i}+\cos \theta \vec{j}=\overrightarrow{v_{\theta}}=\overrightarrow{u_{\theta+\pi / 2}} \\
& \text { et } \quad \frac{\mathrm{d} \overrightarrow{v_{\theta}}}{\mathrm{d} \theta}(\theta)=\overrightarrow{u_{\theta+\pi / 2+\pi / 2}}=\overrightarrow{u_{\theta+\pi}}=-\overrightarrow{u_{\theta}}
\end{aligned}
$$

En résumé, ils s'obtiennent par rotation d'angle $+\frac{\pi}{2}$ :

$$
\frac{\mathrm{d} \overrightarrow{u_{\theta}}}{\mathrm{d} \theta}=\overrightarrow{v_{\theta}} \quad \frac{\mathrm{d} \overrightarrow{v_{\theta}}}{\mathrm{d} \theta}=-\overrightarrow{u_{\theta}}
$$

### 5.4. Tangente en un point distinct de l'origine

Soient $r$ une fonction dérivable sur un domaine $D$ de $\mathbb{R}$ à valeurs dans $\mathbb{R}$ et $\mathscr{C}$ la courbe d'équation polaire $r=r(\theta)$ ou encore de représentation polaire $\theta \mapsto O+r(\theta) \overrightarrow{u_{\theta}}$.

Théorème 5 (Tangente en un point distinct de l'origine).

1. Tout point de $\mathscr{C}$ distinct de l'origine $O$ est un point régulier.
2. Si $M(\theta) \neq O$, la tangente en $M(\theta)$ est dirigée par le vecteur | $\frac{\overrightarrow{\mathrm{d} M}}{\mathrm{~d} \theta}(\theta)=r^{\prime}(\theta) \overrightarrow{u_{\theta}}+r(\theta) \overrightarrow{v_{\theta}}$ |
| :--- |
3. L'angle $\beta$ entre le vecteur $\overrightarrow{u_{\theta}}$ et la tangente en $M(\theta)$ vérifie $\tan (\beta)=\frac{r}{r^{\prime}}$ si $r^{\prime} \neq 0$, et $\beta=\frac{\pi}{2}(\bmod \pi)$ sinon.
![](https://cdn.mathpix.com/cropped/2025_10_30_af7e7d68bab7eb330d44g-26.jpg?height=752&width=1069&top_left_y=1667&top_left_x=493)

Le repère $\left(M(\theta), \overrightarrow{u_{\theta}}, \overrightarrow{v_{\theta}}\right)$ est le repère polaire en $M(\theta)$. Dans ce repère, les coordonnées du vecteur $\frac{\overrightarrow{\mathrm{d} M}}{\mathrm{~d} \theta}$ sont donc ( $r^{\prime}, r$ ). On note $\beta$ l'angle ( $\overrightarrow{u_{\theta}}, \frac{\overrightarrow{\mathrm{d} M}}{\mathrm{~d} \theta}$ ) et $\alpha$ l'angle ( $\vec{i}, \frac{\overrightarrow{\mathrm{~d} M}}{\mathrm{~d} \theta}$ ) de sorte que $\alpha=\beta+\theta$.

Démonstration.

- Comme $M(\theta)=O+r(\theta) \overrightarrow{u_{\theta}}$, alors par la formule de dérivation d'un produit :

$$
\frac{\overrightarrow{\mathrm{d} M}}{\mathrm{~d} \theta}(\theta)=\frac{\mathrm{d} r(\theta)}{\mathrm{d} \theta} \overrightarrow{u_{\theta}}+r(\theta) \frac{\mathrm{d} \overrightarrow{u_{\theta}}}{\mathrm{d} \theta}=r^{\prime}(\theta) \overrightarrow{u_{\theta}}+r(\theta) \overrightarrow{v_{\theta}}
$$

- Déterminons alors les éventuels points singuliers. Puisque les vecteurs $\overrightarrow{u_{\theta}}$ et $\overrightarrow{v_{\theta}}$ ne sont pas colinéaires,

$$
\frac{\overrightarrow{\mathrm{d} M}}{\mathrm{~d} \theta}(\theta)=\overrightarrow{0} \Longleftrightarrow r(\theta)=0 \text { et } r^{\prime}(\theta)=0
$$

Maintenant, comme $r(\theta)=0 \Longleftrightarrow M(\theta)=O$, on en déduit que tout point distinct de l'origine est un point régulier.

- Comme $\frac{\overrightarrow{\mathrm{d} M}}{\mathrm{~d} \theta}(\theta)=r^{\prime}(\theta) \overrightarrow{u_{\theta}}+r(\theta) \overrightarrow{v_{\theta}}$ alors, dans le repère polaire $\left(M(\theta), \overrightarrow{u_{\theta}}, \overrightarrow{v_{\theta}}\right)$, les coordonnées de $\frac{\overrightarrow{\mathrm{d} M}}{\mathrm{~d} \theta}$ sont $\left(r^{\prime}, r\right)$. On a alors

$$
\cos \beta=\frac{r^{\prime}}{\sqrt{r^{2}+r^{\prime 2}}} \quad \text { et } \quad \sin \beta=\frac{r}{\sqrt{r^{2}+r^{\prime 2}}}
$$

Ces égalités définissent $\beta$ modulo $2 \pi$. Ensuite, (puisque $r \neq 0$ ) on a $\frac{1}{\tan \beta}=\frac{r^{\prime}}{r}$. On préfère retenir que, si de plus $r^{\prime} \neq 0, \tan (\beta)=\frac{r}{r^{\prime}}$. Les deux dernières égalités déterminent $\beta$ modulo $\pi$, ce qui est suffisant pour construire la tangente, mais insuffisant pour construire le vecteur $\frac{\overrightarrow{\mathrm{d} M}}{\mathrm{~d} \theta}$.

## Exemple 19.

Déterminer, au point $M\left(\frac{\pi}{2}\right)$, la tangente à la courbe polaire :

$$
r=1-2 \cos \theta
$$

## Solution.

On note $\mathscr{C}$ la courbe.

1. Première méthode. On détermine l'angle $\left(\overrightarrow{u_{\theta}}, \overrightarrow{\mathrm{d} M}\right)$ formé par la tangente avec la droite d'angle polaire $\theta$. Comme $r^{\prime}(\theta)=2 \sin \theta$, alors $r^{\prime}\left(\frac{\pi}{2}\right)=2$. De plus, $r\left(\frac{\pi}{2}\right)=1 \neq 0$. Donc,

$$
\tan \beta=\frac{r\left(\frac{\pi}{2}\right)}{r^{\prime}\left(\frac{\pi}{2}\right)}=\frac{1}{2}
$$

Ainsi, modulo $\pi$,

$$
\beta=\arctan \left(\frac{1}{2}\right)=\frac{\pi}{2}-\arctan (2)
$$

L'angle polaire de la tangente en $M\left(\frac{\pi}{2}\right)$ est donc

$$
\alpha=\beta+\theta=\frac{\pi}{2}+\frac{\pi}{2}-\arctan (2)=\pi-\arctan (2) .
$$

2. Seconde méthode. On calcule le vecteur dérivé, qui bien sûr dirige la tangente :

$$
\frac{\overrightarrow{\mathrm{d} M}}{\mathrm{~d} \theta}\left(\frac{\pi}{2}\right)=2 \cdot \overrightarrow{u_{\pi / 2}}+1 \cdot \overrightarrow{v_{\pi / 2}}=-\vec{i}+2 \vec{j}
$$

Comme la tangente passe par le point $M\left(\frac{\pi}{2}\right)=\left[1: \frac{\pi}{2}\right]=(0,1)$, une équation cartésienne de cette tangente est donc $2 \cdot(x-0)+1 \cdot(y-1)=0$ ou encore $y=-2 x+1$.
![](https://cdn.mathpix.com/cropped/2025_10_30_af7e7d68bab7eb330d44g-28.jpg?height=840&width=997&top_left_y=197&top_left_x=525)

### 5.5. Tangente à l'origine

Supposons maintenant que, pour un certain réel $\theta_{0}$, la courbe passe par l'origine $O$. On suppose comme d'habitude que l'arc est localement simple, ce qui revient à dire qu'au voisinage de $\theta_{0}$, la fonction $r$ ne s'annule qu'en $\theta_{0}$.

Théorème 6 (Tangente à l'origine).
Si $M\left(\theta_{0}\right)=O$, la tangente en $M\left(\theta_{0}\right)$ est la droite d'angle polaire $\theta_{0}$.
![](https://cdn.mathpix.com/cropped/2025_10_30_af7e7d68bab7eb330d44g-28.jpg?height=569&width=563&top_left_y=1439&top_left_x=742)

Une équation cartésienne de cette droite dans le repère ( $O, \vec{i}, \vec{j}$ ) est donc $y=\tan \left(\theta_{0}\right) x$, si $\theta_{0} \notin \frac{\pi}{2}+\pi \mathbb{Z}$ et $x=0$, si $\theta_{0} \in \frac{\pi}{2}+\pi \mathbb{Z}$.

Démonstration. Pour $\theta \neq \theta_{0}$, le vecteur

$$
\frac{1}{r(\theta)} \overrightarrow{M\left(\theta_{0}\right) M(\theta)}=\frac{1}{r(\theta)} \overrightarrow{O M(\theta)}=\overrightarrow{u_{\theta}}
$$

dirige la droite $\left(M\left(\theta_{0}\right) M(\theta)\right)$. Or, quand $\theta$ tend vers $\theta_{0}, \overrightarrow{u_{\theta}}$ tend vers $\overrightarrow{u_{\theta_{0}}}$. Ainsi $\overrightarrow{u_{\theta_{0}}}$ est un vecteur directeur de la tangente, comme on le souhaitait. $\square$

## Remarque.

En l'origine, on ne peut avoir qu'un point d'allure ordinaire ou un rebroussement de première espèce.

- Si $r$ s'annule en changeant de signe, le point $M(\theta)$ franchit l'origine en tournant dans le sens direct : c'est un point d'allure ordinaire.
- Si $r$ s'annule sans changer de signe en arrivant en $O$, on rebrousse chemin en traversant la tangente (puisque l'on tourne toujours dans le même sens) : c'est un rebroussement de première espèce.

