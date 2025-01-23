## Introduction et prise en main de R et RStudio

R est un langage de programmation et un environnement pour l'analyse de données et les statistiques. Il est largement utilisé en recherche, en sciences des données et en statistiques appliquées. Ce cours fournit une introduction aux bases de R, en mettant l'accent sur les applications statistiques.

![image](./img/R_RStudio_LogoS.png)

---

### Sommaire

1. [Les outils R et RStudio](#1-les-outils-r-et-rstudio)
   - [1.1 Installation de R](#11-installation-de-r)
   - [1.2 Installation de RStudio](#12-installation-de-rstudio)
   - [1.3 Configurationn de RStudio](#13-configuration-de-rstudio)
2. [Les projets avec RStudio](#2-les-projets-avec-rstudio)
3. [Ecrire un script sur RStudio](#3-ecrire-un-script-sur-rstudio)
    - [3.1 Script Quarto](#31-script-quarto)
    - [3.2 Script R](#32-script-r)
4. [Bases du langage R](#4-bases-du-langage-r)
    - [4.1 Obtenir de l’aide sur R](#41-obtenir-de-laide-sur-r)
    - [4.2 Quelques premières notions](#42-quelques-premières-notions)
    - [4.3 Les différents types de données](#43-les-différents-types-de-données)
    - [4.4 Conditions, boucles](#44-conditions-boucles)
        - [4.4.1 If ... Else](#441-if--else)
        - [4.4.2 Nested If](#442-nested-if)
        - [4.4.3 AND, OR](#443-and-or)
        - [4.4.4 Loops](#444-loops)
    - [4.5 Les fonctions](#45-les-fonctions)
    - [4.6 Les graphiques](#46-les-graphiques)
5. [Importation et manipulation des données](#5-importation-et-manipulation-des-données)
    - [5.1 Importer des données dans RStudio](#51-importer-des-données-dans-rstudio)
    - [5.2 Modifier des données importées dans RStudio](#52-modifier-des-données-importées-dans-rstudio)
    - [5.3 Exporter des données depuis RStudio](#53-exporter-des-données-depuis-rstudio)
6. [Ressources](#6-ressources)

---

### 1. Les outils R et RStudio

### 1.1 Installation de R

**R** : Rendez-vous sur le site officiel [CRAN](https://cran.r-project.org/). pour télécharger et installer **R**.

- Pour toutes les personnes utilisant **Linux**, choisissez la bonne page entre parenthèses et suivez les consignes pour télécharger et installer R.
- Pour les personnes utilisant **MacOS**, téléchargez l’installateur en fonction de votre système et lancez-le.
- Pour les personnes utilisant **Windows**, téléchargez l’installateur en cliquant sur `install R for the first time` puis lancez-le. Vous devez aussi installer [**Rtools**](https://cran.r-project.org/)  via le lien sur le CRAN **ou** en utilisant les lignes de code suivantes dans **R** : 

```r
install.packages("utils")
install.packages("installr")
installr::install.Rtools()
```

### 1.2 Installation de RStudio

Rstudio est un IDE.

> En programmation informatique, un IDE (environnement de développement) est un ensemble d'outils qui permet d'augmenter la productivité des programmeurs qui développent des logiciels. 
> Source : [Wikipédia](https://fr.wikipedia.org/wiki/Environnement_de_d%C3%A9veloppement)

Dans cette partie vous allez apprendre à installer **RStudio**, l’environnement dans lequel vous allez coder en **R**.

**RStudio** : L'interface utilisateur graphique que vous allez utiliser pour travailler avec **R**. Téléchargez-le depuis [RStudio](https://posit.co/download/rstudio-desktop/). Choisissez bien l’installateur associé à votre système d’exploitation et suivez les consignes.


### 1.3 Configuration de RStudio

Dans cette partie nous allons apprendre à personnaliser RStudio de sorte à avoir un environnement de travail agréable à utiliser.​

Lorsque que vous ouvrez RStudio pour la première fois, votre écran doit ressembler à ça. 

![image](./img/rstudio-1st-time.png)

Les versions de R et RStudio peuvent être legerement différentes, donc quelques différences sont possibles entre ce que vous avez sur votre ordinateur et ce que vous pouvez observer sur cette capture d'écran.

L’organisation de ces parties est complètement modulable à votre guise dans :

```Tools > Global options```

Nous allons débuter par personaliser le _Pane Layout_.

```Tools > Global options > Pane Layout```

![image](./img/rstudio-config1.png)

- En haut à gauche vous avez la fenêtre **Source**, là où les scripts s’ouvriront.
- En haut à droite la fenêtre  **Environnement,  History,  Connections, VSC, Tutorial, Presentation**. Sélectionnez :
    - Environnement
    - History
    - Connections 
    - Build
    - VCS
    - Tutorial : Cet onglet va vous permettre d’accéder à un ensemble de tutoriels très pratique pour apprendre à coder en R. 
- En bas à gauche la fenêtre **Console**, pour le moment avec Terminal et Background Jobs. Vide à chaque ouverture de RStudio, cette fenêtre est l’endroit où les codes vont être activés.
- En bas à droite la fenêtre **Files, Plots, Packages, Help, Viewer, Presentations**. Sélectionnez :
    - Files
    - Plots
    - Packages
    - Help
    - Viewer
    - Presentations

Nous allons à présent ajuster l’apparence de RStudio suivant nos propres préférences. Le chemin pour ces modification est toujours le même :

```Tools > Global options```

Nous commençons par **R General** :

```Tools > Global options > R General```

![image](./img/rstudio-config2.png)

- Vérifiez si la version préente est la dernière en cliquant sous _R version_ sur **Change**.
- Workspace : Décocher _Restore .RData into workspace at startup_, de même choisissez **Never** pour _Save workspace to .RData on exit_.
- History : Laissez décochés les deux paramètres.
- Other : Laissez cochés les trois premiers paramètres.

Nous passons à **Code/Editing** :

```Tools > Global options > Code > Editing```

![image](./img/rstudio-config3.png)

Sélectionnez _Use native pipe operator_

Nous passons à **Code/Display** :

```Tools > Global options > Code > Display```

![image](./img/rstudio-config4.png)

Sélectionnez _Use rainbow parentheses_

Nous passons à **Appearance** :

```Tools > Global options > Appearance```

![image](./img/rstudio-config5.png)

A vous de sélectionner les options qui vous conviennent le mieux !

> Ne pas oublier de cliquer sur **apply** !

Afin de vérifier si vous avez la bonne version, vous pouvez rentrer dans la Console

```r
sessionInfo()
```
![image](./img/rstudio-check-version.png)

---

### 2. Les projets avec RStudio

Un projet centralise les éléments de travail et facilite la compréhension et la réutilisation du code. Un projet, c’est une manière de travailler qui va vous permettre d’écrire du code, mais pas que. En effet, un projet RStudio est globalement un dossier informatique dans lequel se trouvent des données, des scripts mais aussi de la documentation, des images et tout ce qu’il vous faut pour travailler. Lorsqu’on travaille sous forme de projet, il n’y a pas d'interaction involontaire entre les codes de différents projets.

> **Maintenir les packages R et Rstudio à jour**.
>
> Les packages peuvent être mis à jour dans l'onglet Packages puis en cliquant sur Update ou dans le menu ````Tools > Check for Package Update````. **À faire au moins une fois par mois**.

Lors de la création d’un projet, le dossier ne contient que le fichier  .Rproj  , c’est le projet. Il est très fortement conseillé de créer des sous-dossiers :
- ```data_raw``` (qui regroupent toutes les données brutes)
- ```data``` (qui regroupent les données retravaillées)
- ```doc``` (de la documentation ou tout autre document utile)
- ```img``` (les images utiles à notre projet)

Nous allons à présent créer notre premier projet. Il y a plusieurs chemin pour créer un projet, tous sont équivalents. Une possibilité est de cliquer sur **Project** en haut à droite de votre fenêtre RStudio. 

![image](./img/1st_project_1.png)

Vous avec alors la possibilité de créer un projet à partir d'un dossier vide ou existant. Nous choisirons pour cette prmière fois de créer un projet à partir d'un dossier vide. Nous créons **quatre sous dossiers** : ```data_raw```, ```data```, ```doc``` et ```img```.

![image](./img/1st_project_2.png)

On peut alors observer dans le cadran en bas à droite :
- ```1st_project.Rproj```
- ```data``` 
- ```data_raw```
- ```doc```
- ```img```

---

### 3. Ecrire un script sur RStudio 

#### 3.1 Script Quarto 

**Quarto**, c’est la nouvelle génération de R markdown. De manière basique, vous pourrez générer des documents (qui intègrent ou pas du code R) dans les formats html, word ou pdf, mais avec plus de facilité pour gérer, par exemple, les images, les références croisées. Vous pourrez également réaliser des diapositives, des dashboards et des sites webs, des livres, comme R markdown mais nativement, c’est à dire sans faire appel à des packages complémentaires comme bookdown (livres), xaringan (slides), flexdasboard (dashboard).

Voici un rapide tour d’horizon de la syntaxe, pour plus d’informations :

- Le saut de ligne est marqué par un double espace (en fin d’une ligne).
- Les étoiles servent à marquer : 
    - En italique :  ``` *italique* ```
    - En gras :  ``` **gras** ```
    - En gras et italique :  ``` ***gras et italique*** ```
    - Pour raturer on utiliser les tildes :  ``` ~~raturé~~ ```
- Pour la syntaxe code les impostropes : ``` `code` ```
- Les titres sont précédés de#, autant que de niveaux : 
    - Titre de premier niveau :  ``` # Titre de premier niveau ```
    - Titre de deuxième niveau :  ``` ## Titre de deuxième niveau ```
    - Titre de troisième niveau :  ``` ### Titre de troisième niveau ```

Vous pouvez retrouver les principales syntaxes sur Markdown à cette [page](https://quarto.org/docs/authoring/markdown-basics). 

Nous allons créer notre premier script Quarto.

1. Créer un nouveau document Quarto ```File > New File > Quarto Document```
2. Pour cette premire fois choisissez les options suivantes :

![image](./img/1er-doc-quarto1.png)

3. Vous allez probablement avoir besoin d'installer le package ``` Rmarkdown ```. Pour cela il vous suffit d'aller dans le cadran en bas à droite et de cliquer sur  ```Packages``` puis ```Install```. Une boite de dialogue s'ouvre :

![image](./img/install-package-rstudio.png)

Cliquez sur **Install**, et enregistrez votre script. Le script Quarto apparrait alors dans le cadran en bas à droite dans la fenetre Files. Vous pouvez vous amuser avec ce script, lancer les morceaux de code R. Pour générer le document **html** cliquer sur la petite fleche bleue **Render the current document**, ou utilser le raccourci ```Ctrl + Shift + K```.

Si vous souhaitez modifier la le format de sortie, par exemple récupérer un pdf à la place d'un html, il vous suffit d'crire **pdf** à la place de **html** dans le code : fenetre en haut à gauche puis Source.

Un [ensemble d'exemple](https://quarto.org/docs/gallery/) de ce qui est possible de faire avec **Quarto**.

#### 3.2 Script R

Nous allons créer notre premier script R.

- Créer un nouveau document Quarto ```File > New File > R Script```
- Enregistrer votre script
- Ecrivez votre première ligne de code sur R :
```r
2 + 3
```
- Enregistrez votre script
- Cliquer sur Run, en haut à droite du cadran en haut à gauche.

> Dans la partie suivante nous allons voir les bases du language R.

---

### 4. Bases du langage R

Nous allons travailler dans notre script  R.

#### 4.1 Obtenir de l’aide sur R

Le système d'aide en ligne fourni avec **R** est accessible via la commande ```help()```. Lorsque l'on connaît le nom de la commande **R**, par exemple, ```cmd```, on peut taper ```help(cmd)``` ou ```?cmd``` (sauf dans le cas de certains opérateurs). Sinon, on peut rechercher à partir de mots-clés en tapant ```help. search()```. Une alternative pour la recherche par motif consiste à utiliser ```apropos()```. Pour connaître toutes les commandes fournies par un package (e.g., ```pkg```), il suffit de taper ```help(package=pkg)```.

#### 4.2 Quelques premières notions

Nous avons vu que R peut effectuer des opérations mathématiques. Par exemple :

```r
2 + 3
```

ou encore

```r
2 * 3
```

Pour récupérer du texte en sortie, il est nécesaire de l'écrire de cette façon :

```r
"ISTOM, Ecole supérieure d'agro-développement international"
```

Sans les guillemets R retourne une erreur.

En revanche pour récupérer des nombres en sortie, il suffit simplement de rentrer ces nombres :

```r
105
8
89
2576
978364
```

Afin d'ajouter des commentaires dans votre code (tres fortement conseillé), il suffit d'écrire :

```r
# L'école la plus cool ;-)
"ISTOM, Ecole supérieure d'agro-développement international"
```

Il est très souvent utile de créer des variables. Cela se fait de la manière suivante

```r
ecole <- "ISTOM"
adresse <- "4 Rue Joseph Lakanal, 49000 Angers"
date_creation <- 1908
```

De cette façon si ensuite vous rentrez 

```r
ecole
```

il vous sortira simplement **ISTOM**. 

On peut également manipuler ces variables. Par exemple :

```r
paste("L'",ecole,"a été créée en",date_creation) 
```

ou encore

```r
date_creation <- 1908
nombre_etudiant_promotion <- 60

(2025-date_creation)*nombre_etudiant_promotion
```

On peut attribuer la même valeur à plusieurs variables.

```r
var1 <- "Angers"
var2 <- "Angers"
var3 <- "Angers"

var1
var2
var3
```

#### 4.3 Les différents types de données

Il existe différents types de données sur R, on peut citer :
- ```numeric``` - (10.5, 55, 787)
- ```integer``` - (1L, 55L, 100L, où le "L" informe R que c'est un integer)
- ```complex``` - (9 + 3i)
- ```character / string``` - ("k", "Les stat c'est cool", "FALSE", "11.5")
- ```logical / boolean``` - (TRUE or FALSE)

On peut vérifier le type de donnée d'une variable en utilisant la fonction ```class()```.

```r
# numeric
x <- 10.5
class(x)

# integer
x <- 1000L
class(x)

# complex
x <- 9i + 3
class(x)

# character/string
x <- "R is exciting"
class(x)

# logical/boolean
x <- TRUE
class(x) 
```

Il y a trois types de nombres : ```numeric```, ```integer``` et ```complex```. On peut convertir un nombre d'un type à un autre en utilsant les fonctions :
- ```as.numeric()```
- ```as.integer()```
- ```as.complex()```

Plusieurs fonctions utiles pour les ```character / string``` :
- Connaitre la longueur d'une string : ```nchar(ecole)```
- Savoir si une string est contenue dans une autre string : ```grepl("I",ecole)```
- Regrouper deux strings : paste("Cette ecole a été créée en",date_creation) 

En ce qui concerne les vraiables ```logical / boolean``` on a simplement :
```r
10 > 9    # TRUE car 10 est plus grand que 9 !
10 == 9   # FALSE car 10 n'est pas egale à 9 !
10 < 9    # FALSE car 10 est plus grand que 9 ! 
```

Quelques outils d'arithmétques :
```r
2 + 3 # Addition 	
2 - 3 # Subtraction 	
2 * 3 # Multiplication 	
2 / 3 #	Division
2^3 # Exponent
```

Quelques outils de comparaison 
```r
3 == 3 # Check if equal 	
5 != 3 # Check if not equal	
5 > 3 # Check if 5 is greater than 3	
5 < 3 # Check if 5 is less than 3 
5 >= 3 # Check if 5 is greater than or equal to 3
5 <= 3 # Check if 5 is less than or equal to 3
```

On peut ranger ces données dans différents objets :

- **Vecteurs** : Une séquence d'éléments du même type.
```r
x <- c(55, 1, 2, 3, 4)
x
length(x)
sort(x)
x[3]
x[c(1,3)]
x[c(-1)]
x[4] <- 100 
x
```
-**Listes** : Une séquence d'éléments qui peuvent être différents.
```r
ma_liste <- list("apple", "banana", "cherry")
ma_liste
ma_liste[1]
ma_liste[2] <- "pineapple"
length(ma_liste)
"apple" %in% ma_liste 
append(ma_liste,"orange",after=3)
```
- **Matrices** : Tableau à deux dimensions.
```r
mat <- matrix(1:9, nrow = 3, ncol = 3)
mat
mat[1,2]
mat[1,]
mat[,2]
mat[c(1,2),] 
mat[,c(1,2)] 
mat_add_column <- cbind(mat,c(50,8,47))
mat_add_column
mat_add_row <- rbind(mat,c(50,8,47))
mat_add_row
mat_remove_line_column_one <- mat[-c(1), -c(1)]  #Remove the first row and the first column
mat_remove_line_column_one
dim(mat)
```
- **Data frames** : Tableau avec colonnes pouvant contenir différents types de données.
```r
df <- data.frame(
    Age = c(25, 30, 35), 
    Sexe = c('Homme', 'Femme', 'Homme'))
df
summary(df)
df[1]
df[["Age"]]
```
- **Facteurs** : c'est un vecteur dont les éléments ne peuvent prendre que des modalités prédéfinies. Ce qui caractérise un facteur dans **R** est le fait qu’elle dispose de l’attribut Levels (niveaux). En pratique, un facteur est typiquement utilisé pour stocker les valeurs observées d’une variable catégorielle (couleur, sexe, jours de la semaine, religion, ...).
```r
music_genre <- factor(c("Jazz", "Rock", "Classic", "Classic", "Pop", "Jazz", "Rock", "Jazz"))
music_genre
levels(music_genre) 
length(music_genre) 
music_genre[3] 
music_genre[3] <- "Pop"
music_genre
```

#### 4.4 Conditions, boucles

##### 4.4.1 If ... Else

Le mieux est d'illustrer ceci sur un exemple :
```r
a <- 200
b <- 33

if (b > a) {
  print("b is greater than a")
} else if (a == b) {
  print("a and b are equal")
} else {
  print("a is greater than b")
}  
```

##### 4.4.2 Nested If 

Sur un exemple :
```r
x <- 41

if (x > 10) {
  print("Above ten")
  if (x > 20) {
    print("and also above 20!")
  } else {
    print("but not above 20.")
  }
} else {
  print("below 10.")
} 
```

##### 4.4.3 AND, OR

Un exemple pour **AND**
```r
a <- 200
b <- 33
c <- 500

if (a > b & c > a) {
  print("Both conditions are true")
} 
```

Un exemple pour **OR**
```r
a <- 200
b <- 33
c <- 500

if (a > b | a > c) {
  print("At least one of the conditions is true")
}
```

##### 4.4.4 Loops

**R** a deux commandes pour les boucles :
- ```while``` loops
- ```for``` loops

```r
i <- 1
while (i < 6) {
  print(i)
  i <- i + 1
}
```

un autre exemple

```r
i <- 1
while (i < 6) {
  print(i)
  i <- i + 1
  if (i == 4) {
    break
  }
} 
```

Un dernier exemple pour illsutrer la fonction **next**
```r
i <- 0
while (i < 6) {
  i <- i + 1
  if (i == 3) {
    next
  }
  print(i)
} 
```

Un exemple pour une boucle ```for```
```r
fruits <- list("apple", "banana", "cherry")

for (x in fruits) {
  print(x)
} 
```
ou encore
```r
adj <- list("red", "big", "tasty")
fruits <- list("apple", "banana", "cherry")
  for (x in adj) {
    for (y in fruits) {
      print(paste(x, y))
  }
} 
```

#### 4.5 Les fonctions

Pour créer une fonction on écrit :
```r
 my_function <- function() { # create a function with the name my_function
  print("L'ISTOM c'est top!")
} 

my_function()
```

On peut créer des fonctions avec des arguments :
```r
ma_promo <- function(promo,groupe) {
  paste("Promotion", promo, "groupe", groupe)
}

ma_promo(114,"A")
ma_promo(115,"B") 
```

On a également :
```r
ma_multiplication <- function(x) {
  return (5 * x)
}

print(ma_multiplication(3))
print(ma_multiplication(5))
print(ma_multiplication(9)) 
```

#### 4.6 Les graphiques

Le mieux est d'encore de travailler sur des exemples. Pour tracer le point de coordonnées (1,3) on écrit :
```r
plot(1, 3) 
```

pour tracer les points de coordonnées (1,3) et (8,10) on écrit :
```r
 plot(c(1, 8), c(3, 10)) 
```

de la même façon on a :
```r
x <- c(1, 2, 3, 4, 5)
y <- c(3, 7, 8, 9, 12)

plot(x, y)
```

pour tracer les points (1,1), (2,2), (3,3), ..., (10,10) on peut écrire
```r
plot(1:10) 
```

si on veut tracer une ligne qui passe par ces points on écrit
```r
plot(1:10, type="l",lwd=2, lty=3) 
```
L'argument ```lwd``` permet de modifier l'epaisseur de la ligne tracée, sachant que 0.5 correspond à 50% et 2 à 200%. L'arguement ```lty``` permet de modifier le style de la ligne :
- 0 removes the line
- 1 displays a solid line
- 2 displays a dashed line
- 3 displays a dotted line
- 4 displays a "dot dashed" line
- 5 displays a "long dashed" line
- 6 displays a "two dashed" line


On peut affiner la présentation de notre graphique : 
```r
plot(1:10, main="My Graph", xlab="The x-axis", ylab="The y axis",col="green",cex=0.5,pch=11) 
```

L'argument ```cex``` permet de réduire ou augementer a taille des points, sachant que 0.5 correspond à 50% et 2 à 200%. L'argument ```pch``` permet de changer le style des points tracés, de 0 à 25 : 
![image](./img/pch.png)


Un autre exemple 
```r
line1 <- c(1,2,3,4,5,10)
line2 <- c(2,5,7,8,9,10)

plot(line1, type = "l", col = "blue")
lines(line2, type="l", col = "red") 
```

Pour comparer des données sur un graphe :
```r
x1 <- c(5,7,8,7,2,2,9,4,11,12,9,6)
y1 <- c(99,86,87,88,111,103,87,94,78,77,85,86)

x2 <- c(2,2,8,1,15,8,12,9,7,3,11,4,7,14,12)
y2 <- c(100,105,84,105,90,99,90,95,94,100,79,112,91,80,85)

plot(x1, y1, main="mon titre", xlab="l'axe x", ylab="l'axe y", col="red", cex=2)
points(x2, y2, col="blue", cex=2)
```

**Pie Charts - Diagramme circulaire**

```r
x <- c(10,20,30,40)
mylabel <- c("Apples", "Bananas", "Cherries", "Dates")
colors <- c("blue", "yellow", "green", "black")
pie(x,, label = mylabel, main = "Fruits",col = colors,init.angle = 90) 
legend("bottomright", mylabel, fill = colors) 
```

**Bar Charts**

```r
x <- c("A", "B", "C", "D")
y <- c(2, 4, 6, 8)
barplot(y, names.arg = x, col = "red",density = 10,width = c(1,2,3,4))
barplot(y, names.arg = x, horiz = TRUE) 
```

---

### 5. Importation et manipulation des données

#### 5.1 Importer des données dans RStudio

RStudio est l’environnement qui va vous permettre d’analyser vos données. Vous allez maintenant apprendre à charger des données dans RStudio, les modifier puis les ressortir de RStudio.

Nous allons apprendre à ouvrir un fichier CSV consacré que voustéléchargerez sur le site [open data](https://www.data.gouv.fr/fr/datasets/) du gouvernement. Choisissez un jeu de donnée qui vous interesse. Vous enregistrer ce fichier dans le dossier ```data_raw``` de votre projet sous R. Ce fichier CSV est un fichier texte où les données sous formes de tables sont séparées par des virgules. C’est le format de table par excellence à privilégier car nativement pris en compte par R, sans limite de lignes, contrairement à Excel. Pour ma part j'ai choisi ce [jeu de données](https://www.data.gouv.fr/fr/datasets/mixite-dans-le-groupe-edf/).

- Télécharger le jeu de données au format CSV
- Enregistrer ce fichier CSV dans le dossier ```data_raw``` de votre projet sous R
- Sous R, rentrer le code :  
```r
mixite_groupe_edf <- read.csv("data_raw/mixite-dans-le-groupe-edf.csv",sep = ";")
```
- Vous récupérer dans le cadran en haut à droite, dans Environment, l'ensemble des varaibles de votre fichier CSV


> Pour éviter les erreurs : Lisez la page d’aide avant d’utiliser une fonction pour la première fois grâce à la fonction ```help()```  ou l’onglet **Help**.

Ecrivez sous R
```r
> help("read.csv")
```
Vous récupérez dans le cadran en bas à droite la documentation de la fonction ```read.csv```.

> **Il est cependant fréquent que les données ne soit pas regroupées dans un fichier CSV, mais directement dans un fichier Excel.**

Il est nécessaire de charger le package ```readxl```. Deux possibilités s'offrent à nous, soit on procède comme précement pour le package ```rmarkdown```, soit on écrit sur la ligne de code suivante :
```r
install.packages("readxl")
```
Et maintenant nous allons charger les données d'un fichier excel récupérer sur [ce site](https://stats.mom.gov.sg/Pages/Occupational-Wages-Tables2022.aspx).
```r
library(readxl)
salaire <- read_excel("data_raw/mrsd_2022Wages_Occ_Ind_List.xlsx")
```
Cela ne fonctionne malheuresement pas très bien. Il est nécessaire de péciser l'onglet sur lequel on va travailler et les celules qui nous intéressent.
```{r}
library(readxl)
salaire <- read_excel("data_raw/mrsd_2022Wages_table4.xlsx", sheet = "T4", range = "B10:J352")
```
Enfin pour ajouter les titre de chacune des colonnes on écrit
```{r}
library(readxl)
salaire <- read_excel("data_raw/mrsd_2022Wages_table4.xlsx", sheet = "T4", range = "B10:J352", col_names = {
  c("SSOC 2020","Occupation","Number Covered","Basic Wage - 25th Percentile ($)", "Basic Wage - Median  ($)","Basic Wage - 75th Percentile ($)","Gross Wage - 25th Percentile ($)", "Gross Wage - Median  ($)","Gross Wage - 75th Percentile ($)")})
```

#### 5.2 Modifier des données importées dans RStudio

coming.

#### 5.3 Exporter des données depuis RStudio

coming. 

---

### 6. Ressources
- [Documentation officielle de R](https://cran.r-project.org/manuals.html)
- [Introduction à R par RStudio](https://posit.co/resources/)

---

Avec ce premier cours, vous êtes prêts à débuter votre exploration statistique avec **R**. Bonne analyse !






































# TP01: Découverte de R - Exercices 

Justine Guégan - j.guegan-ihu@icm-institute.org

31 mai 2017

Ce polycopié rassemble différents exercices vous permettant d'apprendre à utiliser le langage de programmation R. Ces exercices sont de difficultés variables. Il est important de réaliser les exercices les plus simples avant de débuter les plus difficiles.

## Manipulation des objets R (vecteurs, facteurs, listes, tableaux, et matrices)

## Exercice 1

Soit a=c("lannister", "targaryen", "baratheon", "starck", "greyjoy")

1. Quelle est la longueur du vecteur ? indice : length
2. Essayez de faire a[1:3]. Qu'obtenez-vous ?
3. Créez un nouveau vecteur b ne contenant que lannister et starck.
4. Essayez de faire a[-1]. Qu'obtenez-vous ?
5. Triez par ordre alphabetique. indice : sort ?
```
a=c("lannister", "targaryen", "baratheon", "starck", "greyjoy")
length(a)
a[1:3]
b = a[c(1,4)]
a [-1]
sort(a)
```


## Exercice 2

1. Créez un vecteur a contenant tous les entiers de 1 à 100. Indice: ":".
2. Ajoutez les valeurs 200, 201, 202 au vecteur a. Indice : c().
3. Créez un vecteur b contenant tous les entiers pairs de 2 à 100. Indice: seq.
$\mathrm{a}=\mathrm{c}(1: 100)$
c (a, 200, 201, 202)
$b=\operatorname{seq}($ from $=2$, to $=100$, by $=2$ )

## Exercice 3

1. Créer le vecteur vec1 contenant tous les multiples de 2 compris entre 1 et 50 .
2. Créer le vecteur vec 2 contenant 3 fois chacun des 10 chiffres (soit $0,0,0 ; 1,1,1 ; 2,2,2 ; 3,3,3$; etc.). Indice: $r e p()$
3. Créer le vecteur vec3 contenant une fois le chiffre 1, deux fois le chiffre 2 , trois fois le chiffre $3 \ldots$ et 20 fois le chiffre 20. Quelle est la longueur de cette suite? Indice: length()

Pensez à bien regarder l'aide des fonctions. Par exemple, pour la fonction rep regardez bien la différence entre les paramètres each et times ; vous pouvez copier-coller les lignes d'exemple pour bien comprendre chaque paramètre.

```
#1
vec1 = seq(from=2, to=50, by=2 )
#2
vec2 = rep(c(0:9), each=3)
#3
vec3 = rep(1:20, times = c(1:20))
length(vec3)
```


## Exercice 4

La commande paste permet de concataner du texte.
Essayez paste("chr", 1, sep="").
Créez, en une seule ligne de commande, le vecteur vec4 contenant les noms suivants : chr1, chr2,... , chr22, chrX, chrY. Indice : paste()

```
paste("chr", 1, sep="")
vec4 = paste("chr", c(1:22,"X","Y"), sep="")
```


## Exercice 5 : Facteurs

1. Définissez un facteur fac = factor (c("a", "b", "b", "b", "a", "b", "a", "a")).
2. Calculez le nombre de "a" et de "b" dans fac en utilisant les fonctions which et length et des opérateurs binaires (==).
3. Que permet de faire la fonction table? Appliquez la à fac. Retenez bien la fonction table très très utile!
```
fac = factor(c("a","b","b","b","a","b","a","a"))
length(which(fac == "a"))
length(which(fac == "b"))
table(fac)
```


## Exercice 6 : Matrices

1. Exécutez la commande $a=\operatorname{rep}(c(0,1), 50)$. Qu'a-t-on fait?
2. Utilisez a pour construire une matrice A à 10 lignes et 10 colonnes. indice : matrix ().
3. Affichez les dimensions de cette matrice. Indices : dim, ncol, nrow
4. Utilisez la fonction $t$ sur cette matrice pour créer une matrice B. Que s'est-il passé ?

5 . Les commandes $\mathrm{A}[1: 5$, ] et $\mathrm{B}[, 1: 5]$ permettent de récuperer respectivement les 5 premières lignes de A et les 5 premières colonnes de B. Inspirez-vous de ces commandes pour récupérez dans A les lignes ne contenant que des 1 et dans $B$ les colonnes ne contenant que des 0 .

```
#1
a = rep(c(0,1), 50)
```

```
#2
A = matrix(a, ncol = 10, nrow = 10)
#3
dim(A)
ncol(A)
nrow(A)
#4
B = t(A)
#5
line1 = A[seq(2,10,2),]
col0 = B[,seq(1,10,2)]
```


## Exercice 7 : liste et tableaux de données (data.frame)

1. Créez une liste x contenant:

- une variable aléatoire gaussienne de taille 10 appelée a
- un vecteur contenant uniquement des 1 de taille 10 également, appelé b. On peut accéder aux deux éléments de cette liste avec les commandes $\mathrm{x}[\mathrm{i}]$ ] ou x\$nom_de_la_variable. Indices : list, rnorm.

2. Créez un objet y qui est la transformation de cette liste en data.frame. On peut maintenant parcourir les éléments de chaque objet comme pour une matrice avec la commande y $[i, j]!$ indice $=$ as. data.frame
3. Créez deux objets z1 et z2 contenant respectivement les 3 premières et les 3 dernières lignes de y. Quelle est la classe de ces deux objets ?
4. Rajoutez à la liste x un vecteur chiffre contenant les entiers de 1 à 26 .
5. Essayez de transformer de nouveau $x$ en data.frame. Que se passe-t-il?
```
#1
x = list(
    a = rnorm(10),
    b = rep(1, 10)
)
x[["a"]]
x$a
#2
y = as.data.frame(x)
#3
z1 = y[c(1:3) ,]
z2 = y[c(8:10),]
class(z1)
class(z2)
#4
x$chiffre = 1:26
#5
as.data.frame(x)
```


## Exercice final classe objet : Student's Sleep Data

1. Executez la commande data(sleep). Nous venons de charger en mémoire l'un des nombreux jeux de données distribués avec R ! Profitez de l'aide sur ce jeu de données pour en apprendre un peu plus (?sleep)! Tous les jeux de données disponibles avec l'installation de base de R sont accessibles en tapant data().
2. Quel est le type de l'objet sleep ?
3. Quelle fonction vous permet d'obtenir rapidement le nombre d'individus par groupe? Executez la.
4. Combien y-a-t-il de valeurs négatives dans le groupe 1 ? Indice : which()
5. Soit s un vecteur représentant le sexe des individus: s = rep(c("f","m","m","f","m","f","m","m","f","m"),2). Combinez l'objet sleep et le vecteur s dans une nouvelle matrice sleep2. Indice : cbind()
6. Quelles sont les noms des colonnes de la matrice sleep2? Renommez la dernière colonne en 'sex'. Indice: colnames ()
7. Combien $y$-a-t-il de femmes et d'hommes dans chacun des groupes ?
```
#1
data(sleep)
#2
typeof(sleep); class(sleep)
#3
table(sleep$group)
#4
length(which(sleep$extra < 0))
#5
s = rep(c("f","m","m","f","m","f","m","m","f","m"),2)
sleep2 = cbind(sleep, s)
#6
colnames(sleep2)
colnames(sleep2)[4] = "sex"
#7
table(sleep2$s, sleep2$group)
```


## Lire et sauvegarder des données

## Exercice 8 : Lire les données d'un fichier : fonction read.table

Il est possible de lire les données stockées dans des fichiers sous format txt grÃcce, entre autres, aux fonctions suivantes: read.table(), read.csv(), read.csv2() et scan(). Par ailleurs, la fonction read.xls() (resp. write.xls()) du package gdata fournit les outils pour lire (resp. écrire) des fichiers au format Excel. Il existe aussi la fonction read.xlsx (resp. write. xlsx) du package xlsx.
(Récupérez les fichiers demandés sur le site $\operatorname{xxxxxxx}$ ). Vous pouvez ouvrir au préalable ces différents fichiers dans un éditeur de texte afin d'identifier le séparateur de colonnes, le symbole de décimale, comment sont définies les valeurs manquantes etc...

1. Importez dans une variable nommée A le jeu de données nommé auto2004_original.txt. ${ }^{* *}$ Indice : le séparateur de colonne 'tabulation' correspond à "en informatique*
2. Importez dans une variable nommée B le jeu de données auto2004_sans_nom.txt.
3. Importez dans une variable nommée $C$ le jeu de données auto2004_virgule.txt.
4. Importez dans une variable nommée D le jeu de données auto2004_don_manquante.txt. Combien de valeurs manquantes sont contenues dans le fichier?
5. Importez dans une variable nommée E le jeu de données auto2004_don_manquante (99999).txt.
6. Quel est le mode des objets créés par la fonction read.table() ?
```
Indice: help("read.table"),help("is.na")
#1
A = read.table(file="auto2004_original.txt", sep="\t", header = TRUE)
#2
B = read.table(file="auto2004_sans_nom.txt", sep="\t", header = FALSE)
#3
C = read.table(file="auto2004_virgule.txt", sep="\t", header = TRUE, dec = ",")
#4
D = read.table(file="auto2004_don_manquante.txt", header = TRUE, sep="\t", na.strings = "")
nb = length(which(is.na(D) == TRUE))
#5
E = read.table(file="auto2004_don_manquante(99999).txt", header = TRUE, sep="\t", na.strings = "99999")
#6
class(E)
```


## Exercice 9 : Enregistrer des données

Créer la matrice suivante :

$$
A=\left[\begin{array}{cccc}
1 & 2 & 3 & 4 \\
5 & 6 & 7 & 8 \\
9 & 10 & 11 & 12
\end{array}\right]
$$

1. Ecrire la matrice A dans un fichier nommé matrice.txt. Que remarquez-vous?
2. Ajouter des arguments à la commande précédente pour retirer des noms aux lignes et aux colonnes du fichier créé.
3. Sauver la matrice $A$ au format . Rdata dans le fichier matriceA. Rdata grâce à la fonction save.
4. Que donne la commande C = load("matriceA.Rdata") ?
5. Sauver toutes les variables dans un fichier nommé "données.Rdata"
```
A = matrix(seq(12), ncol = 4, byrow = TRUE)
#1
write.table(A, file = "matrice.txt")
#2
write.table(A, file = "matrice.txt", row.names = FALSE, col.names = FALSE)
#3
save(A, file="matriceA.Rdata")
#4
C = load("matriceA.Rdata")
### la matrice A est rechargée.
```

```
### la variable C vaut "A"
#5
save(list = ls(), "données.Rdata")
```


## Fonctions graphiques

## Exercice 10 : quelques graphiques de base en $R$

1. Chargez le jeu de données irisdéjà présent dans $R$.
2. Pour chaque espèce de fleurs, indiquez le nombre de lignes.
3. A partir du résultat précédent, réalisez une représentation en camembert (pie chart), puis en bâtons (barplot). Indice pie()
4. Tapez la ligne de commande suivante : summary (iris).

Quel résultat obtenez-vous ?
5. Une représentation adéquate est la boîte à moustache (boxplot). Créez un boxplot pour les 4 variables numériques du jeu de données iris. Indice boxplot()
6. Réalisez le même graphique en ajoutant un titre et en supprimant les valeurs extrêmes.
7. Représentez le pie chart et le boxplot sur la même fenêtre graphique. Indice par(), option mfrow.
8. Exportez le graphique précédent en pdf sur votre machine. Indice pdf() ; dev.off()
9. Représenter un scatter plot simple avec en abscisse la longueur des pétales et en ordonnées leur largeur. Indice plot
10. Afin de découvrir les différents paramètres de la fonction plot, refaite le même graphique qu'à la fonction précédente en :

- augmentant la taille des points Indice : cex
- remplaçant les points par des triangles de couleur rouge Indice pch option
- ajoutant une ligne horizontale en pointillé à $y=1$ Indice : abline

```
#1
data(iris)
#2
p = table(iris$Species)
#3
pie(p)
barplot(p)
#4
summary(iris)
#5
boxplot(iris[,1:4])
```

```
#6
boxplot(iris[,1:4], title="Iris Boxplot", outline=FALSE)
#7
par(mfrow=c(1,2))
boxplot(iris[,1:4], title="Iris Boxplot", outline=FALSE)
pie(p)
#8
pdf("plotIris.pdf")
par(mfrow=c(1,2))
boxplot(iris[,1:4], title="Iris Boxplot", outline=FALSE)
pie(p)
dev.off()
#9
plot(iris$Petal.Length, iris$Petal.Width)
#10
plot(iris$Petal.Length, iris$Petal.Width, cex=5)
plot(iris$Petal.Length, iris$Petal.Width, pch=17, col="red")
abline(h=1, lty=2)
#9
pairs(iris[,1:4], col=as.numeric(iris$Species), pch=16)
#10
pdf("pairs_iris.pdf")
pairs(iris[,1:4], col=as.numeric(iris$Species), pch=16)
dev.off()
```


## Exercice 11 : distribution et density plot

1. Charger le jeu de données airquality.
2. Prendre connaissance des données (dimension, type).
3. Construire un histogramme de la variable Ozone. Représenter l'histogramme en terme de probabilité de densité plutôt qu'en terme de fréquence (axe Y). Ajouter un titre, modifier le noms des axes, et colorer les barres de l'histogramme en gris et les traits de l'histogramme en bleu. Augmenter la taille du pas de l'histogramme à 30 .
4. Regarder l'aide de la fonction density (). Appliquer cette fonction à la variable Ozone. Cela retourne-t-il une erreur ? Pourquoi ? Corriger la en spécifiant une option.
5. Ajouter la courbe de densité précédemment générer à l'histogramme. Indice lines()
```
data(airquality)
hist(airquality$Ozone)
hist(airquality$Ozone, freq=FALSE, main="Histogramme Ozone", xlab="Ozone", ylab="Densité", col = "gray"
hist(airquality$Ozone, freq=FALSE, main="Histogramme Ozone", xlab="Ozone", ylab="Densité", col = "gray"
        breaks=30)
d = density(airquality$Ozone, na.rm=TRUE)
lines(d)
```


## Manipulation des boucles et réalisations de tests

Exercice 12: for

1. Lisez l'aide sur la procédure permettant de réaliser des boucles indicées for (help("for")). Remarque : demander de l'aide sur cette procédure avec la syntaxe ?for ne fonctionnera pas! Pourquoi?
2. Créer une boucle qui affiche l'indice i de l'itération en cours (10 itérations)
3. A l'aide d'une boucle, calculez la somme des entiers pairs compris entre 1 et 100 .
```
#1
help("for")
#2
for (i in 1:10) print(i)
#3
somme = 0
for (i in seq(2,100,2)) {
    somme = somme + i
}
somme
```

Exercice 13 : for, if et else

1. Comme dans l'exercice précédent, lisez l'aide de la procédure conditionnelle if : (help("if")).
2. Utilisez les structures if et else pour créer un programme qui prend en entrée un réel $x$ et qui lui associe $y=x^{2}$ si $x$ est strictement positif et $y=x^{3}$ si $x$ est négatif ou nul. Testez pour les valeurs $x=$ $25,-2,12$ et 0 .
3. Utilisez les structures if et else pour créer un programme qui imprime à l'écran, pour chaque entier relatif $i$ compris entre -10 et $10, i^{3}$ si $i<=0$, ou $i^{2}$ si $i>0$.
```
#1
help("if")
#2
x = 25
y = 0
if (x > 0){
    y = x^2
}
else{
    y = x^3
}
#3
for (i in -10:10){
    x = i
    y = 0
    if (x > 0){
        y = x^2
    }
    else{
```

```
        y = x^3
    }
    print(paste(i, y, sep=" => "))
}
```


## Exercice 15 : un moyen plus rapide de faire des boucles en $\mathbf{R}$ !

1. Créer une matrice matrice contenant des valeurs tirées aléatoirement de dimension 10 lignes x 10 colonnes et dont les éléments suivent une loi normale de moyenne nulle et de variance 2.32 .
2. Afficher nombre d'éléments positifs et négatifs de la matrice. Remplacer les nombre négatifs par 0 .
3. Afficher les marges de matrice (sommes des valeurs en lignes et en colonnes). Indice : apply, sum
4. Afficher la moyenne des lignes et des colonnes de la matrice.
5. Un autre moyen d'afficher rapidemment la somme/moyenne des lignes/colonnes d'une matrice, est d'utiliser des fonctions R pré-existantes : rowSums, colSums, rowMeans, colMeans.
```
#1
matrice = matrix(rnorm(n=100, mean = 0, sd = 2.32),nrow = 10, ncol=10)
#2
nbPos = length(which(matrice > 0))
idxNeg = which(matrice < 0)
nbNeg = length(idxNeg)
matrice[idxNeg] = 0
#3
apply(matrice, 1, sum)
apply(matrice, 2, sum)
#4
apply(matrice, 1, mean)
apply(matrice, 1, mean)
#5
rowSums(matrice); colSums(matrice)
rowMeans(matrice); colMeans(matrice)
```


## Créer et utiliser ses propres fonctions $\mathbf{R}$

## Exercice 16 : notre première fonction

1. Exécutez les commandes data(iris) puis str (iris). Nous venons de charger en mémoire l'un des nombreux jeux de données distribués avec $R$ ! Profitez de l'aide sur ce jeu de données pour en apprendre un peu plus sur les fleurs (?iris)! Tous les jeux de données disponibles avec l'installation de base de $R$ sont accessibles en tapant data().
2. Créez la fonction moyenneET suivante et décryptez la:
moyenneET $=$ function(i) $c(m o y=m e a n(i r i s[, i]), ~ e t=s d(i r i s[, i]))$
3. Afficher l'aide de la fonction apply. En utilisant cette fonction, calculez la moyenne et l'écart type des colonnes numériques du dataset iris. Comparer le résultat avec celui obtenu par la foncion moyenneET.

Remarque : pour exécuter plusieurs commandes au sein d'une même fonction, il faut utiliser des accolades \{...\}.

```
#1
data(iris)
str(iris)
moyenneET(2)
#2
moyenneET <- function(i) {
    moy = mean(iris[,i])
    et = sd(iris[,i])
    return( c(moy = moy, et = et) )
}
#3
?apply
moy = apply(iris[,c(1,2,3,4)], 2, mean)
et = apply(iris[,c(1,2,3,4)], 2, sd)
moyenneET(1)
moyenneET(2)
moyenneET(3)
moyenneET(4)
```


## Exercice 17 : une autre fonction toute simple

Créer une fonction nommée somme qui calcule la somme de deux variables x et y passées en arguments.

```
somme = function(x, y){
    resultat = x+y
    return(resultat)
}
```


## Exercice 18 : Nombre mystère

1. Choisir un nombre mystère entre 1 et 100 , et le stocker dans un objet que l'on nommera nombre_mystere. Ensuite, créer une boucle qui à chaque itération effectue un tirage aléatoire d'un entier compris entre 1 et 100 . Tant que le nombre tiré est différent du nombre mystère, la boucle doit continuer. A la sortie de la boucle, une variable que l'on appellera nb_tirages contiendra le nombre de tirages réalisés pour obtenir le nombre mystère.
2. Utiliser le code de la question précédente pour réaliser la fonction trouver_nombre, qui, lorsqu'on lui donne un nombre compris entre 1 et 100, retourne le nombre de tirages aléatoires d'entiers compris entre 1 et 100 nécessaires avant de tirer le nombre mystère.
3. En utilisant une boucle for, faire appel 1000 fois à la fonction trouver_nombre() qui vient d'être créée. A chaque itération, stocker le résultat dans un élément d'un vecteur que l'on appellera nb_essais_rep. Enfin, afficher la moyenne du nombre de tirages nécessaires pour retrouver le nombre magique.

Indice: sample, while

```
# 1
nombre_mystere = 59
s = 0
nb_tirages = 0
while (s != nombre_mystere){
    s = sample(1:100, 1)
    nb_tirages = nb_tirages + 1
}
nb_tirages
# 2
trouver_nombre = function(nombre_mystere){
    if (nombre_mystere >=1 & nombre_mystere <=100){
        s = 0
        nb_tirages = 0
        while (s != nombre_mystere){
            s = sample(1:100, 1)
            nb_tirages = nb_tirages + 1
        }
        nb_tirages
    }
    else{
        warning("Votre nombre doit être compris entre 1 et 100")
    }
}
#3
nb_essais_rep = c()
for (i in seq(1000)){
    tmp = trouver_nombre(39)
    nb_essais_rep = c(nb_essais_rep, tmp)
}
mean(tmp)
```


## Exercice 19 : Création d'une fonction, traitement de chaines de caractères

Supposons que les adresses e-mails des étudiants de centralsupelec soient constituées de la manière suivante: le prénom et le nom de famille séparés par un point, le symbole arobase et enfin le nom de domaine. Supposons de plus que les étudiants ont un seul prénom, et aucune particule au nom de famille. La syntaxe des adresses e-mail est donc comme suit :
nom.prenom@etudiant.centralsupelec.fr.

1. Créer une fonction parseMail, qui à partir d'une adresse e-mail d'un étudiant, retourne un data.frame contenant trois variables : le prénom, le nom et l'adresse e-mail de cet étudiant.
2. Utiliser cete fonction pour créer un data.frame emails.df à partir du vecteur emails, contenant tous les prénoms, noms et adresses e-mail des étudiants
indice : strsplit
```
emails = c( "john.snow@etudiant.centralsupelec.fr",
"patti.smith@etudiant.centralsupelec.fr",
    "rick.grimes@etudiant.centralsupelec.fr",
    "mere.theresa@etudiant.centralsupelec.fr")
```

```
#1
parseMail = function(email){
    nom_prenom = unlist(strsplit(email, "@"))[1]
    nom_prenom = unlist(strsplit(nom_prenom, "\\."))
    prenom = nom_prenom[1]
    nom = nom_prenom[2]
    data.frame(prenom = prenom, nom = nom, email = email)
}
#2
emails.df = c()
for (m in emails){
    df = parseMail(m)
    emails.df = rbind(emails.df,df)
}
```


## Exercice 20 : Fonctions appliquées aux éléments d'une liste

Soit une liste nommée twittos, disponible à l'adresse suivante : https://pf-bb.github.io/CentraleSupelec-R-genomics/
Elle contient des informations fictives sur des utilisateurs de Twitter ; chaque élément de cette liste est une liste dont les éléments sont les suivants:

- screen_name: nom d'utilisateur
- nb_tweets: nombre de tweets
- nb_followers: nombre de followers
- nb_friends: nombre de followings
- created_at: date de création du compte
- location: ville renseignée

1. Importer le contenu du fichier dans la session $R$
2. Utiliser la fonction lapply() sur twittos pour récupérer une liste contenant uniquement les noms d'utilisateurs. Faire de même pour le nombre de followers, puis appliquer unlist() au résultat.
3. Créer une fonction qui, quand on lui fournit un élément de la liste twittos, c'est-à-dire les informations sous forme de liste d'un seul utilisateur, retourne ces informations sous forme de tableau de données. Nommer cette fonction twittos_to_df.
4. Appliquer la fonction twittos_to_df() au premier élément de la liste twittos, puis utiliser la fonction lapply() pour appliquer la fonction twittos_to_df() à tous les éléments de la liste. Stocker ce dernier résultat dans un objet appelé res
5. Quelle est la structure de l'objet res obtenu à la question précédente ?
```
#1
load("twittos.rda")
#2
lapply(twittos, function(twit){twit$screen_name})
#3
twittos_to_df = function(twit){
    return(data.frame(twit))
}
#4
twittos_to_df(twittos[1])
res = lapply(twittos, twittos_to_df)
```


## Exercices de Niveau Avancé

## Exercice 21 : Layout

Les données old faithful geyser ont été collectées dans le cadre d'une étude du temps d'attente entre deux éruptions et la durée des éruptions au sein du parc National de Yellowstone (USA). Ce jeu de données est disponible sous $R$ et est nommé faithful (package datasets). Le seuil critique d'attente au delà duquel la probabilité que la prochaine éruption soit longue et forte est fixé à 63 .

1. Télécharger et visualiser le jeu de données (fonction plot( )), en affichant également la limite des 63 secondes.
2. Calculer un vecteur vec de 100000 points correspondant à la loi normale de moyenne $m$ et d'écart type sd correspondant à la moyenne, et à l'écart type, des durées d'éruption.
3. Construire un histogramme de la durée d'éruption. Représenter l'histogramme en terme de densité plutã't qu'en terme d'effectifs (axe Y). Ajouter un titre, nommer les axes et colorer les barres de l'histogramme en vert et les traits de l'histogramme en rouge. Augmenter la taille du pas de l'histogramme à 20 .
4. Ajouter la densité du vecteur de point vec à l'histogramme (Indice : lines(), density(). Que remarquez-vous ?
5. Afin de mieux apprehender la distribution des données, il est possible d'afficher plusieurs graphiques sur une m $\tilde{A}^{\text {a }}$ me grille. L'objectif de cette partie est d'afficher le scatterplot de la question 1, et au dessus et sur la droite, les histogrammes des variables "eruption" et "waiting", respectivement. Pour cela, nous utiliserons la fonction layout().
5.1 Créer la matrice suivante :
```
layMat = matrix(c(2,0,1,3), ncol=2, byrow=TRUE)
layMat
## [,1] [,2]
## [1,] 2 0
## [2,] 1 3
```

Cette matrice permettra à la fonction layout d'afficher les prochains plot :

- en bas à gauche
- en haut à gauche
- en bas à droite
(n.b : le chiffre 0 indique qu'aucun plot ne pourra $\tilde{\mathrm{A}}^{\text {a }}$ tre affiché dans cette zone)
5.2 Utiliser la fonction layout et la matrice layMat pour créer une grille d'affichage ayant les proportions suivantes, puis afficher le résultats (indice : layout.show()) :
- première colonne : $70 \%$ de la largeur totale
- deuxième colonne : $30 \%$ de la largeur totale
- première ligne : $30 \%$ de la largeur totale
- deuxième ligne : $70 \%$ de la largeur totale
5.3 Afficher sur ce layout les 3 graphiques suivants:
- le scatter plot de la question 1
- l'histogramme de la variable "eruption"
- l'histogramme de la variable "waiting" (indice : pensez à mettre l'hitogramme à l'horizontal)

```
#1
data(faithful)
?faithful
plot(faithful$waiting, faithful$eruptions)
abline(v=63, col="red")
#2
vec = rnorm(100000, mean = mean(faithful$eruptions), sd = sd(faithful$eruptions))
#3
hist(faithful$eruptions, freq = FALSE, main = "Histogramme de la durée des eruptions", xlab = "Durée de
#4
lines(density(vec))
#5
#5.1
layMat = matrix(c(2,0,1,3), ncol=2, byrow=TRUE)
#5.2
layout(layMat, widths=c(0.7, 0.3), heights=c(0.3, 0.7 ))
layout.show(n=3)
    ## scatter plot
plot(faithful, xlim=range(faithful$eruptions), ylim=range(faithful$waiting))
xhist = hist(faithful$eruptions, plot=FALSE, breaks=20)
yhist = hist(faithful$waiting , plot=FALSE, breaks=20)
barplot(xhist$density, axes=FALSE, space=0)
barplot(yhist$density, axes=FALSE, space=0, horiz=TRUE)
```


## Exercice 22: ah si j'étais riche !

Un ami vous propose le jeu suivant. On lance un dé. Si le résultat est 5 ou 6 , on gagne $3 €$, si le résultat est 4 on gagne $1 €$ et si c'est 3 ou moins on perd $2.5 €$. Avant d'accepter la partie, vous essayez de simuler ce jeu, pour voir si vous avez des chances de vous enrichir.

1. Créer une fonction simul qui prend comme argument un entier compris entre 1 et 6 , et qui retourne la somme correspondante.
2. Créer un vecteur tirage, simulant le résultat de 1000 tirages de dés.
3. Afficher sur un graphique la simulation du jeu.
```
Conclusion?
#1
simul = function(i){
    res = NULL
    if (i <= 6 && i >= 1){
        res = switch(i, -2.5, -2.5, -2.5, 1, 3, 3)
    }
    else {
        warning("Un tirage de dès en peut donner qu'un chiffre entre 1 et 6")
    }
    return(res)
}
#2
tirage = sample(x = c(1:6),size = 1000, replace = TRUE )
#3
resultat = sapply(tirage, simul)
gain = cumsum(resultat)
plot(gain)
```


## Exercice 23 : James Bond autour du monde

R contient de nombreux packages nous permettant de faire des représentations graphiques de toutes sortes. Certains packages permettent de faire des représentations spatiales (rgdal, sp, rgeos,cartography). Connu comme une boite à outil dédiée à la cartographie thématique, le package cartography est développé au sein de l'UMS RIATE (CNRS, CGET, Université Paris Diderot) par Nicolas Lambert et Timothée Giraud.

Commencez par installer le package cartograpgy disponible sur le CRAN (via l'utilitaire RStudio ou en ligne de commande).

Nous allons construire une carte dont l'objectif sera de montrer le nombre de fois où 007 s'est rendu dans chaque pays.

Pour cela, télécharger les données disponibles à l'adresse suivante : http://wukan.ums-riate.fr/bond/bondfiles. RData.
Nous avons chargé 2 objets :

- Le data frame BondVisits contient 2 colonnes, l'identifiant des pays (ISO2) et le nombre de visites (n).
- La liste WorldCountries : cette liste est une SpatialPolygonsDataFrame (spdf) contenant la carte de tous les pays du monde.

1. Afficher la carte du monde grÃcce à la fonction plot, qui prend en argument des données au format spdf, avec l'arrière plan en gris. On voit que les marges de la figures sont trop grandes. Modifiez les pour maximiser l'espace pris par la map monde. Redessinez la map monde. Indice par() option mar
2. Ajouter les cercles proportionnels correspondant aux nombres de visites dans chaque pays de 007, avec la couleur de votre choix et des bords blanc. Modifier le titre de la légende de "n" à "Nombres de visites".
3. On veut à présent représenter le nombres de visites par des couches de couleurs différentes plutôt que par des symboles proportionnels. Quelle fonction doit-on utiliser ? Appliquer la fonction aux données. Le résultat obtenu vous parait-il correct?
4. Regarder le contenu de l'objet WorldCountries@data. Construisez un nouveau dataframe contenant tous les pays et les nombres de visites (NA ou 0 si inconnu). Réessayez de créer le graphique de la question précédente. Indice : pour créer le nouveau dataframe, la fonction merge peut vous être utile
```
library(cartography)
load((url("http://wukan.ums-riate.fr/bond/bondfiles.RData")))
head(BondVisits)
plot(WorldCountries, bg="gray")
par(mar = c(0,0,1.2,0))
plot(WorldCountries, bg="gray")
propSymbolsLayer(spdf = WorldCountries, df = BondVisits, var="n", border="white", col="magenta3", legen
choroLayer(spdf = WorldCountries, df = BondVisits, var="n")
BondVisits2 = merge(BondVisits, WorldCountries@data, by="ISO2", all.y=TRUE)
choroLayer(spdf = WorldCountries, df = BondVisits2, var="n", legend.title.txt = "Nombre de visites")
```


## Exercice 24 : Profil CGH

Les technologies de génomique permettent de détecter des abérrations au niveau de notre génome (CNA - Copy Number Alteration) : duplication, remaniement, translocation, perte, etc ... En cancérologie, le génome des tumeurs est souvent anormal (voir la figure "Profil CGH").

Cet exercice a pour objectif de reconstruire ce profil à partir du package "chromosomes" (développé par B. Job, Gustave Roussy) et du jeu de données A01.ASPCF, issu de l'analyse par des microarrays du type "Oncoscan" (Affymetrix) de la tumeur d'un patient.

1. Installer le package 'chromosomes_1.0-0.tgz' (ce fichier est récupérable sur le site du TP). Charger le package avec la commande library(); Enfin, charger le dataset hg19. Ceci importe dans votre session $R$ une variable nommée cs (chromosome structure) décrivant les positions du génome humaine (version hg19).
a. Quelle est la classe de la variable cs ?
b. Combien le génome contient-il de chromosomes? (Indice : parcourir l'obet cs avec la fonction str)
c. Quelle est la taille du génome humain (dans sa version hg19) ?
2. Charger le fichier A01. ascat. ASPCF.RDS dans la variable cgh
a. Quelle est la classe de la variable cgh ?
b. Combien d'éléments contient cette variable ?
c. Quelle est le genre du patient à qui correspond le profil?
3. Construction du profil CNA
![](https://cdn.mathpix.com/cropped/2025_01_23_b80442386fc647adfa35g-17.jpg?height=866&width=1646&top_left_y=242&top_left_x=229)

Figure 1: Profil CGH
a. Construction des vecteurs de points à afficher depuis la variable cgh :

- Créer le vecteur tumor_lr à partir de la variable cgh
- Créer le vecteur x_snp contenant les positions génomique des points de mesure
- Créer le vecteur x_chr contenant les nom des chromosomes auxquels appartiennent les points de mesure
- Créer le vecteur all_chr contenant une seule occurrence de ces noms de chromosomes
b. En utilisant la variable cs, construisez le vecteur chr_length, contenant les longueurs des chromosomes. Utiliser la fonction names et la variable cs pour nommer tous les éléments du vecteur chr_length.
c. Convertir les positions relatives au chromosome du vecteur $x_{-}$snp en position absolue sur le génome (vecteur x_snp_abs)
d. Afin d'afficher une version lissée du signal mesuré, calculer la "running médiane" (Indice : fonction runmed) à partir du vecteur l2r_tumor
e. A partir de ces vecteurs, essayez de reproduire l'image suivante.

Indice: les lignes vertes correspondent à la moyenne des valeurs absolues des différences mesurées entre deux sondes

```
#1
install.packages("chromosomes_1.0-0.tar.gz", repos = NULL, type = "source")
library("chromosomes")
data(hg19)
#1.1
class(cs)
#1.2
str(cs)
length(cs$chromosomes$chrom)
```

![](https://cdn.mathpix.com/cropped/2025_01_23_b80442386fc647adfa35g-18.jpg?height=430&width=1628&top_left_y=300&top_left_x=235)

Figure 2: Ebauche de Profil CGH

```
#1.3
str(cs)
cs$genome.length
#2
cgh = readRDS(file = "data/A01.ascat.ASPCF.RDS")
#2.1
class(cgh)
#2.2
length(cgh)
#2.3
cgh$gender
#3.1
y_tumor_12r = cgh$Tumor_LogR[,1]
x_snp = as.numeric(as.vector(cgh$SNPpos$pos))
x_chr = as.vector(cgh$SNPpos$chrs)
all_chr = unique(x_chr)
#3.2
chr_length = cs$chromosomes$chr.length.toadd
chr_names = cs$chromosomes$chrN
names(chr_length) = chr_names
#3.3
x_snp_abs = x_snp
for (i in all_chr){
    idx = which(x_chr == i)
    if (i == "X") { tmp.chr = 23}
    else if (i == "Y") { tmp.chr = 24}
    else { tmp.chr = as.numeric(i)}
    valtoadd = chr_length[tmp.chr]
```

```
    x_snp_abs[idx] = x_snp_abs[idx] + valtoadd
}
#3.4
l2r_runmed = runmed(y_tumor_l2r , k = 301)
#3.5
plot(x_snp_abs, y_tumor_l2r, ylim = c(-2, 2),col = "gray", pch = ".", ylab = "Log2R", xlab = "", axes =
axis(2)
points(x_snp_abs, l2r_runmed, col="blue", pch = ".")
abline(h = 0, lty = 2, col = "red")
abline(v = c(0,cs$chromosomes$chr.length.sum), lty = 2, col = "black")
box(lwd = 2)
tmp = mean(abs(diff(y_tumor_12r)))
abline(h = c(-tmp, tmp), lty = 2, col = "darkgreen")
pair = seq(from = 2, to = 24, by = 2)
impair = seq(from = 1, to = 23, by = 2)
text(x = cs$chromosomes$mid.chr[pair] + cs$chromosomes$chr.length.toadd[pair], y = 1.7 , labels = a
text(x = cs$chromosomes$mid.chr[impair] + cs$chromosomes$chr.length.toadd[impair], y = -1.7, labels = a
```

