#######################################################################################################
#   Statistical Computing Exercise-07                                                                 #
#   Date: 21st Jan 2023                                                                               #
#######################################################################################################


# Preparations
rm(list = ls(all.names = TRUE))

# Introductory exercises

# sum of 0.5^i for 1 to 10

q <- 0.5
n <- 10

res <- 0

for (i in 1:n){
  res <- res + (q^i) 
}

print(res)

# Your function should return

geomSeries <- function(q, n){
  res <- 0
  
  for (i in 1:n){
    res <- res + (q^i) 
  }
  res
}

(geomSeries(0.5, 10))

# while loops

q <- 0.5
i <- 1

res <- 0

tol <- 1e-6

term <- (q ^ i)

while(abs(term) >= tol){
  res <- res + term
  i = i+1
  term <- (q^i)
}  
print(res)


# Functions, default values and if-else-structures
# Now alter the function geomSeries that it accepts the arguments q, n and tol. 
# Use the following default values:

geomSeries <- function(q, n = NULL, tol = 1e-6) {
  
  if(!is.null(n)) {
    res <- 0
    
    for (i in 1:n){
      res <- res + (q^i)
    }
  }else {
    res <- 0
    
    i <- 1
    term <- (q^i)
    
    while(abs(term) >= tol) {
      res <- res + term
      
      i <- i+1
      term <- (q^i)
      
    }
    res
  }
  
  return(res)
}

geomSeries(0.5, n=3)
geomSeries(0.5, n=5, tol = 1e-4)
geomSeries(0.5, tol = 1e-4)


# The sqrt(N) law
# The core function
# Write a function meanVarSdSe that takes a numeric vector x as argument. The function should return a
# named vector that contains the mean, the variance, the standard deviation sd and the standard error
# se of x. The standard error is defined as
# se = standard_dev(x) / sqrt(x)

meanvarSdSe1 <- function(x){
  n <- length(x)
  
  c(mean = mean(x),
    var = var(x),
    sd = sd(x),
    se = sd(x) / sqrt(n))
}

x <- 1:100
meanvarSdSe(x)

# You can use the functions mean, var, sd and length. Check the help files for these functions for 
# further arguments that can be used optionally.
# Look at the following code sequence. What result do you expect?
x <- c(NA, 1:100)
meanVarSdSe(x)

meanvarSdSe <- function(x){
  
  c(mean = mean(x, na.rm = TRUE),
    var = var(x, na.rm = TRUE),
    sd = sd(x, na.rm = TRUE),
    se = sd(x, na.rm = TRUE) / sqrt(sum(!is.na(x))))
}

x <- c(NA, 1:100)
meanvarSdSe(x)

meanvarSdSe1(c(x, NA))

meanvarSdSe(c(x, na.rm=TRUE))

# Convergence and Control Structures
set.seed(1)
x <- rpois(n = 1e6, lambda = 100)

tol <- 0.05
factor <- 2

result <- NULL
n <- 2

repeat{
  result <- rbind(result, c(N=n, meanVarSdSe(x[1:n])))
  
  if (result[nrow(result), "se"] <= tol)
    break
  n <- n * factor
}

tail(result)

head(result)

# Check: Are these values plausible?
se <- result[, "se"]
N <- result[, "N"]

plot(N, se, log="xy")

lm01 <- lm(log(se) ~ log(N))
summary(lm01)
