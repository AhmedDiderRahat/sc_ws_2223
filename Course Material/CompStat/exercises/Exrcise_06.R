#######################################################################################################
#   Statistical Computing Exercise-06                                                                 #
#   Date: 20th Jan 2023                                                                               #
#######################################################################################################


# Preparations
rm(list = ls(all.names = TRUE))

occupancy <- c(20, 50, 70, 100, 100)
consumption <- c(25, 35, 20, 30, 45)

plot(occupancy, consumption, main = "Guest Water consumption", 
     xlab = "Occupancy", ylab = "Water Consumption", pch = 19)


# c) Calculate the following statistics and save the results as a comment in your R code.

# mean of x and y
(x_mean <- mean(occupancy))
(y_mean <- mean(consumption))

# sum of square of x(i) - mean(x)
sum((occupancy - x_mean)^2)
sum((consumption - y_mean)^2)

sum((occupancy - x_mean) * (consumption - y_mean))

# variances 
(sx <- (1 / (length(occupancy) - 1)) * (sum((occupancy - x_mean)^2)))
(sy <- (1 / (length(occupancy) - 1)) * (sum((consumption - y_mean)^2)))

# Covariance of x and y
(sxy <- (1 / (length(occupancy) - 1)) * sum((occupancy - x_mean) * (consumption - y_mean)))

# Slope b1 hat:
(b1 <- sxy / sx)

# intercept coefficient
(b0 <- y_mean - (x_mean * b1))

# d) Write down the regression function.
# f(x) = b0 + (b1 . x)

# e) Add the regression line to the scatter plot using the function abline
# a, b the intercept and slope, single values.

plot(occupancy, consumption, main = "Guest Water consumption", 
     xlab = "Occupancy", ylab = "Water Consumption", pch = 19)
abline(b0, b1, col="red")

?abline()

# f) What is the water consumption according to the regression model when the hotel has
#    an occupancy of 75 guest-nights? This is called the predicted value.

(p75 <- b0 + (b1 * 75))

# g) Calculate the 5 residuals r(i) and their sum

errors <- function(x, y) {
  yp <- b0 + (b1 * x)
  e <- y - yp
}


(e1 <- errors(occupancy[1], consumption[1]))
(e2 <- errors(occupancy[2], consumption[2]))
(e3 <- errors(occupancy[3], consumption[3]))
(e4 <- errors(occupancy[4], consumption[4]))
(e5 <- errors(occupancy[5], consumption[5]))

sum(c(e1, e2, e3, e4, e5))


# h) What proportion of the variance of the observed water consumption can be explained by the occupancy?
#    Calculate the Pearson correlation coefficient for water consumption and occupancy.

# r2 = (b1 x var(x)) / (var(y))
(r2 <- ((b1^2) * sx) / sy)
(r_score <- sqrt(r2))


# Regression using lm
lm01 <- lm(consumption ~ occupancy)

lm01
# intercept = 22.1368
# occupancy = 0.1303

coef(lm01)
# print the coefficent of the model

summary(lm01)
# summary of the model

fitted(lm01)
# Fitted value from the regression line

resid(lm01)
# all the residual errors

test_df <- data.frame(occupancy=75)
  
predict(lm01, newdata = test_df)

?predict.lm
