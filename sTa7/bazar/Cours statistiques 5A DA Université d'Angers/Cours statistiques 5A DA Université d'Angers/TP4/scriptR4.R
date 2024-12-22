#conseil du prof : faire une transformation racine carré (sqrt), gérer le temps et ajouter des arguments
#attention aux NA <- les gérer
#on peut mettre l'année en cofacteur avec les précipitations
#on prend la variable année comme continue et non pas comme catégorielle, mais la prendre en continue va nous amener qq difficultés
#la première est de regarder si la variable réponse (l'abondance) est normale

library(nlme)
hist(Hawaii$Moorhen.Kauai)
plot(Hawaii$Year, Hawaii$Moorhen.Kauai, xlab="Year", ylab="Moorhen abundance on Kauai")
#il y a un titre mais c'est pas obligatoire !
#la relation ne sera probablement pas linéaire
#cela amène a un changement de variable
#l'abondance a une variance vraiment pas normale
#on souhaite une meilleure variance donc on utilise la racine carré (comme a dit suggéré le prof)
Hawaii$MKsqrt<-sqrt(Hawaii$Moorhen.Kauai)
#on voit qu'il y a une donnée qui dépend du temps
#entre les années, les données ne sont pas indépendantes, les données sont séquentielles 
#les données de demain seront plus proches de celle d'après-demain et celle d'aujourd'hui que celle d'il y a 15 ans
hist(Hawaii$MKsqrt)
plot(Hawaii$Year,Hawaii$MKsqrt,xlab="Year",ylab="Moorhen abundance on Kauai")
#la normalité est tout de suite mieux
#c'est une régression multiple car il y a deux variables continues qu'on met en interraction
#si le problème n'est pas le temps, on peut passer par l'atelier 1 sinon c'est pas recommandé et on passe par la puissance des variances

#voir fihe Eléane M1 
#on veut supprimer les NA on ajoute "na.action=na.omit":
M1<-lm(MKsqrt~Rainfall*Year, na.action=na.omit, data=Hawaii)
anova(M1)
summary(M1)#
#en faisant "plot(M1)" dans la rédaction du dessous on observe la ligne de la variance, ainsi que le fait que la variance augmente de plus en plus
#on peut passer sur un gls 
#gls car il permet de paramêtrer certains arguments que le lm ne peut pas
#je fais un modèle beaucoup plus simple en supprimant l'interraction entre rainfall et year et en mettant donc year en additif
M2<-gls(MKsqrt~Rainfall+Year, na.action=na.omit, data=Hawaii)
anova(M2)
summary(M2)
#on comparant les résultats de lm et gls
#on voit que l'effet sur les précipitations n'est pas significatif alors que sur les années ça l'est
#on voit ça avec la présence ou non d'étoiles *** ainsi que la p-value qui est <0001 pour l'année (= significatif)

#résidus = erreur de prédiction
#ensuite je vais sortir les résidus pour en faire un tableau
#je vais ensuite travailler dessus pour en faire un vecteur
#je prends les résidus pour les normaliser
#mes résidus s'appellent E
E<-residuals(M2, type="normalized")
#dans cet atelier on a des NA et si on compare le tableu des résidus avec le tableau original le nbre de lignes va être différent à cause des NA
#ce code qui suit permet de reconstruire un vecteur des résidus du modèle
I1<-!is.na(Hawaii$MKsqrt) #permet de faire apparaître un tableau de TRUE ou FALSE
Efull<-vector(length=length(Hawaii$MKsqrt)) #fait appraître des FALSE partout
Efull<-NA
Efull[I1]<-E #fait apparaitre le tableau avec les résidus ET les NA (c'est ce qu'on voulait)

#ci-dessous la fonction la plus importante de l'atelier 4
#cela permet de tester s'il y a une corrélation sur les résidus dans lesquels il y a des NA
#on appelle ça une fonction d'autocorrélation
acf(Efull,na.action=na.pass, main="Autocorrelation plot for residuals")
#en général dans ce tableau on regarde les 4 premières valeurs car les autres n'ont aucun sens (à un moment, au fil des années, il n'y a plus de corrélation avec l'année 1)
#s'il n'y a pas de valeurs manquantes dans le tableau initial, alors on peut faire :
acf(E)

#quand les séries temporelles sont courtes, on peut les traiter simplement par une structure a symétrie
M3<-gls(MKsqrt~Rainfall+Year, correlation=corCompSymm(form=~Year), na.action=na.omit, data=Hawaii)
anova(M3)
summary(M3) #le summary indique que Rho=0 (proche de 0), ainsi les résultats sont similaires au modèle sans corrélation
#si Rho était plus grand cela signifierait que la corrélation est capturée
#ici il y a une corrélation mais on ne la capture pas, la corrélation n'est pas symétrique et donc la corrélation n'est pas constante entre les années
#donc la fonction que l'on a utilisé n'est pas correcte pour ce qu'on doit faire

#on refait le même code pour retirer les résidus MAIS avec le M3
E<-residuals(M3, type="normalized")
I1<-!is.na(Hawaii$MKsqrt)
Efull<-vector(length=length(Hawaii$MKsqrt))
Efull<-NA
Efull[I1]<-E
acf(Efull,na.action=na.pass, main="Autocorrelation plot for residuals") #ça change pas grand chose

#on va demander à calculer un coeff de corrélation sur toutes les années (indépendamment) et de garder ce coeff pour l'utiliser ensuite
#la procédure suivante AR-1autocorrelation signifie un modèle autoregressif de premier ordre (chaine de marcof)
M4<-gls(MKsqrt~Rainfall+Year, correlation=corAR1(form=~Year), na.action=na.omit, data=Hawaii)
anova(M4)
summary(M4) #indique que le Rho (ou Phi1) vaut 0,77 donc la coorrélation est meilleure (sur un pas de temps d'1 an)
#sur 3 ans, le coefficient de corrélation serait de 0,77 au cube

E<-residuals(M4, type="normalized")
I1<-!is.na(Hawaii$MKsqrt)
Efull<-vector(length=length(Hawaii$MKsqrt))
Efull<-NA
Efull[I1]<-E
acf(Efull,na.action=na.pass, main="Autocorrelation plot for residuals")
#le graph que l'on observe est bien, toutes les autocorrélations sont dans l'intervalle

#CORRELATION MOBILE
#on souhaite déplacer la fenêtre de corrélation (cf schéma tableau pris par Nora)
#au lieu qu'elle soit du premier ordre (corAR1) comme tout à l'heure on va lui demander de bouger (on peut demander un pas de temps 1, 2 ou 3 etc)
#pour que le code ne soit pas trop long je remplace la fonction par qq lettres :
CS1<-corARMA(p=1,q=1) #q = pas de temps et p= paramêtre auto-régressif
#je fais la fonction:
M5<-gls(MKsqrt~Rainfall+Year, correlation=CS1, na.action=na.omit, data=Hawaii)
anova(M5)
summary(M5)

E<-residuals(M5, type="normalized")
I1<-!is.na(Hawaii$MKsqrt)
Efull<-vector(length=length(Hawaii$MKsqrt))
Efull<-NA
Efull[I1]<-E
acf(Efull,na.action=na.pass, main="Autocorrelation plot for residuals") #le graph change ! 

#pour comparer les différents résultats, on utilise l'AIc et on vérifie celui ayant le résultat le plus faible
AIC(M2,M3,M4,M5)

