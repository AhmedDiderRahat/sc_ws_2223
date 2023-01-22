#######################################################################################################
#   Statistical Computing Exercise-08                                                                 #
#   Date: 22st Jan 2023                                                                               #
#######################################################################################################


# Preparations
rm(list = ls(all.names = TRUE))

# Character
aCharacter <- c('a')
aCharacter

# Number
aNumber <- c(1)
aNumber

aFactor <- factor(c('a', 'b', 'c'))
aFactor

(aDataFrame <- data.frame(aCharacter=c('a', 'a', 'a'), 
                          aNumber = c(1, 1, 1), 
                          someNumbers = c(1, 2, 3)))

aList <- c(aCharacter, aNumber, aFactor, aDataFrame)

# 4. What is the result, or in other words the class, of the following expressions. Think first,
#    check your results in R!

class(aList[[1]])                     # character -> character
class(aList[['aNumber']])             # Number    -> Numeric
class(aList$x)                        # NULL      -> NULL
class(aList[4])                       # DataFrame -> List : because its a factor object
class(aList$aDataFrame)               # NULL      -> NULL
class(aList$aDataFrame$aCharacter[1]) # NULL      -> NULL


# 5. Run the example of the help page for the function lm(). 
# Which class has lm.D9. Basically an object of class lm is very similar to a list. Which elements does 
# lm.D9 contain? Access the elements of lm.D9 by name and position to retrieve the residuals and store 
# them in an object residuals. To confirm your results:
?lm()

ctl <- c(4.17,5.58,5.18,6.11,4.50,4.61,5.17,4.53,5.33,5.14)
trt <- c(4.81,4.17,4.41,3.59,5.87,3.83,6.03,4.89,4.32,4.69)
group <- gl(2, 10, 20, labels = c("Ctl","Trt"))
weight <- c(ctl, trt)
lm.D9 <- lm(weight ~ group)
class(lm.D9)

residual <- lm.D9$residuals

residual

lm.D9$xlevels

coef(lm.D9)


# The *apply family
# The *apply can be seen as an alternative to loops whenever the individual outcomes per loop do not 
# depend on each other.

# 1. Get the following matrix of 5 rows and call it 'm'.
m <- matrix(data = c(6, 17, 625, 5, -Inf, 100:104, 5, 9, 35, 79, 1, NA, 246:249), nrow = 5)
m

# row means
apply(m, MARGIN = 1, mean)

apply(m, MARGIN = 2, mean)


# 3. Adjust your function calls so that missing values are ignored.
apply(m, MARGIN = 1, FUN = mean, na.rm = TRUE)

apply(m, MARGIN = 2, FUN = mean, na.rm = TRUE)

# 4. What additional argument can you use calculating the row means so that extreme values like -Inf
#    is ignored. Check the help for mean
apply(m, MARGIN = 1, FUN = mean, na.rm = TRUE, trim = 0.3)


# 5. Sort the columns in ascending order so that your result looks like:
apply(m, MARGIN = 2, FUN = sort, na.last = TRUE)


# 6. Check the help for the data set Titanic and discuss the following code:
data("Titanic")

?Titanic

apply(Titanic, MARGIN = c(3, 4), sum)

apply(Titanic, MARGIN = c(2, 4), sum)


# Using lapply on lists and data.frames

?lapply

# lapply returns a list of the same length as X, each element of which is the result of applying 
# FUN to the corresponding element of X.

# 1. Calculate the summary for each element of the object aList created in exercise 1.
lapply(aList, summary)


# 2. Create a new list named poisList using lapply. The list shall consist of 4 vectors each
# containing 10 poisson distributed random variables drawn from distributions with parameters 
# ??i ??? {1, 2, 5, 10}. Hints:
#         Make use of the function set.seed() to obtain reproducible results.
#         Check the help for rpois and think about argument matching in R.

?rpois

set.seed(1234567890)
poisList <- lapply(c(1, 2, 5, 10), rpois, n = 10)

poisList


# 3. Calculate the mean and the variance for each element of poisList using lapply. 
#    What values do you expect?
lapply(poisList, mean) # 2, 1.8, 4.9, 12.2
lapply(poisList, var)  # 1.33, 2.17, 2.98, 12.4
  

# 4. Extract the fourth element of each vector stored in poisList using an anonymous function.
lapply(poisList, function(x) x[4])


# 5. Explain the following statement: "A data frame is a list, but not every list is a data frame."

# A Data frame is simply a List of a specified class called "data. frame", but the components of the 
# list must be vectors (numeric, character, logical), factors, matrices (numeric), lists, or even other 
# data frames.



# 6. Load the dataset mtcars into the global environment and calculate the range of values for each
# variable contained in the data set using lapply.

data("mtcars")
lapply(mtcars, FUN = range)


# 7. Repeat the calculation of ranges using sapply. Discuss the differences with respect to the class
# of the result.

sapply(mtcars, FUN = range)

# lapply give the value for each individual variables where sapply return the summary of them



# 1. Use mapply to get a list of 6 elements. The list is a set of vectors containing the letters
#    A, B, C, D, E, F. The lengths of those 6 elements decreases step by step from 6 to 1.

?mapply

mapply(rep, c('A', 'B', 'C', 'D', 'E', 'F'), 6:1)


# Random variables and the central limit theorem


# Draw 100 times 5 uniformly distributed observations using the function runif.
?runif

# upper and lower limit of the distribution a, b
a <- 1
b <- 9

# sample size n, and number of sample M
n <- 5
M <- 100

#  Store the 500 values in a matrix with dimension M × n
m <- matrix(runif(n * M, min = a, max = b),
            nrow = M, ncol = n)
m

# Use the function rowMeans to calculate X and store the result in a vector xMeans
xMeans <- rowMeans(m)
xMeans

# Plot a histogramm of xMeans showing the density of the observed values.
hist(
  xMeans,
  breaks = 20,
  probability = TRUE,
  xlab = 'mean of X',
  main = 'Distribution: Mean of X')

# density plot

# c) Plot the theoretical distribution according to the CLT on top of the histogramm.

x <- seq(min(xMeans), max(xMeans), length.out = 1000)
dX <- dnorm(x, mean = (b+a)/2, sd = sqrt(1/12*(b-a)^2/n))
lines(x, dX, col = "red")



# d) Transform your R code to a function named cltDensity() accepting the arguments n and M (with
# default value M = 100) so that you can easily make plots for other sample sizes n. Adjust the plot 
# title of the histogram so that the sample size n is printed. Check the help for paste().

cltDensity <- function(n, M=100) {
  a <- 1
  b <- 9
  
  # data points
  m <- matrix(runif(n * M, min = a, max = b), nrow = M, ncol = n)
  
  xMeans <- rowMeans(m)
  
  # density plot
  x <- seq(min(xMeans), max(xMeans), length.out = 1000)
  dX <- dnorm(x, mean = (b+a)/2, sd = sqrt((1/12) * (b-a)^2/n))
  
  # Visualization
  
  hist(xMeans,
       breaks = 20,
       probability = TRUE,
       xlab = 'mean of X',
       ylim = range(dX),
       main = paste0("Distribution: Mean of X (sample size n = ", n, ")"))
  lines(x, dX, col = 'red')
}

cltDensity(5)

# e) Play with the function cltDensity and check the results for different sample sizes 
#    n ??? {1, 2, 5, 10, 20, 50, 100, 1000}.

cltDensity(1)
cltDensity(2)
cltDensity(5)
cltDensity(10)
cltDensity(20)
cltDensity(50)
cltDensity(100)
cltDensity(1000)


# f) Now write a second function cltDistrFun where the empirical distribution function and 
#    distribution function of the appropriate normal distribution is plotted. 

cltDistrFun <- function(n, M = 100) {
  a <- 1
  b <- 9
  
  # the data matrix
  m <- matrix(runif(n * M, min = a, max = b), nrow = M, ncol = n)
  
  # mean of m
  xMeans <- rowMeans(m)
  
  # density plot
  x <- seq(min(xMeans), max(xMeans), length.out = 1000)
  pX <- pnorm(x, mean = (b+a)/2, sd = sqrt(1/12 * (b-a)^2/n))
  
  plot(
    ecdf(xMeans),
    xlab = 'mean of X',
    main = paste0('Distribution: Mean of X (sample size n= ', n, ')')
  )
  lines(x, pX, col='red')
}

cltDistrFun(n=500)
