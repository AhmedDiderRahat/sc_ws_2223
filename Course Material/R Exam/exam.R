rm(list = ls(all.names = TRUE))


library(carData)

data(Prestige)

Prestige

names(Prestige)[2]


Prestige[5, 2]



(x <- rep(1:20, each=2))


# a
t(matrix(x, 15, 4, FALSE))  # ok

# b
matrix(x, 4, 15, TRUE) # OK

matrix(x, 4) # not



matrix(data = x, ncol = 15, nrow = 4, byrow = TRUE)


t(matrix(x, 15))


matrix(da = x, b = TRUE, nc = 4) # not

matrix(data = x, 15, nrow = 4, byrow = TRUE)



x <- NULL

for (w in 1:ncol())
  print(w)
  
  
  

  
  
# a fase

# b 
matrix(x, 4, 10, TRUE) # true

# c
matrix(data = x, ncol = 10, nrow = 4) # false

# d
matrix(da=x, b=TRUE, nc=4) # false

# e
matrix(x,4) # false

#f
matrix(data=x, ncol = 10, nrow = 4, byrow = TRUE) # true

# g
matrix(data=x, 10, nrow = 4, byrow = TRUE) # true

#h 
matrix(10, d=x,  b= TRUE, n=4) $ false

# i
t(matrix(x, 10, 4, FALSE)) # TRUE



t(matrix(x, 10))  #true

