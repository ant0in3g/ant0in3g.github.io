#corrélation spatiale
#pour tous les protocoles d'achantillons qui ont des données spatialisées
#sur les protocoles sur terrain, penser à prendre les données x et y
#actuellement 1 papier sur 10 voire sur 15 n'a pas de données spatiales bien traitées
#il existe une règle en statistiques "quand nous avons des données proches dans le temps ou spatialement, elles ont bcp plus de chance de se ressembler"
#considérer la corrélation spatiale = permet de contrôler un biais statistiques équivalent à la moitié du coefficient de corrélation

#observations
hist(Boreality$boreal) #distribution pas normale
plot(Boreality$Wet, Boreality$boreal)#x l'indice d'humidité et y l'indice de boreal
#on détecte qq anomalies qui indiquent qu'on ne peut pas travailler sur cette variable
#il y a un beaucoup de 0 sur ce plot ! On ne peut pas transformer en log sinon 0 = NA et c'est nul
#problème pour le log ! même avec un log+1 cela ne règle pas le problème
#on voit une augmentation de la variance quand x augmente (cf TP1)

#transformation
#et les auteurs ont donné un script (en gros on laisse de côté l'indice boreal présnte dans la consigne):
Boreality$Bor<-sqrt(1000*(Boreality$nBor+1)/(Boreality$nTot)) #script donné par l'auteur !
hist(Boreality$Bor) #la normalité est meilleure
plot(Boreality$Wet, Boreality$Bor)
#bam les 0 ne sont plus un problème
#la variance est également un peu améliorée, en tout cas plus homogène que la précédente
#on voit qu'il y a une non-linéarité, alors il faudra en prendre compte au niveau des résidus

#réalisation du modèle demandé
m1<-lm(Bor~Wet,data=Boreality)
anova(m1) #Wet         165.8036    10.5991   15.64   <2e-16 ***
#le coefficient 165 est très important ! si wet augmente, la richesse augmente
#attention 165 est très grand ! c'est sans doute une surestimation...à voir par la suite
#sans doute une partie de 165 qui est liée à l'effet de l'échantillonnage et non de l'humidité
summary(m1) #F-statistic: 244.7 on 1 and 531 DF,  p-value: < 2.2e-16

#étude des résidus
plot(m1,which=c(1)) #on n'a aucune trace de l'anomalie spatiale

#on va travailler sur des corrélations spatiales avec les distances

#étude de la distribution spatiale des résidus
#ce script permet de faire une carte 
#Le modèle va mettre chacun des 500 résidus sur une carte (grâce aux coordonnées x et y).
#on lui demande également de mettre des couleurs (black et grey) selon s'il est négatif ou positif en fonction de la moyenne de la variance.
#plus le résidu s'éloigne du modèle, plus il est gros, et inversement
#nous ne sommes pas censés obtenir de groupes de points d'une même forme ou même couleur
#censé obtenir un graph avec des résidus de couleur et de taille différentes et dispersés !
#attention à bien installer et charger les packages gstat (pour utiliser les coordonnées ) et le sp
E<-rstandard(m1)
library(gstat)
library(sp)
mydata<-data.frame(E,Boreality$x,Boreality$y) #data.frame demande à R de faire un tableau #3 éléments entre parenthèse = 3 colonnes dans le tableau
coordinates(mydata)<-c("Boreality.x","Boreality.y") #demande à R de prendre x et y comme des coordonnées spatiales
bubble(mydata,"E",col=c("black","grey"),main="Residuals",xlab="X-coordinates",ylab="Y-coordinates")
#observations de la carte/graph obtenu
##le massif forestier apparait plutôt dans une disposition nord sud
##chaque point = 1 échantillon
##on aperçoit des tâches (disitribution en agrégats) --> pas ouf donc il faut diagnostiquer le soucis

#diagnostic de l'anomalie
#Experimental variogramm for the residuals
#on veut détecter une anomalie spatiale -> variogramme
#y = distance qui sépare les résidus entre eux #présence de classes de résidus
#semi variance = on a pris que la moitié des variance au dessus ou en dessous du modèle
####pour le premier point il a pris tous les quadrats qui ont une distance inférieure à 200
#il a extrait leur variance en les comparant aux autres points et ainsi de suite
#si la variance résiduelle varie en fonction de la distance, ça veut dire que les résidus sont corrélés à la distance
#si c'est le cas, la valeur du résidus est le témoin d'un problème 
#quand il prend des quadrats qui sont distants de 1000, la variance est assez stabilisée
#ça signifie que la variance des résidus ne varie plus en fonction des résidus au dessus des 1000km
#cela veut dire qu'on ne prend pas dans le jeu de quadrats les distances inférieures à 1000km
#si la variance diminue, cela veut dire que les résidus tendent à se ressembler
#plus la variance diminue, plus l'homogénéité diminue et donc plus les résidus tendent à se ressembler --> pb de corrélation spatiale
Vario1<-variogram(E~1, mydata)
plot(Vario1)
#comme la variance est stable >1000km on voudrait garder que ces données mais on perdrait plein de données !
#alors on fait un modèle !!

Vario2<-variogram(E~1, mydata, alpha=c(0,45,90,135)) #pour insérer la direction et regarder si le pb de corrélation spatal se maintien malgré la direction
plot(Vario2) 

#voici ci-dessous le modèle 
#étude de la corrélation spatiale des résidus du modèle
#y en fonction de x = boréal en fonction de wet --> nommé f1 ici et eil est sorti du modèleafin de pouvoir ensuite corriger le modèle (en corrigeant cette fonction et en évitant de faire plein de copier coller)
library(nlme)
f1<-formula(Bor~Wet)
B1.gls<-gls(f1,data=Boreality)
Vario.gls<-Variogram(B1.gls,form=~x+y,robust=TRUE,maxDist=2000, resType="normalized")
#la distance est 2000 est non pas 3000 ou 4000 car ça nous ferait sortir de la zone d'étude donc ça perd de son sens
plot(Vario.gls,smooth=TRUE)
#observations : on a quasiment le même graph qu'avant
##avec une distance réduite à 2000, il a fait bcp plus de classes. 

#ajout d'une corrélation spatiale
#pour l'implémentation d'une fonction spatiale, il faut avoir en tête qq petits éléments :
###spécifier quelle doit être l'étendue et quel doit être le point d'origine
##la courbe va commencer à une distance minimum (différente de 0)=effet origine (ou nugget en anglais)
##quand la distance augmente, je veux qu'il me corrige la variance résiduelle avec la distance. On veut que la fonction dépende de la distance
#on va faire plusieurs fonctions (linéaires, exponentielle, sphérique etc) qui vont permettre de tracer cette relation. 
#On observera l'AIC pour rendre compte quelle fonction est la meilleure.
B1A<-gls(f1, correlation=corSpher(form=~x+y, nugget=TRUE),data=Boreality) #sphérique
B1B<-gls(f1, correlation=corRatio(form=~x+y, nugget=TRUE),data=Boreality) #ratio
B1C<-gls(f1, correlation=corGaus(form=~x+y, nugget=TRUE),data=Boreality) #gaussienne
B1D<-gls(f1, correlation=corExp(form=~x+y, nugget=TRUE),data=Boreality) #exponentielle
AIC(B1.gls,B1A,B1B,B1C,B1D)
#on retient le B1D au vue de l'AIC qui est le plus faible (mais on aurait pu également choisir le B1B)
#dans le summary : nugget = intercept = 0.4849349
#on voit que le wet de 165 au début du TP vaut maintenant 75 
#donc 165-75=90 est la part liée à la corrélation spatiale
#on fait ensuite le graph pour voir si les résidus sont conformes
Vario1E<-Variogram(B1D, form=~x+y,robust=TRUE,maxDist=2000, resType="normalized")
plot(Vario1E,smooth=FALSE)
summary(B1D)
plot(B1D)
#les résidus sont conformes car tous les points sont à peu près alignés
#même en dessous de 1000 c'est plus ou moins stable !
