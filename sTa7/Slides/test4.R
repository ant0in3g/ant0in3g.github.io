men = 30
women = 45

binom.test(men,women,p=0.5)


#make this example reproducible
set.seed(0)

#create data that follows a normal distribution
normal_data <- rnorm(500)

#perform shapiro-wilk test
shapiro.test(normal_data)

#create data that follows an exponential distribution
non_normal_data <- rexp(500, rate=3)

#perform shapiro-wilk test
shapiro.test(non_normal_data)

