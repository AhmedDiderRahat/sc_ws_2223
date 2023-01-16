#######################################################################################################
#   Statistical Computing Lecture-05                                                                  #
#   Date: 14th Jan 2022                                                                               #
#######################################################################################################

# Preparations
rm(list = ls(all.names = TRUE))

data("InsectSprays")

tapply(InsectSprays$count, INDEX = InsectSprays$spray, mean)

tapply(InsectSprays$count, INDEX = InsectSprays$spray, sd)

boxplot(count ~ spray, data = InsectSprays,
        xlab = 'Type of Spray',
        ylab = 'Insect Counts',
        main = 'Insect Sprays data', 
        varwidth = TRUE, 
        col = 'lightgray')

points(1:length(unique(InsectSprays$spray)),
       tapply(InsectSprays$count, INDEX = InsectSprays$spray, mean), 
       pch = '*', col = 'red')


x <- c(-18.3, 17.0, 28.4, -14.3, 7.7)
y <- c(-17.6, -4.3, -4.7, -4.3, 15.7)

# covariance
cov(x, y)

# correlations
cor(x, y)

cor(x, y, method = 'spearman')

rank(x)

cor(rank(x), rank(y))
