# Principal Component Analysis 

## In this example, the data is in a matrix called 
## data.matrix
## columns are individual samples (i.e. cells)
## rows are measurements taken for all the samples (i.e. genes)

## Just for the sake of the, here's some made up data...

data.matrix <- matrix(nrow=100, ncol=10)

# The column names represent the names of the samples
# The first 5 samples will be "wt" (for wild type sample)
# The last 5 sample will "ko (for knock-out / modify sample)

colnames(data.matrix) <- c(
  paste("wt", 1:5, sep=""),
  paste("ko", 1:5, sep=""))

# The row names represent the names of genes

rownames(data.matrix) <- paste("gene", 1:100, sep="")

# We give the "fake" genes "fake"counts"
# For doing so we use the Poisson distribution

for (i in 1:100) {
  wt.values <- rpois(5, lambda=sample(x=10:1000, size=1))
  ko.values <- rpois(5, lambda=sample(x=10:1000, size=1))

  data.matrix[i,] <- c(wt.values, ko.values)
}

# A quick view of a part of this fake dataset
# NOTE : The samples are columns and the genes are rows  

head(data.matrix)

# In order to get the dimension of data.matrix

dim(data.matrix)

# We perform a PCA with our data
# using the function prcomp
# NOTE : By default, prcomp() expects the samples to be rows and the genes to be columns.
# Therefore we need to transpose the matrix with the t() function

pca <- prcomp(t(data.matrix), scale=TRUE) 

## THE GOAL is to draw a graph that shows how the samples 
## are related (or not) to each other

# prcomp returns 3 things :
# - x
# - sdev
# - rotation

# What is x ?
# x contains the principal components (PCs)
# there are 10 samples, so there are 10 PCs


## we plot pc1 and pc2

plot(pca$x[,1], pca$x[,2])

# 5 points are "aligned" on the right, and 5 other on the left
# to get how these clusters make sense, we are going to compute the variations
# For doing so we use the square of sdev, which stands for "standard deviation"

pca.var <- pca$sdev^2

# The percentage of variation that each PC accounts for is 
# way more interesting than the actual value, 
# we calculate the percentages 

pca.var.per <- round((pca.var/sum(pca.var))*100, 1)

# and then we plot these percentages

barplot(pca.var.per, main="Scree Plot", xlab="Principal Component", ylab="Percent Variation")

# PC1 get almost all of the variation in the data !
# Meaning there is a big difference between the previous two clusters

## We can use ggplot 2 to make a fancy looking plot 
# that shows the PCs and the variation

library(ggplot2)

# first we need to format the data the way ggplot2 likes it

pca.data <- data.frame(Sample=rownames(pca$x),
                       X=pca$x[,1],
                       Y=pca$x[,2])
pca.data

# Now using ggplot we can plot a fancy graph

ggplot(data=pca.data, aes(x=X, y=Y, label=Sample)) +
  geom_text() +
  xlab(paste("PC1 - ", pca.var.per[1], "%", sep="")) +
  ylab(paste("PC2 - ", pca.var.per[2], "%", sep="")) +
  theme_bw() +
  ggtitle("My PCA Graph")

# The prcomp() function calls the loading scores rotation
# There are loading scores for each PC
# We are just going to look at the loading scores for PC1, 
# since it accounts for 92% of the variation in the data.

loading_scores <- pca$rotation[,1]

# we focus on the magnitudes
gene_scores <- abs(loading_scores)

# we sort the magnitudes of the loading scores, from high to low

gene_score_ranked <- sort(gene_scores, decreasing=TRUE)

# Now we get the names of the top 10 genes with the largest loading score magnitudes.

top_10_genes <- names(gene_score_ranked[1:10])

# we can show the names of the top 10 genes

top_10_genes 

# we can also show the scores (and +/- sign)

pca$rotation[top_10_genes,1]


###############################"

# getting data 

data("iris")

iris

str(iris)

summary(iris)

# Lets divides the data sets into training dataset and test datasets.

set.seed(111)

ind <- sample(2, 
              nrow(iris), 
              replace = TRUE,
              prob = c(0.8, 0.2))
ind

training <- iris[ind==1,]
training

testing <- iris[ind==2,]
testing

# Principal Component Analysis
# It is based on only independent variables. 
# So we removed the fifth variable from the dataset

training[,-5]

pc <- prcomp(training[,-5],
             center = TRUE,
             scale. = TRUE)

pc

library(usethis)
library(devtools)
library(ggplot2)
library(ggbiplot)

fancy.graph.pca <- ggbiplot(pc, 
                            obs.scale = 1,
                            var.scale = 1,
                            groups = training$Species,
                            ellipse = TRUE,
                            circle = TRUE,
                            ellipse.prob = 0.68) +
  scale_color_discrete(name = '') +
  theme(legend.direction = 'horizontal',
        legend.position = 'top')
fancy.graph.pca


# PC1 explains about 73.7% and PC2 explained about 22.1% of variability.

# Arrows are closer to each other indicates the high correlation.

# For example correlation between Sepal Width vs other variables is weakly correlated.

# Another way interpreting the plot is PC1 is positively correlated 
#with the variables Petal Length, Petal Width, and Sepal Length, and PC1 is negatively correlated with Sepal Width.

# PC2 is highly negatively correlated with Sepal Width.

# Bi plot is an important tool in PCA to understand what is going on in the dataset.

