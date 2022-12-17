#######################################################################################################
#   Statistical Computing Exercise-04                                                                 #
#   Date: 17th Dec 2022                                                                               #
#######################################################################################################

# Preparations:
rm(list = ls(all.names = TRUE))


# Standard deviation and variance in R
library(carData)
data('Prestige')

# Warm up

# a. Plot the variable income in a histogram, to get a feel for the data.
hist(Prestige$income, breaks = 15)

# Make following adjustments to the plot:
#     -> Plot probability densities on the y-axis instead of frequencies.
#     -> Adjust the breaks of the histogram so that the class width is 1000 and the lowest
#     -> Class starts with a value of 0. The highest class should be (25000, 26000]
#     -> Label the x-axis including correct units and add a title to the plot.

hist(
  Prestige$income, 
  breaks = seq(0, 26000, by=1000),
  main = 'Prestige Data: Income Distribution',
  xlab = 'Income in USD',
  ylab = 'Density',
  las = 1,
  probability = TRUE
)

?hist



# b. Interpret the values on the y-axis and calculate the value of 0.0001471 for the mode of the 
#    distribution by hand. Proceed as follows:
#    First derive the formula to calculate the density of the mode by considering the following general 
#    statements about a histogram:

#       -> The total area of a histogram used for probability density is always normalized to 1.
#       -> The plotted area in a histogram for an individual class equals the relative frequency of 
#          observations in this class.
#       -> If the length of the intervals on the x-axis are all 1, then a histogram is identical to a 
#          relative frequency plot.
#       -> Then calculate the density for the mode

# Calculation of the y-value for the mode:
# - as can be seen from the plot, the mode of the distribution is for class (8000, 9000].
# - function `hist` uses left open intervals (as the help page for `hist` tells you.)
# - the density is given as d = (rel. Frequency)/(width of class)
# This can be derived from the 2nd statement area = rel. Frequency and the
# geometric consideration that area = width * height = width * density.

dMode <- mean(Prestige$income > 8000 & Prestige$income < 9000) / 1000
dMode


# c. In Worksheet 3 you came across the R functions var() for the variance and sd() for the standard 
#    deviation. To understand these dispersion statistics better, compute these statistics from their 
#    definitions given in the lecture. Check your values using the standard R functions.

# Mean of the data points
xbar <- mean(Prestige$income)

# Mean - all data points
devs <- Prestige$income - xbar

# Square of mean - all data points
sqDevs <- devs ^ 2

# sum of all sqDevs
sumSqDevs <- sum(sqDevs)

# variance of all data points
varCalculated <- sumSqDevs / (length(Prestige$income) - 1)
sdCalculated <- sqrt(varCalculated)

print(paste('Calculated Variance= ', varCalculated, ' and SD= ', sdCalculated))

# check:

#var(Prestige$income) == varincome
all.equal(var(Prestige$income), varCalculated)
all.equal(sd(Prestige$income), sdCalculated)





# ----------------------------------------------- x -----------------------------------------------

# Linear transformations:
# Transform the data so that income is measured on a scale from 0 to 1. The formula to do  this is:
#     y(i) = (x(i) - min (x)) / (max(x) - min (x)).

# This is a linear transformation of the form y(i) = a * x(i) + b.

# a. Use R to find the values of a and b in this case?

min_income <- min(Prestige$income)
min_income

max_income <- max(Prestige$income)
max_income

# calculate value of a
a <- 1 / (max_income- min_income)

# calculate value of b
b <- (-1 * min_income) / (max_income - min_income) 

print(paste('Value of a: ', a, ' | value of b: ', b))

# b. Calculate the mean and standard deviation of the transformed income using the formula given 
#    in the lecture based on the result from part (2.c) above.

# c. Store the transformed data as new variable income01 in the Prestige data.frame.
Prestige$income_transformed <- (a * Prestige$income) + b

# d. Check that all the values of Prestige$income01 lie between 0 and 1.
summary(Prestige$income_transformed)

# b-c alternative solution
linearTransformation <- function(x){
  a <- 1 / (max(x) - min(x))
  b <- (-1 * min(x)) * a
  
  a * x + b
}

Prestige$income_transformed <- linearTransformation(Prestige$income)

summary(Prestige$income_transformed)


# e. Calculate its mean and standard deviation and compare it to the expected values.

# Check for Mean
mean(Prestige$income_transformed) 
a * mean(Prestige$income) + b


# Check for Standard Deviation
sd(Prestige$income_transformed)
sd(Prestige$income) * a



# ----------------------------------------------- x -----------------------------------------------


# Coefficient of variation C(v)
# As standardized measure of dispersion we use: C(v) = S(x) / mean(x)

# a. Calculate the CV for the variable income and income0
cv <- function(x) sd(x) / mean(x)

cv(Prestige$income)
cv(Prestige$income_transformed)


# b. Discuss the results.
# Since the applied transformtion is linear and not proportional we obtain
# different CV for the two variables




# ----------------------------------------------- x -----------------------------------------------


# Interpretation of the standard deviation

# a. For the variable called income use R to calculate the interval: [mean(x) ??? 2Sx,  mean(x) + 2Sx]

lowerBound <- mean(Prestige$income) - (2 * sd(Prestige$income))
upperBound <- mean(Prestige$income) + (2 * sd(Prestige$income))

# b. How many data points actually lie in this interval?
sum(
  lowerBound <= Prestige$income & upperBound >= Prestige$income
)

# c. What proportion of points lie in this interval?
mean(lowerBound <= Prestige$income & upperBound >= Prestige$income)


# d. Does this proportion fit with the rule of thumb?
# from the rule of thumb we would expect 95%.

# e. Repeat part the above steps for the variable education.
educationCal <- function(x){
  m <- mean(x)
  s <- sd(x)
  
  lb <- m - (2 * s)
  ub <- m + (2 * s)
  
  total_count <- sum(lb <= x & ub >= x)
  proportion <- mean(lb <= x & ub >= x)
  
  paste('Total Data point: ', total_count, ' | Portion of Data Point: ', proportion)
}

# test function with income variable
print(educationCal(Prestige$income))

# implement for education
print(educationCal(Prestige$education))




# ----------------------------------------------- x -----------------------------------------------


# Empirical cumulative distribution function
# To get the R's default plot of the empirical cumulative distribution function (ecdf) use
plot(ecdf(Prestige$income))


# Note that the function ecdf() does the calculation and the plot() function displays it.

# a. You can change the plot with the following arguments
#    To get rid of the big black dots use the argument do.points = FALSE.
#    To draw the jumps as steps add the argument verticals = TRUE.
plot(
  ecdf(
    Prestige$income  
  ),
  do.points = FALSE,
  verticals = TRUE
)

# b. Notice that the ECDF for income rises steeply between 2000 and 10000 dollars, and is then shallow 
#   for values above that. This tells us that the variable is skewed (not symmetric). Compare this with 
#   the shape of the ECDF for education, which is roughly symmetric.
plot(
  ecdf(Prestige$education),
  do.point = FALSE,
  verticals = TRUE
)


# Matrices in R
# Specifying matrix objects
M <- matrix(1:6, nrow = 2)
M

# Assigning MAtrix by row
M <- matrix(1:6, nrow = 2, byrow = TRUE)
M


# You specify the number of rows and/or the number of columns using nrow or ncol, 
# you probably want to supply at least one of them. 
# dim() returns the number of rows and columns of a matrix:

M <- matrix(1:6, nrow = 2)
M
dim(M)

M <- matrix(1:6, ncol = 3)
M
dim(M)

M <- matrix(1:6)
M
dim(M)
# without specifying row and column: Its assign all elements into one columns


# A subset of elements in a vector can be accessed using square brackets. An example from Week 1 was:
fibonacci <- c(1, 1, 2, 3, 5, 8, 13, 21, 34, 55)


# The elements of a matrix are identified by the row and the column, so the square bracket notation 
# for a matrix requires two indices separated by a comma [.,.]. 
# The row index alway comes before the column index.

M <- matrix(1:6, nrow = 2)
M
M[1,3]

# You can specify multiple rows and/or columns:
M[1:2, 1]       # 1st and 2nd row and 1st column

M[2, c(1, 3)]   # 2nd row, 1st and 3rd column | Output: 2, 6

M[1:2, c(1, 3)]  # 1st and 2nd row, and 1st and 3rd columns | Output: 1, 5, 2, 6


# The subsetting of vectors, matrices, arrays and data frames is a very useful tool and we will
# be using it a lot.

M[2, ]      # All elements of 2nd ROW

M[, 3]      # All elements of 3rd COLUMNS


# Note that in the last example R returns the column as a vector. This is usually what one wants 
# so is the default behavior. - To drop one row of a matrix use a minus sign in the row field:

M[-2, ]     # All rows, expect 2nd row

# To drop one column of a matrix use a minus sign in the column field:

M[, -1]     # All rows, all columns except the 1st


# You can even specify the rows or columns using an R-object
x <- c(1, 3)

M[, x]      # All rows of 1st and 3rd columns 




# ----------------------------------------------- x -----------------------------------------------



# Matrix arithmetic

A <- matrix(1:6, nrow = 2, byrow = TRUE)
A

B <- matrix(5:10, nrow = 2, byrow = TRUE)
B

A + B


# Multiplication of a scalar and a matrix is also straightforward:
2 * A


# Matrix multiplication
# In R A * B performs element wise multiplication and 
# A %*% B performs the matrix multiplication used in mathematics.

A * B # element wise multiplication

A %*% B
# Error in A %*% B : non-conformable arguments
# Cause: Number of Column in A is not equal number of row in A

A %*% t(B)  # Need to transpose B


# t() transposes a matrix and solve() computes the inverse.
A
t(A)

solve(A)
# Error in solve.default(A) : 'a' (2 x 3) must be square
# To get a inverse matrix, the input shoould be SQUARE

D <- matrix(1:4, nrow = 2)
solve(D)

solve(D) %*% D


# Comparing data frames and matrices:
# The Prestige data is a data frame, it contains data elements in the rows and variables in the columns. 
# It is easy to think that a data frame is a type of matrix because it stores data in a rectangular 
# format. There are similarities, but they are not the same:
  
# All entries in a matrix must be numeric, otherwise matrix addition and multiplication won't work.
# A data frame consists of a number of variables and each variable is represented as a column in the 
# data frame. The length of each variable is equal.

# A data frame can have a mix of data types: numeric, factor, logical or character. 
# All the elements of one variable must have the same data type.
# The main similarity between a matrix and a data frame is that they are both represented as rows and 
# columns and the [., .] notation can be used for both.

data("iris")  # Load iris data-set

iris[10, ]    # Return 10th rows of the data set

iris[1:10, 4] # Return 1st 10 rows and 4 columns

iris[1:10, 'Species'] # Returns 1st 10 rows of Species columns
iris$Species[1:10]    # Returns 1st 10 rows of Species columns

str(iris)

