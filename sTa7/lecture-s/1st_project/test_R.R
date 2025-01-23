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
