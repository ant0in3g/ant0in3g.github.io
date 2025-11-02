
## Loi de Bernoulli

## Loi de probabilité

Loi d'une va qui ne prend que 2 valeurs : 0 et 1

| $x_{i}$ | 0 | 1 |
| :---: | :---: | :---: |
| $p_{i}$ | q | p |

$$
X \rightarrow \operatorname{Bern}(p)
$$

![](https://cdn.mathpix.com/cropped/2025_09_17_68f9d5d55601c91876fcg-54.jpg?height=216&width=272&top_left_y=202&top_left_x=747)

Espérance et variance

$$
\begin{aligned}
& \mathrm{E}(X)=0 \times q+1 \times p=p \\
& \mathrm{E}\left(X^{2}\right)=0^{2} \times q+1^{2} \times p=p \\
& \operatorname{var}(X)=p-p^{2}=p(1-p)=p q
\end{aligned}
$$

$$
\begin{aligned}
\mathrm{E}(X) & =p \\
\operatorname{var}(X) & =p q
\end{aligned}
$$

## Utilisation

Modéliser les résultats d'expériences aléatoires ayant 2 issues possibles (épreuves de Bernoulli)
Exemple : statut maladie d'un individu

## Schéma de Bernoulli

## Principe

Répéter une épreuve de Bernoulli

- $n$ fois
- de façon indépendantes


## Exemple

Observer la présence (ou l'absence) d'effets indésirables sur un échantillon de 10 patients

## Modélisation

Ensemble de $n$ va indépendantes qui suivent toutes la même loi de Bernoulli de paramètre $p$

## Loi Binomiale (1) : introduction

Le problème
Dans la population, $85 \%$ des individus sont de rhésus positif. On considère un groupe de 5 patients : quelle est la probabilité que 2 d'entre eux soient de rhésus positif?
  
  ## Modélisation du problème
  
  Pour un patient : soit $X$ la va représentant son groupe rhésus. On pose :
  
  $$
  \left\{\begin{array}{c}
    X=1 \text { si l'individu est de } \mathrm{Rh}+ \\
X=0 \text { si l'individu est de } \mathrm{Rh}-
      \end{array}\right.
    $$
      
      $X \rightarrow \operatorname{Bern}(p)$ avec $p=\mathrm{P}(R h+)=0,85$
      Pour les 5 patients : soit $S_{n}$ la va représentant le nombre de patients $\mathrm{Rh}+$ On répète 5 fois l'épreuve de Bernoulli de façon indépendante.

$$
S_{n}=X_{1}+X_{2}+X_{3}+X_{4}+X_{5} \quad S n \rightarrow \text { Binomiale }
$$

## Loi Binomiale (2) : loi de probabilité

Loi Binomiale et ses deux paramètres $n$ et $p$
Loi $\mathcal{B}(n, p)$ modélise la répétition de $n$ épreuves de Bernoulli indépendantes, de même probabilité $p$
$\mathrm{P}\left(S_{n}=k\right)$ : probabilité de $k$ succès parmi les $n$ répétitions

$$
\mathrm{P}\left(S_{n}=k\right)=C_{n}^{k}(p)^{k}(1-p)^{n-k} \quad \text { pour } k \in\{0,1,2, \ldots, n\}
$$

Rappels
$\mathrm{C}_{n}^{k}=\binom{n}{k}=\frac{n!}{k!(n-k)!} \quad \mathrm{Nb}$ combinaisons de $k$ éléments parmi $n$
$0!=1$
$n!=1 \times 2 \times \ldots \times n$

## Loi binomiale (3) : représentation graphique

Loi de probabilité
![](https://cdn.mathpix.com/cropped/2025_09_17_68f9d5d55601c91876fcg-58.jpg?height=462&width=575&top_left_y=273&top_left_x=51)

## Loi binomiale (4)

Loi de probabilité et fonction de répartition
![](https://cdn.mathpix.com/cropped/2025_09_17_68f9d5d55601c91876fcg-59.jpg?height=530&width=1102&top_left_y=245&top_left_x=85)

Loi binomiale (4) : espérance, variance et écart-type Soit $S_{n} \rightarrow \mathcal{B}(n, p)$
Formules

$$
\begin{gathered}
\mathrm{E}\left(S_{n}\right)=n p \\
\operatorname{var}\left(S_{n}\right)=n p q \\
\sigma_{S_{n}}=\sqrt{n p q}
\end{gathered}
$$

Comment retrouver les formules?

$$
\begin{aligned}
\mathrm{E}\left(S_{n}\right) & =\mathrm{E}\left(X_{1}+X_{2}+\ldots+X_{n}\right) \\
& =\mathrm{E}\left(X_{1}\right)+\mathrm{E}\left(X_{2}\right)+\ldots+\mathrm{E}\left(X_{n}\right) \\
& =p+p+\ldots+p=n p
\end{aligned}
$$

$$
\begin{aligned}
\operatorname{var}\left(S_{n}\right) & =\operatorname{var}\left(X_{1}+X_{2}+\ldots+X_{n}\right) \\
& =\operatorname{var}\left(X_{1}\right)+\operatorname{var}\left(X_{2}\right)+\ldots+\operatorname{var}\left(X_{n}\right) \quad \text { indépendance } \\
& =n p q
\end{aligned}
$$

## Loi normale ou loi de (Laplace-)Gauss

## Introduction

Loi la plus importante en statistiques

- Elle modélise de nombreux phénomènes
- Elle permet d'approximer plusieurs autres lois, en particulier quand on considère des grands échantillons
    - Condition de nombreux tests statistiques
    
    Paramètres
    2 paramètres :
      
      - $\mu$, son espérance
    - $\sigma$, son écart-type (ou $\sigma^{2}$, sa variance)
    
    Notation : $X \rightarrow \mathcal{N}(\mu ; \sigma)$ mais aussi $X \sim \mathcal{N}(\mu ; \sigma)$
      
      ## Loi normale (2) : densité de probabilité
      
      Expression analytique
    Soit une va $X$ suit une loi normale d'espérance $\mu$ et d'écart-type $\sigma$. Sa densité de probabilité est définie par :
      
      $$
      f(x)=\frac{1}{\sigma \times \sqrt{2 \pi}} \times \exp \left(-\frac{1}{2}\left(\frac{x-\mu}{\sigma}\right)^{2}\right) \quad \forall x \in \mathbb{R}
    $$
      
      Représentation graphique
    ![](https://cdn.mathpix.com/cropped/2025_09_17_68f9d5d55601c91876fcg-62.jpg?height=409&width=909&top_left_y=511&top_left_x=181)
    
    ## Propriétés
    
    Représentation graphique
    ![](https://cdn.mathpix.com/cropped/2025_09_17_68f9d5d55601c91876fcg-63.jpg?height=451&width=588&top_left_y=163&top_left_x=51)
    
    - Symétrie par rapport à l'axe vertical passant par $\mu$
- 2 points d'inflexion d'abscisses $\mu-\sigma$ et $\mu+\sigma$
- Mode $=\mu=$ médiane
- ddp : aire sous la courbe $=1$

Combinaison linéaire de va Gaussiennes indépendantes
Soient $X_{1} \rightarrow \mathcal{N}\left(\mu_{1} ; \sigma_{1}\right)$ et $X_{2} \rightarrow \mathcal{N}\left(\mu_{2} ; \sigma_{2}\right)$ deux va Gaussiennes indépendantes

$$
Y=a X_{1}+b X_{2} \rightarrow \mathcal{N}\left(a \mu_{1}+b \mu_{2} ; \sqrt{a^{2} \sigma_{1}^{2}+b^{2} \sigma_{2}^{2}}\right)
$$

## Fonction de répartition

Expression analytique
Soit une va $X$ suit une loi normale d'espérance $\mu$ et d'écart-type $\sigma$. Sa fonction de répartition est donnée par :

$$
F(x)=\mathrm{P}(X \leq x)=\frac{1}{\sigma \sqrt{2 \pi}} \int_{-\infty}^{x} \exp \left(-\frac{1}{2}\left(\frac{t-\mu}{\sigma}\right)^{2}\right) d t
$$

Calcul de probabilités

$$
\mathrm{P}(a \leq X \leq b)=F(b)-F(a)
$$

L'intégrale ne peut se résoudre de façon algébrique $\rightarrow$ utilisation de tables
    
    ## La loi normale centrée-réduite (ou loi normale standard)
    
    ## Définition
    
    Loi normale d'espérance $\mu=\mathbf{0}$ et d'écart-type $\sigma=\mathbf{1}$
      Passage de $X \rightarrow \mathcal{N}(\mu ; \sigma)$ à $Z \rightarrow \mathcal{N}(0 ; 1)$ :
      
      - On retranche $\mu$ (centrer)
    - On divise par $\sigma$ (réduire)
    
    $$
      Z=\frac{X-\mu}{\sigma}
    $$
      
      Densité de probabilité
    
    $$
      f(z)=\frac{1}{\sqrt{2 \pi}} \times \exp \left(\frac{-1}{2} z^{2}\right)
    $$
      
      ![](https://cdn.mathpix.com/cropped/2025_09_17_68f9d5d55601c91876fcg-65.jpg?height=438&width=571&top_left_y=466&top_left_x=591)
    
    ## Propriété de loi normale centrée-réduite
    
    Représentation graphique
    ![](https://cdn.mathpix.com/cropped/2025_09_17_68f9d5d55601c91876fcg-66.jpg?height=246&width=465&top_left_y=180&top_left_x=85)
    
    - Symétrie par rapport à l'axe des ordonnées
- 2 points d'inflexion d'abscisses -1 et +1
- Mode $=0=$ médiane
- ddp : aire sous la courbe $=1$

Calcul de probabilités
On note $\Phi$ la fdr de la loi normale centrée réduite
$\mathrm{P}(Z \leq z)=\Phi(z)$
$\mathrm{P}(Z \geq z)=1-\mathrm{P}(Z \leq z)=1-\Phi(z)$
$\mathrm{P}(Z \geq z)=\mathrm{P}(Z \leq-z)=\Phi(-z)$ (symétrie de la ddp/axe ordonnées)

$$
\Phi(-z)=1-\Phi(z)
$$

$$
\mathrm{P}(a \leq Z \leq b)=\mathrm{P}(a<Z<b)=\Phi(b)-\Phi(a)
$$

La table de la fonction de répartition (table 1)
![](https://cdn.mathpix.com/cropped/2025_09_17_68f9d5d55601c91876fcg-67.jpg?height=246&width=856&top_left_y=131&top_left_x=208)

Pour une valeur de $z$ donné, la table donne $\mathrm{P}(Z \leq z)$
Exemple
Lire dans la table

- $\mathrm{P}(Z \leq 1,42)$
- $\mathrm{P}(Z \leq-0,21)$
- $\mathrm{P}(Z \geq 0,41)$


## La table de la fonction de répartition (table 1)

![](https://cdn.mathpix.com/cropped/2025_09_17_68f9d5d55601c91876fcg-68.jpg?height=247&width=855&top_left_y=128&top_left_x=208)

Pour une valeur de $z$ donné, la table donne $\mathrm{P}(Z \leq z)$

## Exemple

Lire dans la table

- $\mathrm{P}(Z \leq 1,42)$ - $\mathrm{P}(Z \leq 1,42)=\Phi(1,42)=0,9222$
- $\mathrm{P}(Z \leq-0,21) \quad \mathrm{P}(Z \leq-0,21)=\Phi(-0,21)=1-\Phi(0,21) \mathrm{P}(Z \leq-0,21)=1-0,5832=0,4168$
- $\mathrm{P}(Z \geq 0,41) \quad-\mathrm{P}(Z \geq 0,41)=1-\mathrm{P}(Z \leq 0,41)=1-\Phi(0,41) \mathrm{P}(Z \geq 0,41)=1-0,6591=0,3409$

Table de la fdr pour $p$ donné (table 2)
Attention, changement de table par rapport à 2023/2024
![](https://cdn.mathpix.com/cropped/2025_09_17_68f9d5d55601c91876fcg-69.jpg?height=247&width=856&top_left_y=167&top_left_x=208)

Pour une probabilité $p$ donnée, la table donne $z$ tel que $\mathrm{P}(Z \leq z)=p$
Exemple
Lire dans la table la valeur de $z$ telle que :

- $\mathrm{P}(Z \geq z)=0,025 \rightarrow \mathrm{P}(Z \leq z)=1-0,025=0,975 \rightarrow z=1,96$
- $\mathrm{P}(Z \geq z)=0,75 \quad-\mathrm{P}(Z \geq z)=0,75 \rightarrow \mathrm{P}(Z \leq-z)=0,75$
(Symétrie de la courbe)
on lit $-z=0,6745$, donc $z=-0,6745$


## Le théorème central limite (TCL)

## Énoncé simplifié

Soient $X_{1}, X_{2}, \ldots, X_{n}$ des variables mutuellement indépendantes de même loi de probabilité $\mathcal{L}(\mu, \sigma)$, alors lorsque $n$ est suffisamment grand la variable aléatoire $S_{n}=X_{1}+X_{2}+\ldots+X_{n}$ suit approximativement une loi normale d'espérance $n \times \mu$, et d'écart-type $\sqrt{n} \times \sigma$

Conséquence pour la variable $M$ (moyenne d'échantillon)
$M=\frac{X_{1}+X_{2}+\ldots+X_{n}}{n}$
  Lorsque $n$ est suffisamment grand, alors $M$ suit approximativement une loi normale d'espérance $\mu_{M}=\mu$ et d'écart-type $\sigma_{m}=\frac{\sigma}{\sqrt{n}}$
    
    Remarques
  
  - Dans ce cours, on considèrera $n$ suffisamment grand quand $\mathbf{n} \geq \mathbf{3 0}$
    - Le TCL explique l'importance de la loi normale dans la nature


## Approximation de la loi binomiale par la loi normale

## Approximation

Soit $S_{n} \rightarrow \mathcal{B}(n, p)$ et soit $X \rightarrow \operatorname{Bern}(p)$.

$$
S_{n}=\sum_{i=1}^{n} X_{i}, \text { les } X_{i} \text { étant indépendantes et de même loi que } X
$$

D'après le TCL, on peut approcher la loi de $S_{n}$ par une loi normale $\mathcal{N}(n p ; \sqrt{n p q})$.
  
  En pratique
  Si $n \geq 30, n p \geq 5$ et $n(1-p) \geq 5$, on approchera $\mathcal{B}(n, p)$ par $\mathcal{N}(n p ; \sqrt{n p q})$
    
    
    [^0]:    Remarque
  Une va est une variable quantitative
  
  
  