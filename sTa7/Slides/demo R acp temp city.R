library(readxl)

data = read_excel("data_raw/ex-acp-city-temp.xlsx")

var.quanti <- sapply(data, is.numeric)

var.quanti

library(ggplot2)
library(corrplot)

data.Quanti = data[,var.quanti]
  
data.Quanti

matrice_correlation <- cor(data.Quanti, use = "complete.obs")

matrice_correlation

corrplot(matrice_correlation, method = "color", type = "upper", order = "hclust",
         tl.col = "black", 
         tl.srt = 45, 
         addCoef.col = "black", # Couleur des coefficients
         cl.pos = "n", # Position de la légende de couleur
         cl.cex = 1.2, # Taille de la légende de couleur
         addCoefasPercent = TRUE, # Afficher les coefficients en pourcentage
         number.cex = 0.8) # Taille des chiffres des coefficients

data_cr <- scale(data.Quanti,center = TRUE,scale=TRUE)

data_cr

library(usethis)
library(devtools)
library(FactoMineR)
library(factoextra)

mon_acp <- PCA(data_cr, graph = FALSE)

mon_acp

the.eigenvalueS <- mon_acp$eig

the.eigenvalueS

barplot(the.eigenvalueS[, 2], 
        names.arg=1:nrow(the.eigenvalueS), 
        main = "Pourcentage de la variance expliquée par chaque composante",
        xlab = "Composantes principales",
        ylab = "Pourcentage de variance expliquée",
        col ="steelblue")

lines(x = 1:nrow(the.eigenvalueS), 
      the.eigenvalueS[, 2], 
      type="b", 
      pch=19, 
      col = "red")

fviz_eig(mon_acp, addlabels = TRUE)

fviz_pca_var(mon_acp, 
             col.var = "cos2", # Utiliser la qualité de représentation (cos2) pour la couleur
             gradient.cols = c("#00AFBB", "#E7B800", "#FC4E07"), # Palette de couleurs
             repel = TRUE, # Éviter le chevauchement des étiquettes
             title = "Cercle de Corrélation des Variables")

fviz_pca_var(mon_acp, 
             col.var = "contrib", # Utiliser la contribution
             gradient.cols = c("#00AFBB", "#E7B800", "#FC4E07"), # Palette de couleurs
             repel = TRUE, # Éviter le chevauchement des étiquettes
             title = "Cercle de Corrélation des Variables")

head(mon_acp$ind$coord)

head(mon_acp$ind$contrib)

fviz_contrib(mon_acp, choice = "var", axes = 1, top = 3)

fviz_contrib(mon_acp, choice = "var", axes = 2, top = 10)

fviz_pca_ind(mon_acp, col.ind="cos2") +
  scale_color_gradient2(low="blue", mid="white", 
                        high="red", midpoint=0.50) +
  theme_minimal()



