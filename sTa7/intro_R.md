# Introduction à R pour la statistique

R est un langage de programmation et un environnement pour l'analyse de données et les statistiques. Il est largement utilisé en recherche, en sciences des données et en statistiques appliquées. Ce cours fournit une introduction aux bases de R, en mettant l'accent sur les applications statistiques.

## Sommaire
1. [Installation et prise en main de R et RStudio](#1-installation-et-prise-en-main-de-r-et-rstudio)
   - [1.1 Installation](#11-installation)
   - [1.2 Premiers pas dans RStudio](#12-premiers-pas-dans-rstudio)
   - [1.3 Premiers calculs](#13-premiers-calculs)
2. [Bases du langage R](#2-bases-du-langage-r)
   - [2.1 Types de données](#21-types-de-données)
   - [2.2 Objets principaux](#22-objets-principaux)
3. [Importation et manipulation des données](#3-importation-et-manipulation-des-données)
   - [3.1 Importation de fichiers](#31-importation-de-fichiers)
   - [3.2 Exploration des données](#32-exploration-des-données)
   - [3.3 Manipulation avec dplyr](#33-manipulation-avec-dplyr)
4. [Statistiques descriptives](#4-statistiques-descriptives)
   - [4.1 Moyennes et médianes](#41-moyennes-et-médianes)
   - [4.2 Variance et écart-type](#42-variance-et-écart-type)
   - [4.3 Tableaux de fréquences](#43-tableaux-de-fréquences)
5. [Visualisation des données](#5-visualisation-des-données)
   - [5.1 Graphiques de base](#51-graphiques-de-base)
   - [5.2 Visualisation avancée avec ggplot2](#52-visualisation-avancée-avec-ggplot2)
6. [Analyses statistiques de base](#6-analyses-statistiques-de-base)
   - [6.1 Tests statistiques](#61-tests-statistiques)
   - [6.2 Régression linéaire](#62-régression-linéaire)
7. [Aller plus loin](#7-aller-plus-loin)

## Objectifs du cours
- Comprendre l'environnement R et RStudio.
- Apprendre les bases de la manipulation de données avec R.
- Réaliser des analyses statistiques simples.
- Visualiser les données avec des graphiques.

---

## 1. Installation et prise en main de R et RStudio

### 1.1 Installation
- **R** : Rendez-vous sur le site officiel [CRAN](https://cran.r-project.org/) pour télécharger et installer R.
- **RStudio** : Une interface utilisateur graphique pour travailler avec R. Téléchargez-le depuis [RStudio](https://posit.co/download/rstudio-desktop/).

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

