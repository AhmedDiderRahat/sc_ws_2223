#######################################################################################################
#   Statistical Computing Exercise-05                                                                 #
#   Date: 18th Dec 2022                                                                               #
#######################################################################################################

# Preparations
rm(list = ls(all.names = TRUE))


# Contingency tables

# a. In the package carData there is a data frame called TitanicSurvival. Load the package and the data.
library(carData)
data("TitanicSurvival")


# b. Read the documentation for the TitanicSurvival dataset
?TitanicSurvival

# Documentation of TitanicSurvival
# Variables: survived (yes/no), sex (female, male), age (years), pessengerClass(1st, 2nd, 3rd)

# c. Apply the summary command to the data set and check, if the data looks plausible?
summary(TitanicSurvival)

str(TitanicSurvival)


# d. Obtain a frequency table to find out how many passengers survived and how many died. 
#    Determine also the relative frequencies.

cbind(
  table(
    TitanicSurvival$survived
  ), round(
    prop.table(
      table(
        TitanicSurvival$survived
      )
    ), digits = 3
  ) * 100
)


# e. Obtain a contingency table with the frequencies for survived and passengerClass. 
#    Use the dnn argument for table() to label the output appropriate.

freqTab <- table(
  TitanicSurvival$survived,
  TitanicSurvival$passengerClass,
  dnn = c('Survived', 'Passenger Class')
)

freqTab

# f. Calculate the overall relative frequencies, the column and row relative frequencies for passenger 
#    survival and class. Hint: see lecture notes and exercise sheet. [Round the values to 3 digits.]

# Relative frequency 
round(
  prop.table(
    freqTab
  ), 3
) * 100


# Columns relative frequency
round(
  prop.table(
    freqTab,
    margin = 2  # For Row relative frequency its 2
  ), 3
) * 100


# Row relative frequency
round(
  prop.table(
    freqTab,
    margin = 1  # For Row relative frequency its 1
  ), 3
) * 100


# g. Use the results from the commands above to answer the following questions.

# What proportion of passengers were 1st class and survived?
# Solution: 15.3%

# Of the 1st class passengers what proportion survived?
# Solution: 61.9%

# Of the 3rd class passengers what proportion survived?
# Solution: 25.5%

# Of those passengers who survived what proportion were 3rd class passengers?
# Solution: 36.2% 



# ----------------------------------------------- x -----------------------------------------------


# Bar charts: 

# Note: Diagrams always have a title and axis labels, so that a discussion of the relationship shown 
# is possible from the diagram alone. If the graph contains the information of further variables in 
# addition to the X and Y values, it requires a legend (see below).

# a. Plot a bar chart of passenger survival. Hint barplot(table(???))

barplot(
  table(TitanicSurvival$survived),
  main = 'Titanic Data: Passenger survival',
  xlab = 'survival',
  ylab = 'Absolute Frequency'
)


# b. Plot a bar chart of passenger survival and class. barplot(table(???,???))

barplot(
  table(
    TitanicSurvival$survived,
    TitanicSurvival$passengerClass
  ),
  main = 'Titanic Data: Passenger survival',
  xlab = 'Survival',
  ylab = 'Absolute Frequency'
)


# c. Bar plot accepts the arguments beside=TRUE and legend=TRUE. Investigate the effect of 
#    these two arguments.

freqTab <- table(
  TitanicSurvival$survived,
  TitanicSurvival$passengerClass
)

barplot(
  freqTab,
  main = 'Titanic Data: Passenger Survival',
  xlab = 'Passenger Class',
  ylab = 'Relative Frequnecy',
  beside = TRUE, # beside: a logical value. If FALSE, the columns of height are portrayed as 
                 # stacked bars, and if TRUE the columns are portrayed as juxtaposed bars.
  legend = TRUE,
  args.legend = list(title = 'Survival', x = "topright")
)

?barplot


# d. What effect does reversing the order of survived and passengerClass in table() have on the diagram?

barplot(
  table(
    TitanicSurvival$passengerClass,
    TitanicSurvival$survived
  ),
  beside = TRUE, 
  legend = TRUE,
  args.legend = list(title = 'Passenger class', x = "topright"),
  main = 'Titanic Data: Passenger Survival',
  xlab = 'Survival',
  ylab = 'Absolute Frequnecy'
)

# e. You want to visualize the relative survival within each passenger class as a bar chart.
barplot(
  prop.table(
    freqTab,
    margin = 2
  ),
  beside = TRUE,
  legend = TRUE,
  args.legend = list(title = 'Survival', x = 'topright'),
  main = 'Titanic Data: Passenger Survival',
  xlab = 'Passenger Class',
  ylab = 'Relative Frequency'
)

# f. Create the following bar chart and describe the information depicted with your own words.

barplot(
  prop.table(
    freqTab,
    margin = 1
  ),
  beside = TRUE,
  legend = TRUE,
  args.legend = list(title = 'Survival', x = 'topright'),
  main = 'Titanic Data: Passenger Survival',
  xlab = 'Passenger Class',
  ylab = 'Relative Frequency'
)


# Jointly summarizing a qualitative and a quantitative variable

# You have already learnt a good graphical method for comparing a quantitative variable
# across different levels of a qualitative variable: a box plot


# a. Load the Prestige data set to the global environment and have another look to the data 
#    ocumentation if necessary.


# b. Create a box plot for income split by type. Consider the remarks regarding plots in the
#    beginning of exercise.
boxplot(
  table()
)


# Jointly summarizing a qualitative and a quantitative variable:

# You have already learnt a good graphical method for comparing a quantitative variable across 
# different levels of a qualitative variable: a box plot.


# a. Load the Prestige data set to the global environment and have another look to the data
#    documentation if necessary.
data("Prestige")


# b. Create a box plot for income split by type. Consider the remarks regarding plots in the beginning 
#    of exercise.

boxplot(
  income ~ type,
  data = Prestige,
  xlab = 'Job Type',
  col = c('lightblue', 'lightgreen', 'orange')
)


# c. To obtain statistics for income split by type we use the function tapply(). 
# We can read the following call to the tapply() function as "apply the function median() to the 
# variable income split by type".
tapply(Prestige$income, Prestige$type, FUN = median)


# d. Many functions in R take a data variable as the first argument and then optional arguments to
#    specify further settings.

mean(Prestige$income)
mean(Prestige$income, trim = 0.1)

?mean
# trim: the fraction (0 to 0.5) of observations to be trimmed from each end of x before the mean 
#       is computed. Values of trim outside that range are taken as the nearest endpoint.


# e. Run the following code and discuss the results.
tapply(Prestige$income, Prestige$type, FUN = mean)

tapply(Prestige$income, Prestige$type, FUN = mean, trim = 0.1)

# Using trim function: remove the elements which is far from each other.


# f. The function quantile(x, probs = c(0.25, 0.75)) returns the lower and upper quartiles for the
# variable x. Obtain the lower and upper quartiles for income split by type using tapply(). 
# Note the slightly different output format. Observe that the
# values for the quantile in each group matches the edges of each box in the box plot.


