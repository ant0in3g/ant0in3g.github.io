# Exam math 1
m1 <- 18 # note
c1 <- 1 # coeff

# Exam math 2
m2 <- 16 # note
c2 <- 1 # coeff

# Exam math 3
m3 <- 6 # note
c3 <- 2 # coeff

# Exam math 4
m4 <- 12 # note
c4 <- 4 # coeff

Mes_notes <- c(m1,m2,m3,m4)
Mes_coeff <- c(c1,c2,c3,c4)

Mes_notes[2]

a = 0
for(i in 1:4){
  current = Mes_notes[i]*Mes_coeff[i] 
  a = a + current 
}
ma_moyenne <- a/sum(Mes_coeff)

ma_moyenne
