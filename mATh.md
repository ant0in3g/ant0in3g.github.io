<script
  src="https://cdn.mathjax.org/mathjax/latest/MathJax.js?config=TeX-AMS-MML_HTMLorMML"
  type="text/javascript">
</script>


*Link* : [cours et td de mathématiques](https://bit.ly/antoine-gere-istom-maths)


# Examen de mathématiques du jeudi 12 décembre 2024 

## Exercice 1

On considère la suite $\left(u_{n}\right)_{n \in \mathbb{N}}$ définie par $u_{0}=0$ et par la relation de récurrence

$$
u_{n+1}=\frac{1}{6} u_{n}^{2}+\frac{3}{2}
$$

1. Montrer que pour tout $n \in \mathbb{N}^{*}, u_{n}>0$.
2. Montrer que pour tout $n \in \mathbb{N}, u_{n}<3$.
3. Montrer que la suite est croissante. En déduire si la suite $\left(u_{n}\right)$ est convergente ou non.
4. Calculer la limite de la suite $\left(u_{n}\right)_{n \in \mathbb{N}}$.

## Exercice 2

### Partie A : Etude théorique.

Soit $\left(u_{n}\right)$ la suite numérique définie par $u_{0}=5500$ et pour tout entier naturel $n$,

$$
u_{n+1}=0,68 u_{n}+3560
$$

1. Calculer les quatre premiers termes de la suite $\left(u_{n}\right)$. Si nécessaire vous pourrez représenter ces termes sur un graphique en vous aidant des droites d'équations $y=x$ et $y=0,68 x+3560$. Conjecturer le sens de variation ainsi que la limite de la suite $\left(u_{n}\right)$.
2. Soit $\left(v_{n}\right)$ la suite définie, pour tout entier naturel $n$ par $v_{n}=u_{n}-11125$.
(a) Démontrer que $\left(v_{n}\right)$ est une suite géométrique dont on précisera le premier terme et la raison.
(b) Exprimer alors $v_{n}$, en fonction de $n$. En déduire que, pour tout entier naturel $n$,

$$
u_{n}=11125-5625 \times 0,68^{n} .
$$

(c) La suite $\left(u_{n}\right)$ est-elle convergente?

### Partie B : Mise en pratique.

Une revue spécialisée est diffusée uniquement par abonnement. Une étude statistique a permis de constater que d'une année sur l'autre, $32 \%$ des abonnés ne renouvellent pas leur abonnement et 3560 nouvelles personnes souscrivent un abonnement. En 2010, il y avait 5500 abonnés à cette revue.
3. Donner une estimation du nombre d'abonnés à cette revue en 2012.
4. Pour tout nombre entier naturel $n$, on note $u_{n}$ le nombre d'abonnés à la revue l'année $2010+n$.
(a) Justifier que pour tout entier $n, u_{n+1}=0,68 u_{n}+3560$
(b) Montrer qu'il n'est possible d'envisager au bout d'un nombre d'années suffisamment grand, une diffusion supérieure à 12000 abonnés.
(c) Déterminer l'année à partir de laquelle le nombre d'abonnés à la revue sera supérieur à 11000?

## Exercice 3

Effectuer la décomposition en éléments simples dans $\mathbb{R}[X]$ de la fraction rationnelle suivante :

$$
F(x)=\frac{x^{5}+3 x-1}{(x+3)(x-1)(x+2)}
$$

## Correction de l'exercice 1 A

1. On a $u_{1}=\frac{1}{6} u_{0}^{2}+\frac{3}{2}=\frac{3}{2}$ On va montrer que pour tout $n \geq 1$, alors $u_{n}>0$ entraine que $u_{n+1}>0$.

$$
u_{n+1}=\frac{1}{6} u_{n}^{2}+\frac{3}{2}>\frac{3}{2}>0
$$

C'est bien le cas. Donc pour tout $n \in \mathbb{N}^{*}, u_{n}>0$
2. Faisons un raisonnement par récurrence, $u_{0}=0<3$, montrons que $u_{n}<3$ entraine que $u_{n+1}<3$.

$$
u_{n+1}=\frac{1}{6} u_{n}^{2}+\frac{3}{2}<\frac{1}{6} \times 9+\frac{3}{2}=\frac{3}{2}+\frac{3}{2}=3
$$

Donc pour tout $n \in \mathbb{N}, u_{n}<3$.
3. Calculons $u_{n+1}-u_{n}$

$$
u_{n+1}-u_{n}=\frac{1}{6} u_{n}^{2}+\frac{3}{2}-u_{n}=\frac{1}{6}\left(u_{n}^{2}-6 u_{n}+9\right)=\frac{1}{6}\left(u_{n}-3\right)^{2}>0
$$

La suite $\left(u_{n}\right)_{n \in \mathbb{N}}$ est strictement croissante, comme elle est bornée par 3 , elle convergente
4. La suite $\left(u_{n}\right)_{n \in \mathbb{N}}$ admet une limite $l$,

$$
l=\frac{1}{6} l^{2}+\frac{3}{2} \Leftrightarrow l^{2}-6 l+9=0 \Leftrightarrow(l-3)^{2}=0 \Leftrightarrow l=3
$$

## Correction de l'exercice $2 \Delta$

## Partie A : Etude théorique.

1. On a $u_{0}=3560, u_{1}=5980.8, u_{2}=7626.9$ et $u_{3}=8746.3$.
![](https://cdn.mathpix.com/cropped/2024_12_13_4d0b47a19354ef4751dag-3.jpg?height=1060&width=1192&top_left_y=1660&top_left_x=472)

Graphiquement, la suite $\left(u_{n}\right)$ semble croissante et converger vers l'abscisse du point d'intersection des deux droites :

$$
\begin{aligned}
0,68 x+3650=x & \Leftrightarrow 0,32 x=3650 \\
& \Leftrightarrow x=11125
\end{aligned}
$$

Si, la suite $\left(u_{n}\right)$ admet une limite finie quand $n$ tend vers $+\infty$ alors cette limite est égale à 11125 .
2.
(a) Pour tout entier $n$,

$$
\begin{aligned}
v_{n+1} & =u_{n+1}-11125 \\
& =0,68 u_{n}+3560-11125 \\
& =0,68 u_{n}-7565 \\
& =0,68 \times\left(u_{n}-11125\right) \\
v_{n+1} & =0,68 v_{n}
\end{aligned}
$$

Pour tout entier $n, v_{n+1}=0,68 v_{n}$ alors la suite $\left(v_{n}\right)$ est une suite géométrique de raison 0,68 . Calculons le premier terme de la suite $\left(v_{n}\right)$ :

$$
v_{0}=u_{0}-11125 \text { Soit } v_{0}=5500-11125=-5625
$$

Ainsi, la suite $\left(v_{n}\right)$ est une suite géométrique de raison 0,68 et de premier terme $v_{0}=-5625$.
(b) $\left(v_{n}\right)$ est une suite géométrique de raison 0,68 et de premier terme $v_{0}=-5625$ alors pour tout entier $n$,

$$
v_{n}=-5625 \times 0,68^{n}
$$

Comme pour tout entier $n, v_{n}=u_{n}-11125$ alors $u_{n}=v_{n}+11125$.
Donc pour tout entier $n$,

$$
u_{n}=11125-5625 \times 0,68^{n}
$$

(c) $0<0,68<1$ donc

$$
\lim _{n \rightarrow+\infty} 0,68^{n}=0
$$

d'où

$$
\lim _{n \rightarrow+\infty} 11125-5625 \times 0,68^{n}=11125
$$

Soit

$$
\lim _{n \rightarrow+\infty} u_{n}=11125
$$

La suite $\left(u_{n}\right)$ converge vers 11125 .

## Partie B : Mise en pratique.

3. En 2011 , 32\% des 5500 abonnés ne renouvellent pas leur abonnement et 3560 nouvelles personnes souscrivent un abonnement. En 2011, le nombre d'abonnés est :

$$
5500 \times 0,68+3560=7300
$$

En 2012, 32\% des 7300 abonnés ne renouvellent pas leur abonnement et 3560 nouvelles personnes souscrivent un abonnement. En 2012, le nombre d'abonnés est :

$$
7300 \times 0,68+3560=8524
$$

En 2012, il y a 8524 abonnés à cette revue.
4.
(a) D'une année sur l'autre, $32 \%$ des abonnés ne renouvellent pas leur abonnement et 3560 nouvelles personnes souscrivent un abonnement donc d'une année sur l'autre, $68 \%$ des abonnés renouvellent leur abonnement et 3560 nouvelles personnes souscrivent un abonnement d'où :
Pour tout entier $n, u_{n+1}=0,68 u_{n}+3560$
(b) D'après la partie A , pour tout entier $n, u_{n}=11125-5625 \times 0,68^{n}$. D'où :

$$
\begin{aligned}
u_{n}>12000 & \Leftrightarrow 11125-5625 \times 0,68^{n}>12000 \\
& \Leftrightarrow-5625 \times 0,68^{n}>12000-11125 \\
& \Leftrightarrow 0,68^{n}<-\frac{825}{5625}
\end{aligned}
$$

Or pour tout entier $n, 0,68^{n}>0$.
Une diffusion supérieure à 12000 abonnés n'est pas envisageable.
(c) La calculatrice affiche 10. Donc à partir de 2020, le nombre d'abonnés à la revue sera supérieur à 11000 .

## Correction de l'exercice 3 A

$$
F(x)=\frac{x^{5}+3 x-1}{(x+3)(x-1)(x+2)}=x^{5}+3 x-\frac{1}{12(x-1)}+\frac{1}{3(x+2)}-\frac{1}{4(x+3)}
$$

