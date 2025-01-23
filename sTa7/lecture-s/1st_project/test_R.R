2+3
sqrt(16)
log(10)

# L'école la plus cool ;-)
"ISTOM, Ecole supérieure d'agro-développement international"

ecole <- "ISTOM"
adresse <- "4 Rue Joseph Lakanal, 49000 Angers"
date_creation <- 1908

ecole
adresse
date_creation


paste("L'",ecole,"a été créée en",date_creation) 


date_creation <- 1908
nombre_etudiant_promotion <- 60

(2025-date_creation)*nombre_etudiant_promotion


var1 <- "Angers"
var2 <- "Angers"
var3 <- "Angers"

var1
var2
var3

x <- 3+5i
y <- 5i

# Print values of x and y
x
y

# Print the class name of x and y
class(x)
class(y) 


x <- 1000L
y <- 55L

# Print values of x and y
x
y

# Print the class name of x and y
class(x)
class(y) 


x+y
x


str <- "Lorem ipsum dolor sit amet,
consectetur adipiscing elit,
sed do eiusmod tempor incididunt
ut labore et dolore magna aliqua."

str # print the value of str 

str

str <- "Hello World!"

nchar(str) 

grepl("I",ecole)


paste("Cette ecole a été créée en",date_creation)
xxxxx <- 1:10
xxxxx


a <- 33
b <- 200

if (b > a) {
  print("b is greater than a")
} 


i <- 1
while (i < 6) {
  print(i)
  i <- i + 1
}


i <- 0
while (i < 6) {
  i <- i + 1
  if (i == 3) {
    next
  }
  print(i)
} 


ma_promo <- function(promo) {
  paste("Promotion", promo)
}

ma_promo(114)
ma_promo(115) 


ma_promo <- function(promo,groupe) {
  paste("Promotion", promo, "groupe", groupe)
}

ma_promo(114,"A")
ma_promo(115,"B") 


ma_multiplication <- function(x) {
  return (5 * x)
}

print(ma_multiplication(3))
print(ma_multiplication(5))
print(ma_multiplication(9)) 


mat <- matrix(1:9, nrow = 3, ncol = 3)
mat
mat[1,2]
mat[1,]
mat[,2]
mat[c(1,2),] 
mat[,c(1,2)] 
mat_add_column <- cbind(mat,c(50,8,47))
mat_add_column

plot(1, 3)
plot(c(1, 8), c(3, 10)) 

plot(1:10, main="My Graph", xlab="The x-axis", ylab="The y axis",col="red",cex=0.5,pch=11) 

# day one, the age and speed of 12 cars:
x1 <- c(5,7,8,7,2,2,9,4,11,12,9,6)
y1 <- c(99,86,87,88,111,103,87,94,78,77,85,86)

# day two, the age and speed of 15 cars:
x2 <- c(2,2,8,1,15,8,12,9,7,3,11,4,7,14,12)
y2 <- c(100,105,84,105,90,99,90,95,94,100,79,112,91,80,85)

plot(x1, y1, main="Observation of Cars", xlab="Car age", ylab="Car speed", col="red", cex=2)
points(x2, y2, col="blue", cex=2) 


x <- c(10,20,30,40)
mylabel <- c("Apples", "Bananas", "Cherries", "Dates")
colors <- c("blue", "yellow", "green", "black")
pie(x,, label = mylabel, main = "Fruits",col = colors,init.angle = 90) 
legend("bottomright", mylabel, fill = colors) 


x <- c("A", "B", "C", "D")
y <- c(2, 4, 6, 8)
barplot(y, names.arg = x, col = "red",density = 10,width = c(1,2,3,4))
barplot(y, names.arg = x, horiz = TRUE) 
