#######################################################################################################
#   Statistical Computing Lecture-04                                                                  #
#   Date: 12st Jan 2022                                                                               #
#######################################################################################################

# Preparations
rm(list = ls(all.names = TRUE))

x <- rnorm(n=10, mean=50, sd=6)
x

# Measures of Dispersion

# sample variance
sum((x - mean(x))^2) / (length(x)-1)
var(x)

# Population variance
var(x) / length(x) * (length(x) -1)

# Sample Standard deviation
sd(x)

# Coefficient of variance
sd(x) / mean(x)

# range
range(x)

# IQR
IQR(x)

# Exercise... ... ...

# ECDF
data <- c(181, 174, 186, 172, 172, 186, 178, 182, 180, 196, 180, 173)
plot(ecdf(sort(data)), main = "ECDF (x)", col="red")

a <- c(1, 1.1, 1.2, 1.3, 1.4, 1.5)
mean(a)

var_a = mean((a-1.25)^2)
var_a

b = c(20, 22, 25, 28, 30, 35, 40)
mean(b)

var_b = sum((b-28.57)^2) / (length(b) - 1)
var_b

dt1 <- c(185, 148, 172, 126, 197, 198, 121, 158, 153, 142)

dt_len <- length(dt1)
dt_len

dt_mean <- mean(dt1)
dt_mean

var(dt1)

var_dt1 <- sum((dt1 - dt_mean)^2) / (dt_len-1)
var_dt1

std_dt1 <- sqrt(var_dt1)
std_dt1

cv_dt1 <- sd(dt1) / mean(dt1)
cv_dt1


median(dt1)

quantile(dt1, c(0.25, 0.50, 0.75))
