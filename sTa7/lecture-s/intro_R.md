## Introduction et prise en main de R et RStudio

R est un langage de programmation et un environnement pour l'analyse de données et les statistiques. Il est largement utilisé en recherche, en sciences des données et en statistiques appliquées. Ce cours fournit une introduction aux bases de R, en mettant l'accent sur les applications statistiques.

### Sommaire

1. [Les outils R et RStudio](#1-les-outils-r-et-rstudio)
   - [1.1 Installation de R](#11-installation-de-r)
   - [1.2 Installation de RStudio](#12-installation-de-rstudio)
   - [1.3 Configurationn de RStudio](#13-configuration-de-rstudio)
2. [Truc](#2-truc)

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

> Ne pas oublier de cliquer sur **apply** !

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

Sélectionnez _Use native pipe operator, |> (requires R 4.1+)_

Nous passons à **Code/Display** :

```Tools > Global options > Code > Display```

![image](./img/rstudio-config4.png)

Sélectionnez _Use rainbow parentheses_

Nous passons à **Appearance** :

```Tools > Global options > Appearance```

![image](./img/rstudio-config5.png)

A vous de sélectionner les options qui vous conviennent le mieux !

### 2. Truc












### 1.2 Premiers pas dans RStudio
1. **Console** : Pour exécuter des commandes interactives.
2. **Script** : Zone pour écrire et sauvegarder du code.
3. **Environnement** : Liste des objets chargés en mémoire.
4. **Plots** : Affichage des graphiques.

### 1.3 Premiers calculs
Dans la console, essayez :
```r
2 + 3
sqrt(16)
log(10)
```

---

## 2. Bases du langage R

### 2.1 Types de données
- **Numérique** : Ex. `2`, `3.5`
- **Caractère** : Ex. `'texte'`, `"analyse"`
- **Booléen** : Ex. `TRUE`, `FALSE`
- **Facteurs** : Variables catégoriques (Ex. Sexe : `Homme`, `Femme`).

### 2.2 Objets principaux
- **Vecteurs** : Une séquence d'éléments du même type.
```r
x <- c(1, 2, 3, 4)
x
```
- **Matrices** : Tableau à deux dimensions.
```r
mat <- matrix(1:6, nrow = 2, ncol = 3)
mat
```
- **Data frames** : Tableau avec colonnes pouvant contenir différents types de données.
```r
df <- data.frame(Age = c(25, 30, 35), Sexe = c('Homme', 'Femme', 'Homme'))
df
```

---

## 3. Importation et manipulation des données

### 3.1 Importation de fichiers
- Fichiers CSV :
```r
data <- read.csv('chemin/vers/fichier.csv')
head(data) # Affiche les premières lignes
```
- Fichiers Excel (utilisez le package `readxl`) :
```r
library(readxl)
data <- read_excel('chemin/vers/fichier.xlsx')
```

### 3.2 Exploration des données
- Aperçu : `head(data)`, `tail(data)`
- Structure : `str(data)`
- Statistiques descriptives : `summary(data)`

### 3.3 Manipulation avec `dplyr`
Installez le package :
```r
install.packages('dplyr')
library(dplyr)
```
Quelques fonctions clés :
- **Filtrer des lignes** :
```r
data_filtre <- filter(data, Age > 30)
```
- **Sélectionner des colonnes** :
```r
data_selection <- select(data, Age, Sexe)
```
- **Ajouter une colonne** :
```r
data <- mutate(data, Age_en_annees = Age * 365)
```

---

## 4. Statistiques descriptives

### 4.1 Moyennes et médianes
```r
mean(data$Age)
median(data$Age)
```

### 4.2 Variance et écart-type
```r
var(data$Age)
sd(data$Age)
```

### 4.3 Tableaux de fréquences
```r
table(data$Sexe)
```

---

## 5. Visualisation des données

### 5.1 Graphiques de base
- Histogramme :
```r
hist(data$Age, main = 'Distribution des âges', xlab = 'Âge')
```
- Nuage de points :
```r
plot(data$Age, data$Revenu, main = 'Âge vs Revenu')
```

### 5.2 Visualisation avancée avec `ggplot2`
Installez le package :
```r
install.packages('ggplot2')
library(ggplot2)
```
Exemple de graphique :
```r
ggplot(data, aes(x = Age, y = Revenu, color = Sexe)) +
  geom_point() +
  labs(title = 'Relation entre Âge et Revenu', x = 'Âge', y = 'Revenu')
```

---

## 6. Analyses statistiques de base

### 6.1 Tests statistiques
- **Test t de Student** :
```r
t.test(data$Variable1, data$Variable2)
```
- **Chi-2** :
```r
chisq.test(table(data$Variable1, data$Variable2))
```

### 6.2 Régression linéaire
```r
modele <- lm(Revenu ~ Age, data = data)
summary(modele)
```

---

## 7. Aller plus loin
- Consultez la documentation avec `?fonction` ou `help(fonction)`.
- Explorez des packages populaires :
  - `tidyr` pour la manipulation des données.
  - `caret` pour l'apprentissage machine.
  - `shiny` pour créer des applications interactives.

### Ressources
- [Documentation officielle de R](https://cran.r-project.org/manuals.html)
- [Introduction à R par RStudio](https://posit.co/resources/)
- Tutoriels et forums comme [Stack Overflow](https://stackoverflow.com/).

---

Avec ce cours, vous êtes prêts à commencer votre exploration statistique avec R. Bonne analyse !

