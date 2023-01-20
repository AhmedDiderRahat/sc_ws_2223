#######################################################################################################
#   Statistical Computing Lecture-06                                                                  #
#   Date: 18th Jan 2022                                                                               #
#######################################################################################################

# Preparations
rm(list = ls(all.names = TRUE))

library(mas3321)

data(crickets)

str(crickets)

plot(crickets$chirps, crickets$temperature, main="Cricket data",
     xlab="Temerature[C]", ylab="Crips per minute", pch=19)

df_train = crickets[sample(nrow(crickets), 11), ]

print(df_train)

print(crickets)

set.seed(101) # Set Seed so that same sample can be reproduced in future also

# Now Selecting 80% of data as sample from total 'n' rows of the data

sample <- sample.int(n = nrow(crickets), size = floor(.80*nrow(crickets)), replace = F)
print(sample)

train <- crickets[sample, ]
test  <- crickets[-sample, ]

print(train)
print(test)

(temp_mean <- mean(train$temperature))
(temp_sd <- sd(train$temperature))

(rate_mean <- mean(train$chirps))
(rate_sd <- sd(train$chirps))

(temp_rate_cov <- cov(train$temperature, train$chirps))

(b1_estimate <- (temp_rate_cov / (temp_sd ^ 2)))
(b0_estimate <- rate_mean - (b1_estimate * temp_mean))

# for 79.6 -> 15.0
(predic3 <- b0_estimate + (b1_estimate * 79.6))

(predic1 <- b0_estimate + (b1_estimate * 71.6))
(predic2 <- b0_estimate + (b1_estimate * 84.3))

(predicted_val <- c(predic1, predic2, predic3))

print(test$chirps)

# rmse
(test_rmse <- sqrt(mean((predicted_val - test$chirps)^2)))


# Simple Linear Regression

lm01 <- lm(chirps ~ temperature, data = crickets)

summary(lm01)

# Wriiten Exercise 

data <- read.csv(file = '../Data/ln_06_w1.csv')
print(data)

plot(data$fathers, data$sons, main="Father and Sons data",
       xlab="Fathers height", ylab="Sons height", pch=19)

x <- data$fathers
y <- data$sons

# Calculating mean
(x_mean <- mean(x))
(y_mean <- mean(y))

# calculating deviation x(i) - mean of x

(x_dev <- (x - x_mean))
(y_dev <- (y - y_mean))


(cov_xy <- (1/(length(x)-1)) * (sum(x_dev * y_dev)))

print(cov(x,y))

(x_sd <- sqrt((1/(length(x)-1)) * sum(x_dev^2))) 

(y_sd <- sd(y))

(cor_xy <- cov_xy / (x_sd * y_sd))

print((1/(length(x)-1)) * sum(x_dev^2))

var(x)

(b1 <- cov_xy / var(x))

(b0 <- y_mean - (b1 * x_mean))

(p1 <- b0 + (b1 * 65))

p1 - 65

(p2 <- b0 + (b1 * 66.667))
