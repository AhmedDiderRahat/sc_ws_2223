#######################################################################################################
#   Statistical Computing Lecture-03                                                                  #
#   Date: 1st Jan 2022                                                                                #
#######################################################################################################

# Preparations
rm(list = ls(all.names = TRUE))

x <- 5:15
x

quantile(x, probs = 0.5)

quantile(x, probs = 0.1)

quantile(x, probs = c(0.1, 0.11))

# Quartiles
quantile(x)

# Deciles
quantile(x, probs = 1:9/10)

# Percentiles
quantile(x, prob = 1:99/100)

# BMI 
bmi <- c(18.13, 18.53, 20.75, 21.86, 22.65, 22.93, 22.95, 23.75, 23.82, 24.01, 24.68, 24.89, 25.25, 
         25.75, 25.85, 25.9, 26.11, 26.73, 27.2, 27.67, 27.94, 28.19, 29.29, 31.22, 32.37)

boxplot(bmi)
