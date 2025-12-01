

### Table des matières

 - [Semestre 1](#semestre-1)
 - [Semestre 2](#semestre-2)
 - [Semestre 3](#semestre-3)
 - [Semestre 4](#semestre-4)
 - [Semestre 5 (optionnel)](#semestre-5)
 - [Examens et corrections](#examens-et-corrections)
 - [Corrections supplémentaires](#corrections-supplémentaires)
 - [Pour aller plus loin](#pour-aller-plus-loin)

Afin de faciliter notre travail en travaux dirigés, je vous partage un dossier OneDrive.

![image](./img/onedrive-orga.png)  

Il vous est demandé de synchroniser ce dossier OneDrive sur votre ordinateur personel.nnnn

###  Étapes de synchronisation d’un dossier partagé OneDrive sur Windows ou Mac

<iframe width="448" height="252" src="https://www.youtube.com/embed/8WC7iClUH3k?si=Na52qqPlQ4LC4wWx" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>

<br>

1. Vérifier OneDrive sur son PC
- Cliquer sur le bouton Démarrer et tape OneDrive
- Si OneDrive n’est pas installé, télécharger le depuis la page officielle Microsoft OneDrive
- Se connecter avec son compte Microsoft ISTOM

2. Accéder au dossier partagé
- Ouvre un navigateur internet (Firefox, Edge, Chrome, etc.)
- Se connecter sur [https://onedrive.live.com/login](https://onedrive.live.com/login)
- Dans le menu à gauche, cliquer sur Partagé
- Trouver le dossier que à synchroniser

3. Synchroniser le dossier à son OneDrive
- Ouvre le dossier partagé dans le navigateur
- En haut, clique sur le bouton Synchroniser
- L'application OneDrive va alors se lancer automatiquement
- Confirmer que vous souhaiter synchroniser ce dossier

4. Retrouver ce dossier synchronisé sur son ordinateur
- Ouvre Explorateur de fichiers (touche Windows + E)
- Dans le menu de gauche, il va apparaitre une rubrique ISTOM
- Le fichier sera alors présent dans cette rubrique ISTOM

### Usage si vous travaillez sur un ordinateur de l'école

Si vous travaillez sur un ordinateur de l'école, dans ce cas il est plus pratique de créer un raccourci du dossier partagé sur votre OneDrive ISTOM. La démarche à suivre est très bien expliquée sur cette vidéo.

<iframe width="448" height="252" src="https://www.youtube.com/embed/BiirNtobNxE?si=wIsy5cV5-5UH9b7R" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>

### Convention sur la synchronisation des documents et dossiers sur OneDrive

![image](./img/convention-OneDrive.png)  

### Tutorial à R et RStudio

R est un langage de programmation et un environnement statistique open-source, largement utilisé pour l'analyse de données, les statistiques et la science des données. Créé dans les années 1990 par Ross Ihaka et Robert Gentleman, il est particulièrement apprécié pour sa puissance dans le traitement des données, la modélisation statistique et la visualisation graphique. Grâce à une vaste communauté de développeurs, R bénéficie d'un large écosystème de packages (via CRAN) qui étendent ses fonctionnalités dans divers domaines, comme l’apprentissage automatique, la bioinformatique et l’économétrie.

RStudio est un environnement de développement intégré (IDE) conçu pour faciliter l’utilisation de R. Il offre une interface conviviale avec un éditeur de code avancé, une console interactive, des outils de visualisation et un gestionnaire de projets. Disponible en version gratuite et professionnelle, RStudio améliore l’expérience utilisateur grâce à des fonctionnalités telles que l’auto-complétion du code, l’intégration avec Git, la gestion des environnements et la possibilité de générer des rapports dynamiques avec R Markdown et Quarto.

Sur RStudio il est possible d'utiliser R Markdown et Quarto:

-   R Markdown est un format de document qui permet d’intégrer du code R dans un fichier texte et de générer des rapports dynamiques sous divers formats (HTML, PDF, Word, etc.). Il est très utilisé pour la documentation, les rapports d’analyse et les présentations interactives.

-   Quarto est une évolution de R Markdown, plus flexible et multi-langage, permettant d’intégrer du code non seulement en R, mais aussi en Python, Julia et d'autres langages. Il est conçu pour produire des documents scientifiques, des articles, des tableaux de bord et des sites web interactifs avec un meilleur support pour la reproductibilité des analyses.

![](./img/R_RStudio_LogoS.png)

Ensemble, R, RStudio, R Markdown et Quarto forment un écosystème puissant pour l’analyse de données, la visualisation et la communication scientifique, largement utilisé dans les milieux académiques et professionnels.


Afin d'installer R et RStudio il est nécessaire d'avoir :

-   soit un pc windows
-   soit un ordinateur avec une distribution linux, par exemple Ubuntu
-   soit un mac

Il est aujourd'hui possible de trouver des ordinateurs de qualité à moindre prix, en reconditionné, par exemple sur ce site <https://www.backmarket.fr/fr-fr>.

#### Installation de R

**R** : Rendez-vous sur le site officiel [CRAN](https://cran.r-project.org/). pour télécharger et installer **R**.

-   Pour toutes les personnes utilisant **Linux**, choisissez la bonne page entre parenthèses et suivez les consignes pour télécharger et installer R.
-   Pour les personnes utilisant **MacOS**, téléchargez l’installateur en fonction de votre système et lancez-le.
-   Pour les personnes utilisant **Windows**, téléchargez l’installateur en cliquant sur `install R for the first time` puis lancez-le. Vous devez aussi installer [**Rtools**](https://cran.r-project.org/) via le lien sur le CRAN **ou** en utilisant les lignes de code suivantes dans **R** :

``` r
install.packages("utils")
install.packages("installr")
installr::install.Rtools()
```

#### Installation de RStudio

Rstudio est un IDE.

> En programmation informatique, un IDE (environnement de développement) est un ensemble d'outils qui permet d'augmenter la productivité des programmeurs qui développent des logiciels. Source : [Wikipédia](https://fr.wikipedia.org/wiki/Environnement_de_d%C3%A9veloppement)

Dans cette partie vous allez apprendre à installer **RStudio**, l’environnement dans lequel vous allez coder en **R**.

**RStudio** : L'interface utilisateur graphique que vous allez utiliser pour travailler avec **R**. Téléchargez-le depuis [RStudio](https://posit.co/download/rstudio-desktop/). Choisissez bien l’installateur associé à votre système d’exploitation et suivez les consignes.

#### Configuration de RStudio

Dans cette partie nous allons apprendre à personnaliser RStudio de sorte à avoir un environnement de travail agréable à utiliser.​

Lorsque que vous ouvrez RStudio pour la première fois, votre écran doit ressembler à ça.

![image](./img/rstudio-1st-time.png)

Les versions de R et RStudio peuvent être legerement différentes, donc quelques différences sont possibles entre ce que vous avez sur votre ordinateur et ce que vous pouvez observer sur cette capture d'écran.

L’organisation de ces parties est complètement modulable à votre guise dans :

`Tools > Global options`

Nous allons débuter par personaliser le *Pane Layout*.

`Tools > Global options > Pane Layout`

![image](./img/rstudio-config1.png)

-   En haut à gauche vous avez la fenêtre **Source**, là où les scripts s’ouvriront.
-   En haut à droite la fenêtre **Environnement, History, Connections, VSC, Tutorial, Presentation**. Sélectionnez :
    -   Environnement
    -   History
    -   Connections
    -   Build
    -   VCS
    -   Tutorial : Cet onglet va vous permettre d’accéder à un ensemble de tutoriels très pratique pour apprendre à coder en R.
-   En bas à gauche la fenêtre **Console**, pour le moment avec Terminal et Background Jobs. Vide à chaque ouverture de RStudio, cette fenêtre est l’endroit où les codes vont être activés.
-   En bas à droite la fenêtre **Files, Plots, Packages, Help, Viewer, Presentations**. Sélectionnez :
    -   Files
    -   Plots
    -   Packages
    -   Help
    -   Viewer
    -   Presentations

Nous allons à présent ajuster l’apparence de RStudio suivant nos propres préférences. Le chemin pour ces modification est toujours le même :

`Tools > Global options`

Nous commençons par **R General** :

`Tools > Global options > R General`

![image](./img/rstudio-config2.png)

-   Vérifiez si la version préente est la dernière en cliquant sous *R version* sur **Change**.
-   Workspace : Décocher *Restore .RData into workspace at startup*, de même choisissez **Never** pour *Save workspace to .RData on exit*.
-   History : Laissez décochés les deux paramètres.
-   Other : Laissez cochés les trois premiers paramètres.

Nous passons à **Code/Editing** :

`Tools > Global options > Code > Editing`

![image](./img/rstudio-config3.png)

Sélectionnez *Use native pipe operator*

Nous passons à **Code/Display** :

`Tools > Global options > Code > Display`

![image](./img/rstudio-config4.png)

Sélectionnez *Use rainbow parentheses*

Nous passons à **Appearance** :

`Tools > Global options > Appearance`

![image](./img/rstudio-config5.png)

A vous de sélectionner les options qui vous conviennent le mieux !

> Ne pas oublier de cliquer sur **apply** !

Afin de vérifier si vous avez la bonne version, vous pouvez rentrer dans la Console

``` r
sessionInfo()
```

![image](./img/rstudio-check-version.png)




#### Les projets avec RStudio

Un projet centralise les éléments de travail et facilite la compréhension et la réutilisation du code. Un projet, c’est une manière de travailler qui va vous permettre d’écrire du code, mais pas que. En effet, un projet RStudio est globalement un dossier informatique dans lequel se trouvent des données, des scripts mais aussi de la documentation, des images et tout ce qu’il vous faut pour travailler. Lorsqu’on travaille sous forme de projet, il n’y a pas d'interaction involontaire entre les codes de différents projets.

> **Maintenir les packages R et Rstudio à jour**.
>
> Les packages peuvent être mis à jour dans l'onglet Packages puis en cliquant sur Update ou dans le menu `Tools > Check for Package Update`. **À faire au moins une fois par mois**.

Lors de la création d’un projet, le dossier ne contient que le fichier .Rproj , c’est le projet. Il est très fortement conseillé de créer des sous-dossiers : - `data_raw` (qui regroupent toutes les données brutes) - `data` (qui regroupent les données retravaillées) - `doc` (de la documentation ou tout autre document utile) - `img` (les images utiles à notre projet)

Nous allons à présent créer notre premier projet. Il y a plusieurs chemin pour créer un projet, tous sont équivalents. Une possibilité est de cliquer sur **Project** en haut à droite de votre fenêtre RStudio.

![image](./img/1st_project_1.png)

Vous avec alors la possibilité de créer un projet à partir d'un dossier vide ou existant. Nous choisirons pour cette prmière fois de créer un projet à partir d'un dossier vide. Nous créons **quatre sous dossiers** : `data_raw`, `data`, `doc` et `img`.

![image](./img/1st_project_2.png)

On peut alors observer dans le cadran en bas à droite : - `1st_project.Rproj` - `data` - `data_raw` - `doc` - `img`





#### Script R

Nous allons créer notre premier script R.

-   Créer un nouveau document Quarto `File > New File > R Script`
-   Enregistrer votre script
-   Ecrivez votre première ligne de code sur R :

``` r
2 + 3
```

-   Enregistrez votre script
-   Cliquer sur Run, en haut à droite du cadran en haut à gauche.

> Dans la partie suivante nous allons voir les bases du language R.






#### Script Quarto

**Quarto**, c’est la nouvelle génération de R markdown. De manière basique, vous pourrez générer des documents (qui intègrent ou pas du code R) dans les formats html, word ou pdf, mais avec plus de facilité pour gérer, par exemple, les images, les références croisées. Vous pourrez également réaliser des diapositives, des dashboards et des sites webs, des livres, comme R markdown mais nativement, c’est à dire sans faire appel à des packages complémentaires comme bookdown (livres), xaringan (slides), flexdasboard (dashboard).

Voici un rapide tour d’horizon de la syntaxe, pour plus d’informations :

-   Le saut de ligne est marqué par un double espace (en fin d’une ligne).
-   Les étoiles servent à marquer :
    -   En italique : `*italique*`
    -   En gras : `**gras**`
    -   En gras et italique : `***gras et italique***`
    -   Pour raturer on utiliser les tildes : `~~raturé~~`
-   Pour la syntaxe code les impostropes : `` `code` ``
-   Les titres sont précédés de#, autant que de niveaux :
    -   Titre de premier niveau : `# Titre de premier niveau`
    -   Titre de deuxième niveau : `## Titre de deuxième niveau`
    -   Titre de troisième niveau : `### Titre de troisième niveau`

Vous pouvez retrouver les principales syntaxes sur Markdown à cette [page](https://quarto.org/docs/authoring/markdown-basics).

Nous allons créer notre premier script Quarto.

1.  Créer un nouveau document Quarto `File > New File > Quarto Document`
2.  Pour cette premire fois choisissez les options suivantes :

![image](./img/1er-doc-quarto1.png)

3.  Vous allez probablement avoir besoin d'installer le package `Rmarkdown`. Pour cela il vous suffit d'aller dans le cadran en bas à droite et de cliquer sur `Packages` puis `Install`. Une boite de dialogue s'ouvre :

![image](./img/install-package-rstudio.png)

Cliquez sur **Install**, et enregistrez votre script. Le script Quarto apparrait alors dans le cadran en bas à droite dans la fenetre Files. Vous pouvez vous amuser avec ce script, lancer les morceaux de code R. Pour générer le document **html** cliquer sur la petite fleche bleue **Render the current document**, ou utilser le raccourci `Ctrl + Shift + K`.

Si vous souhaitez modifier la le format de sortie, par exemple récupérer un pdf à la place d'un html, il vous suffit d'crire **pdf** à la place de **html** dans le code : fenetre en haut à gauche puis Source.

Un [ensemble d'exemple](https://quarto.org/docs/gallery/) de ce qui est possible de faire avec **Quarto**.


#### Obtenir de l’aide sur R

Le système d'aide en ligne fourni avec **R** est accessible via la commande `help()`. Lorsque l'on connaît le nom de la commande **R**, par exemple, `cmd`, on peut taper `help(cmd)` ou `?cmd` (sauf dans le cas de certains opérateurs). Sinon, on peut rechercher à partir de mots-clés en tapant `help. search()`. Une alternative pour la recherche par motif consiste à utiliser `apropos()`. Pour connaître toutes les commandes fournies par un package (e.g., `pkg`), il suffit de taper `help(package=pkg)`.




#### Quelques premières notions

Nous avons vu que R peut effectuer des opérations mathématiques. Par exemple :

``` r
2 + 3
```

ou encore

``` r
2 * 3
```

Pour récupérer du texte en sortie, il est nécesaire de l'écrire de cette façon :

``` r
"ISTOM, Ecole supérieure d'agro-développement international"
```

Sans les guillemets R retourne une erreur.

En revanche pour récupérer des nombres en sortie, il suffit simplement de rentrer ces nombres :

``` r
105
8
89
2576
978364
```

Afin d'ajouter des commentaires dans votre code (tres fortement conseillé), il suffit d'écrire :

``` r
# L'école la plus cool ;-)
"ISTOM, Ecole supérieure d'agro-développement international"
```

Il est très souvent utile de créer des variables. Cela se fait de la manière suivante

``` r
ecole <- "ISTOM"
adresse <- "4 Rue Joseph Lakanal, 49000 Angers"
date_creation <- 1908
```

De cette façon si ensuite vous rentrez

``` r
ecole
```

il vous sortira simplement **ISTOM**.

On peut également manipuler ces variables. Par exemple :

``` r
paste("L'",ecole,"a été créée en",date_creation) 
```

ou encore

``` r
date_creation <- 1908
nombre_etudiant_promotion <- 60

(2025-date_creation)*nombre_etudiant_promotion
```

On peut attribuer la même valeur à plusieurs variables.

``` r
var1 <- "Angers"
var2 <- "Angers"
var3 <- "Angers"

var1
var2
var3
```









#### Les différents types de données

Il existe différents types de données sur R, on peut citer :

-   `numeric` (10.5, 55, 787)

-   `integer` (1L, 55L, 100L, où le "L" informe R que c'est un integer)

-   `complex` (9 + 3i)

-   `character / string` ("k", "Les stat c'est cool", "FALSE", "11.5")

-   `logical / boolean` - (TRUE or FALSE)

On peut vérifier le type de donnée d'une variable en utilisant la fonction `class()`.

``` r
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

Il y a trois types de nombres : `numeric`, `integer` et `complex`. On peut convertir un nombre d'un type à un autre en utilsant les fonctions :

-   `as.numeric()`

-   `as.integer()`

-   `as.complex()`

Plusieurs fonctions utiles pour les `character / string` :

-   Connaitre la longueur d'une string : `nchar(ecole)`

-   Savoir si une string est contenue dans une autre string : `grepl("I",ecole)`

-   Regrouper deux strings : `paste("Cette ecole a été créée en",date_creation)`

En ce qui concerne les vraiables `logical / boolean` on a simplement :

``` r
10 > 9    # TRUE car 10 est plus grand que 9 !
10 == 9   # FALSE car 10 n'est pas egale à 9 !
10 < 9    # FALSE car 10 est plus grand que 9 ! 
```

Quelques outils d'arithmétques :

``` r
2 + 3 # Addition    
2 - 3 # Subtraction     
2 * 3 # Multiplication  
2 / 3 # Division
2^3 # Exponent
```

Quelques outils de comparaison

``` r
3 == 3 # Check if equal     
5 != 3 # Check if not equal 
5 > 3 # Check if 5 is greater than 3    
5 < 3 # Check if 5 is less than 3 
5 >= 3 # Check if 5 is greater than or equal to 3
5 <= 3 # Check if 5 is less than or equal to 3
```

On peut ranger ces données dans différents objets :

-   **Vecteurs** : Une séquence d'éléments du même type.

``` r
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

\-**Listes** : Une séquence d'éléments qui peuvent être différents.

``` r
ma_liste <- list("apple", "banana", "cherry")
ma_liste
ma_liste[1]
ma_liste[2] <- "pineapple"
length(ma_liste)
"apple" %in% ma_liste 
append(ma_liste,"orange",after=3)
```

-   **Matrices** : Tableau à deux dimensions.

``` r
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

-   **Data frames** : Tableau avec colonnes pouvant contenir différents types de données.

``` r
df <- data.frame(
    Age = c(25, 30, 35), 
    Sexe = c('Homme', 'Femme', 'Homme'))
df
summary(df)
df[1]
df[["Age"]]
```

-   **Facteurs** : c'est un vecteur dont les éléments ne peuvent prendre que des modalités prédéfinies. Ce qui caractérise un facteur dans **R** est le fait qu’elle dispose de l’attribut Levels (niveaux). En pratique, un facteur est typiquement utilisé pour stocker les valeurs observées d’une variable catégorielle (couleur, sexe, jours de la semaine, religion, ...).

``` r
music_genre <- factor(c("Jazz", "Rock", "Classic", "Classic", "Pop", "Jazz", "Rock", "Jazz"))
music_genre
levels(music_genre) 
length(music_genre) 
music_genre[3] 
music_genre[3] <- "Pop"
music_genre
```




















#### Importer des données dans RStudio

RStudio est l’environnement qui va vous permettre d’analyser vos données. Vous allez maintenant apprendre à charger des données dans RStudio, les modifier puis les ressortir de RStudio.

Nous allons apprendre à ouvrir un fichier CSV consacré que voustéléchargerez sur le site [open data](https://www.data.gouv.fr/fr/datasets/) du gouvernement. Choisissez un jeu de donnée qui vous interesse. Vous enregistrer ce fichier dans le dossier `data_raw` de votre projet sous R. Ce fichier CSV est un fichier texte où les données sous formes de tables sont séparées par des virgules. C’est le format de table par excellence à privilégier car nativement pris en compte par R, sans limite de lignes, contrairement à Excel. Pour ma part j'ai choisi ce [jeu de données](https://www.data.gouv.fr/fr/datasets/mixite-dans-le-groupe-edf/).

-   Télécharger le jeu de données au format CSV
-   Enregistrer ce fichier CSV dans le dossier `data_raw` de votre projet sous R
-   Sous R, rentrer le code :\

``` r
mixite_groupe_edf <- read.csv("data_raw/mixite-dans-le-groupe-edf.csv",sep = ";")
```

-   Vous récupérer dans le cadran en haut à droite, dans Environment, l'ensemble des varaibles de votre fichier CSV

> Pour éviter les erreurs : Lisez la page d’aide avant d’utiliser une fonction pour la première fois grâce à la fonction `help()` ou l’onglet **Help**.

Ecrivez sous R

``` r
> help("read.csv")
```

Vous récupérez dans le cadran en bas à droite la documentation de la fonction `read.csv`.

> **Il est cependant fréquent que les données ne soit pas regroupées dans un fichier CSV, mais directement dans un fichier Excel.**

Il est nécessaire de charger le package `readxl`. Deux possibilités s'offrent à nous, soit on procède comme précement pour le package `rmarkdown`, soit on écrit sur la ligne de code suivante :

``` r
install.packages("readxl")
```

Et maintenant nous allons charger les données d'un fichier excel récupérer sur [ce site](https://stats.mom.gov.sg/Pages/Occupational-Wages-Tables2022.aspx).

``` r
library(readxl)
salaire <- read_excel("data_raw/mrsd_2022Wages_Occ_Ind_List.xlsx")
```

Cela ne fonctionne malheuresement pas très bien. Il est nécessaire de péciser l'onglet sur lequel on va travailler et les celules qui nous intéressent.

``` r
library(readxl)
salaire <- read_excel("data_raw/mrsd_2022Wages_table4.xlsx", sheet = "T4", range = "B10:J352")
```

Enfin pour ajouter les titre de chacune des colonnes on écrit

``` r
library(readxl)
salaire <- read_excel("data_raw/mrsd_2022Wages_table4.xlsx", sheet = "T4", range = "B10:J352", col_names = {
  c("SSOC 2020","Occupation","Number Covered","Basic Wage - 25th Percentile ($)", "Basic Wage - Median  ($)","Basic Wage - 75th Percentile ($)","Gross Wage - 25th Percentile ($)", "Gross Wage - Median  ($)","Gross Wage - 75th Percentile ($)")})
```

#### Modifier et exporter des données importées dans RStudio

-   Reprenez les données que vous avez importé au paragraphe précédent.
-   Ouvrez le tableau de données en cliquant dessus dans l’onglet Environment **ou** en utilisant le code :

``` r
mixite_groupe_edf <- read.csv("data_raw/mixite-dans-le-groupe-edf.csv",sep = ";")
View(mixite_groupe_edf)
```

Afin de remplacer une valeur dans une cellule, il faut localiser cette cellule et lui donner sa valeur. Cela se fait de la manière suivante :

``` r
mixite_groupe_edf <- read.csv("data_raw/mixite-dans-le-groupe-edf.csv",sep = ";")
mixite_groupe_edf[38, 5] <- "Mars" # cellule à la 28eme ligne et 1ere colonne
```

De la même manière, vous allez pouvoir sélectionner toutes les lignes de plusieurs colonnes en ne mettant rien avant la virgule, et les colonnes d’intérêt listées après.

``` r
mixite_groupe_edf <- read.csv("data_raw/mixite-dans-le-groupe-edf.csv",sep = ";")

# avec le nom des colonnes
mixite_groupe_edf_fr <- mixite_groupe_edf[, c("tri", "annee", "perimetre_juridique", "perimetre_spatial", "indicateur", "valeur_de_l_indicateur", "unite", "methode_de_consolidation")]

# ou la position des colonnes
mixite_groupe_edf_fr <- mixite_groupe_edf[, c(1:3, 5, 7, 9, 10, 12)]
```

Vous remarquerez qu’un nouveau tableau a été créé, associé au nom `mixite_groupe_edf_fr`. Il est possible de réutiliser le même nom, ce qui permet de gagner en mémoire mais élimine les données de base.

Les modifications réalisées dans l’environnement de RStudio n’impactent pas les données en dehors tant qu’elles ne sont pas enregistrées.

Pour enregistrer une table sous format CSV, il suffit d’utiliser la fonction `write.csv()` :

``` r
mixite_groupe_edf <- read.csv("data_raw/mixite-dans-le-groupe-edf.csv",sep = ";")
mixite_groupe_edf_fr <- mixite_groupe_edf[, c(1:3, 5, 7, 9, 10, 12)]
write.csv(x = mixite_groupe_edf_fr, file = "data/presence_femme_edf.csv")  . 
```

Si vous souhaitez enregistrer votre fichier au format XLSX (Excel), il sufiit d'écrire : \`\`\`{r} install.packages("writexl") library(writexl) write_xlsx(x = mixite_groupe_edf_fr, path = "data/presence_femme_edf.xlsx")


#### Les fonctions

Pour créer une fonction on écrit :

``` r
 my_function <- function() { # create a function with the name my_function
  print("L'ISTOM c'est top!")
} 

my_function()
```

On peut créer des fonctions avec des arguments :

``` r
ma_promo <- function(promo,groupe) {
  paste("Promotion", promo, "groupe", groupe)
}

ma_promo(114,"A")
ma_promo(115,"B") 
```

On a également :

``` r
ma_multiplication <- function(x) {
  return (5 * x)
}

print(ma_multiplication(3))
print(ma_multiplication(5))
print(ma_multiplication(9))
```





#### Conditions, boucles

##### If ... Else

Le mieux est d'illustrer ceci sur un exemple :

``` r
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

##### Nested If

Sur un exemple :

``` r
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

##### AND, OR

Un exemple pour **AND**

``` r
a <- 200
b <- 33
c <- 500

if (a > b & c > a) {
  print("Both conditions are true")
} 
```

Un exemple pour **OR**

``` r
a <- 200
b <- 33
c <- 500

if (a > b | a > c) {
  print("At least one of the conditions is true")
}
```

##### Loops

**R** a deux commandes pour les boucles : - `while` loops - `for` loops

``` r
i <- 1
while (i < 6) {
  print(i)
  i <- i + 1
}
```

un autre exemple

``` r
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

``` r
i <- 0
while (i < 6) {
  i <- i + 1
  if (i == 3) {
    next
  }
  print(i)
} 
```

Un exemple pour une boucle `for`

``` r
fruits <- list("apple", "banana", "cherry")

for (x in fruits) {
  print(x)
} 
```

ou encore

``` r
adj <- list("red", "big", "tasty")
fruits <- list("apple", "banana", "cherry")
  for (x in adj) {
    for (y in fruits) {
      print(paste(x, y))
  }
} 
```
