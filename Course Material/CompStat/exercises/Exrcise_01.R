###############################################################################################################
#   Statistical Computing Exercise-01
#   Date: 17th Oct 2022
###############################################################################################################

# Portion 2- Exercise: Expressions or assignments and basic arithmetic

#Calculate the following expressions

# 1. Type an expression to calculate 1234 + 2468
1234 + 2468

# 2. Store the result of 1234 + 2468 to an object named a.
a <- 1234 + 2468

# 3. Use the arithmetic operators -, *, / and ˆ for the following calculations:
# a. 87 − 105
87 - 105

# b. 32.4 × 18
32.4 * 18

# c. 13/8
13 / 8

# d. 6 to the power 3
6 ^ 3

# ----------------------------------------------------- X ----------------------------------------------------- 


# Portion 3- Exercise: Mathematical functions

# 1. √729
sqrt(729)

# 2. e5
exp(5)

# 3. ln 2
log(2, exp(1))

# 4. ln(e(5))
log(exp(5), exp(1))

# 5. log2 64
log(64, 2)

# 6. log10 1000
log(1000, 10)

# 7. |− 5|
abs(-5)


# ----------------------------------------------------- X ----------------------------------------------------- 


# Portion 4-  Creating vectors in R
x <- c(0, 4, 9, 100, -1)
y <- c(x, 10, 11, x)

length(y) # Number of all combine elements

z <- 1:10
z

# This notation is very important in R, you will be using it a lot.
# More generally, seq(i,j,k) is a sequence from i to j in steps of k.

seq(3, 10, 2) # get a sequence from 3 to 10 (including) with 2 interval
seq(0, 10, 2) # get a sequence from 0 to 10 (including) with 2 interval


#1. Define the following vectors in R:
#  • a = sequence from 0 to 8
a <- 0:8
a

#  • b = (1, 1, 1, 2, 2, 2, 3, 3, 3)
b <- c(1, 1, 1, 2, 2, 2, 3, 3, 3)
b

#  • c = (1, 2, 2, 3, 3, 3, 4, 4, 4)
c <- c(1, 2, 2, 3, 3, 3, 4, 4, 4)
c

#  • d = (1, 2, 2, 3, 3, 3, 4, 4, 4)
d <- c(1, 2, 2, 3, 3, 3, 4, 4, 4)
d


# 2. Now read the help for the function rep and redefine vectors b and ‘c
(b <- rep(1:3, each=3))

(c <- rep(1:4, c(1:3, 3)))


# 3. Assign the first 10 Fibonacci numbers 1, 1, 2, 3, 5, 8, 13, 21, 34, 55 to a vector called fibonacci.
# In the script window type the following comment above the previous command.

fibonacci <- c(1, 1, 2, 3, 5, 8, 13, 21, 34, 55)

# ----------------------------------------------------- X ----------------------------------------------------- 

# Portion 5- Exercise: R Vector Arithmetic

# 1. Take a look at the vectors created so far

x

y

z

# 2. Write down by hand the outcome you expect from the following expressions without running the R code.

# 2 * x

2 * x

# 2 + y
2 + y

# xˆ2
x ^ 2

# sqrt(x)
sqrt(x)

# log(x)
log(x)

1:(5^2)

# 3. Calculate the squares of the numbers 1, 2, 3, 4 and 5.
(1:5) ^ 2


# 4. Consider the following code and write down the outcome you expect. (We use the vectors defined in the exercise of section 4).
# a + b
# a * b
# a + x

a
b
x

a + b # = element wise sum of a and b

a * b # = element wise dot of a and b

a + x # = element wise sum of a and x

# 0  4  9  100 -1  0  4  9  100
# 0  1  2  3    4  5  6  7  8
# -----------------------------------
# 0  5 11  103  3  5 10 16  108


  
# ----------------------------------------------------- X ----------------------------------------------------- 

# Portion 6- Exercise: Types of vector

myWords <- c("This", "is", "a", "vector", "of", "characters", ".")
myWords

myLogical <- c(TRUE, FALSE, FALSE, TRUE, TRUE)
myLogical


myFactor <- factor(c("low", "high", "medium", "medium", "high"))
myFactor

# 2. Run ?factor and find out how to improve the ordering of the levels.
myFactor <- factor(myFactor, levels = c("low", "medium", "high"))
myFactor


# ----------------------------------------------------- X -----------------------------------------------------

# Portion 7- Exercise: Indexing/subsetting vector components

# 7.1 Positonal subsetting

# 1. Consider the following code and write down the outcome you expect.
x <- c(1, 3, 4, 8, 9)
x[1] # 1

x[1:3] # 1, 3, 4

x[c(1, 3, 5)] # 1, 4, 9


# 3. Extract the two last elements of the fibonacci vector and use them to calculate the eleventh element.

new_fibonacci <- fibonacci[9] + fibonacci[10] 

# 4. Add the eleventh element to the existing fibonacci vector
fibonacci[11] <- new_fibonacci
fibonacci


# 7.2 Logical subsetting

# 1. Make sure you understand the follwing code and outcome:

x <- c(1, 3, 4, 8, 9)
x >= 4 # F F T T T

# 2. Consider the following code and write down the outcome you expect.
x[c(TRUE, FALSE, FALSE, TRUE, TRUE)] # 1, 8, 9

x[x >= 4] # 4, 8, 9


# 4. Extract all elements of the fibonacci vector that are smaller than 10 or larger than 20.
# (Hint: the OR operator | is required for that task.)

fibonacci[fibonacci < 10 | fibonacci > 20]
