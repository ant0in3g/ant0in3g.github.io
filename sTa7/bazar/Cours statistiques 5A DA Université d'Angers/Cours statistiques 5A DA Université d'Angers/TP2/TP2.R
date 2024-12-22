#test de normalité
#attention il ne faut pas faire plein de tests car ce sont les résidus de la fin qui donneront le résultat final
hist(RIKZ$Richness)
#corrige la distribution qui n'est pas normale
#la fonction log permet de réduire l'importance des petites valeurs et d'augmenter l'importance des grandes
logR<-log(RIKZ$Richness)
hist(logR)
RIKZ$logR<-log(RIKZ$Richness)
#attention le log sur la richesse a peut être perturbé la richesse
#maintenant 3 conditions sont réunies : normalité, variance et linéarité. il manque l'indépendance des données

#modèle tidal et richesse
#richesse va être le y donc la richesse en fonction de la variante tidal qui va être le x
m1<-lm(logR~NAP,data=RIKZ)
summary(m1)
#il faut donc regarder nap avec la richesse  et nap avec la richesse transformée en log
plot(RIKZ$NAP,RIKZ$Richness)
plot(RIKZ$NAP,RIKZ$logR)
#la variance est bien meilleure avec log, on voit un cylindre. On travaille avec log tout en vérifiant les résidus.

#beach et exposure doivent être catégorielle aka par catégorie et non "continuelle"
fBeach<-factor(RIKZ$Beach)
fExposure<-factor(RIKZ$Exposure)

#effet de l'exposition
m2<-lm(RIKZ$logR~RIKZ$NAP*fExposure)
anova(m2)
summary(m2)

m3<-lm(RIKZ$logR~RIKZ$NAP+fExposure)
anova(m3)
summary(m3)

#effet de la station
m4<-lm(RIKZ$logR~RIKZ$NAP*fBeach)
anova(m4)
summary(m4)

#controle de l'effet de la station avec un effet aléatoire
#comparaison de 2 traitements chez 4 élevages de poissons avec un échantillon de poissons par élevage (poissons A et poissons B/élevage)

#on intègre l'effet station non pas comme un facteur fixe mais comme un facteur aléatoire
#il faut chercher un modèle linéaire à effet aléatoire
#on l'appelle le "The random intercept model"
library(nlme)
m5<-lme(logR~NAP,random=~1|fBeach, data=RIKZ)
anova(m5)
summary(m5)
#on peut mettre plusieurs effets aléatoires dans le model
#généralement quand on met un effet aléatoire, on met celui qui prend la plus grande variance
#l'écart type (StdDev) des intercept et des residual est crucial
#variance = écart type ², la variance de l'effet aléatoire c'est 0,49² car : StdDev:   0.4875358 (pour intercept) 0.4095662(pour les rédidus)
#0,41²la part de la variance qui est expliquée par l'effet station
#plus la part de la variance expliquée est grande plus l'effet est important

#maintenant on change l'intercept (comme avant) ET le pente
#the random intercept and slope model
m6<-lme(logR~NAP,random=~1+NAP|fBeach, data=RIKZ)
anova(m6)
summary(m6)
#NAP         0.2152313 signifie que la pente est de 0,2² ce qui est important !

#normalement sur les modèles aléatoire, fisher fonctionne très mal
#donc on compare les modèles et on voir lequel est le mieux
#on teste les modèles pour voir la déviance


#on compare les modèles avec anova = on retire les résidus de plusieurs modèles pour les comparer
#plus l'AIC est bas, mieux c'est
#le df doit être supérieur à 2 sinon c'est pas significatif
#dire qu'on a créé un modèl random intercept model et pas les deux random car la différence entre les deux n'est pas significative

#refaire ce travail avec exposition
#et dire si faut mettre exposition en intercept ou en pente

plot(m5)
#selon le graph on voit que le log fonctionne bien pour les résidus

hist(resid(m5))
#distribution à peu près ok

#comment on choisit le modèle mixte ?
#option 1 : expérimentale, on dit que les données ne sont pas indépendantes car on a des stations etc
#option 2 : dispositif expérientale un peu biaisé mais je prends une approche statistique et si l'effet aléatoire n'est pas significatif je ne le prends pas en compte

#effet de l'exposition
library(nlme)
m7<-lme(logR~NAP,random=~1|fExposure, data=RIKZ)
anova(m7)
summary(m7)

##variance = écart type ², la variance de l'effet aléatoire c'est 0,69² car : StdDev:    0.6929444  (pour intercept) 0.42062(pour les rédidus)
#la part de la variance qui est expliquée par l'effet station
#plus la part de la variance expliquée est grande plus l'effet est important

m8<-lme(logR~NAP,random=~1+NAP|fExposure, data=RIKZ)
anova(m8)
summary(m8)
#part de variance = 0.67658693² car = stddev intercept

AIC(m1,m5,m6,m7,m8)
#   df      AIC
#m1  3 88.72262
#m5  4 77.42204
#m6  6 79.15704
#m7  4 70.08816
#m8  6 73.74910
#l'AIC le plus petit est le m7 avec 70 et en plus il y a plus de 2 points de différence avec le deuxième plus petit. 
#si ça n'avait pas été le cas, et que le premier et le deuxième étaient très proche <2 pts de différence alors on prend le plus simple #principe de simplicité