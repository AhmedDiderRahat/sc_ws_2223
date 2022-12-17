#######################################################################################################
#   Statistical Computing Exercise-03                                                                 #
#   Date: 15th Dec 2022                                                                               #
#######################################################################################################



# Preparations:

# a. Make sure you work inside your RStudio project. Details please see Exercise 01.

# b. Install the R package carDate by running the following code

install.packages('carData')

# c. Open a new R script file (either Shift + Ctrl + N or via the menu), type the following
#    comment/code in the first line and save the file.

rm(list = ls(all.names = TRUE))

# d. Ask your professor about the command rm(list = ls(all.names = TRUE)) in the next lecture.
# Delete all variable or make empty the Environment


# e. Work through the following examples as you did last week. In many of the code examples the output
#    is not included, you should always read and understand the output.
#    Please add comments (in your own words) to your code so that it will make sense to you when you 
#    return several weeks (or years) later.

# f. When there is a question in the text e.g. "What is the mean and standard deviation of the 
#    prestige Scores?", copy the question and the answer as a a comment to your R code.



# The Prestige data set and basic summary statistics

# When analysing data you will usually start by carrying out some simple procedures to get a
# feeling for the data. Typically, we will produce some appropriate plots and calculate some
# useful summary statistics.



# ------------------------------------------------ X ------------------------------------------------ 

# Loading the data
# a. In this section we will be using the Canadian Prestige data set. To work with this data set 
#    add the following code to your script and run the commands.

library(carData)

data(Prestige)

Prestige

# 03: Summarising numeric variables-

# b. First of all we should find out how many rows and columns our data set has via
dim(Prestige)

# c. To find the names of the variables type
names(Prestige)

# Notice that there is a variable called prestige in the data frame called Prestige.

# d. A quick method of seeing what the data type for each variable is, is
str(Prestige)

# The basic commands to summaries the numeric variables in the data set are straightforward.
# mean() arithmetic mean
# median() median
# SD() standard deviation
# var() variance
# quantile() quantile

# You will learn about the standard deviation and variance1 one of the next lectures, but they
# measure how spread out the data values are.


# e. Calculate the following statistics for the variable income:
mean(Prestige$income)
median(Prestige$income)
sd(Prestige$income)
var(Prestige$income)
sqrt(var(Prestige$income))

# The units of the mean, median and standard deviation are the same as the measured variable
# e.g. Canadian dollars. The units of the variance are squared units e.g. dollars2 . In terms of
# understanding the numbers, the standard deviation is much more helpful than the variance


# f. We may also want to compute the quantiles of a set of numeric data. The command is quantile. 
#    For example, to obtain the lower and upper quartiles of income:
quantile(Prestige$income, probs = c(0.25,0.50, 0.75))

# g. Approximately how many income values would you expect to be less than the lower quartile 
#    found above? Check your answer using

sum(
  Prestige$income < quantile(Prestige$income, probs = 0.25)
)
# It means: 26 points has less value from the 25 percentile 

mean(
  Prestige$income < quantile(Prestige$income, probs = 0.25)
)
# it is 0.254902 meaning almost 25% of data point


# h. Discuss why the above expressions work although
Prestige$income < quantile(Prestige$income, probs = 0.25)

# return a logical vector, FALSE mean the data point is larger then 25%



# Exercise:
# a. What is the mean and standard deviation of the prestige Scores?

mean(
  Prestige$prestige
)



# b. What is the median of the census codes? Does this statistic even make sense?
median(
  Prestige$census
)
# as its just a code, so no important info could be fetched out of it. 




# ------------------------------------------------ X ------------------------------------------------ 

# Excursus: missing values
# These applied functions all have arguments that control the treatment of missing values (e.g. NA). 
# These arguments are there for convenience and readability they're not really necessary. For example,
# mean(x, na.rm=TRUE) is just a convenient and more readable way of expressing mean(x[!is.na(x)]).


# a. Try this yourself. Create a vector x with the following values
x <- c(1:5, NA, 10:15, 100)
x

# b. Investigate the above command by inspecting the outcome of the following expressions. 
#    Comment the R code with your findings.

is.na(x)      # BOOLEAN values: FALSE if not NULL
!is.na(x)     # BOOLEAN values: TRUE if not NULL
x[!is.na(x)]  # ALL numbers without NULL


# c. Now run the following code and discuss the results
mean(x)               # NULL as there is a NULL element
mean(x, na.rm = TRUE) # First remove NULL elements, then take the mean
mean(x[!is.na(x)])    # First took all NON-NULL values then calculate the AVG.




# ------------------------------------------------ X ------------------------------------------------ 


# Summarising categorical variables
# The type and census variables in our data frame Prestige represent categorical/nominal variables 
# (i.e. those that take values in a discrete set of non-ordered categories). In this particular case,
# censusis represented by numbers, even though the levels do not correspond to amounts. 
# The variable can be analysed as if it is numeric even if this is not sensible 
# (see that last exercise).


# a. The way to summarise categorical variables is in a frequency table, i.e. count the number 
#    of times each value occurs:

table(Prestige$type)

# b. To find the modal value of a factor variable the quickest method is to obtain the frequency 
#    table and read of which is the largest value. What is the mode of type?

# Answer: The MODE is the highest occurred data point in a data set. Here, 'bc' is the MODE.


# c. The R command to find the mode is to obtain which position in the table has the highest frequency:
which.max(table(Prestige$type))

# you can also subset the table with that position
table(Prestige$type)[which.max(table(Prestige$type))]


# d. Add up the counts for bc, prof and wc in the frequency table. How many rows does the data
#    frame have? Notice that there is a difference between these two numbers. This is because there
#    are some NAs in type. If we want to include these in the table use:
table(Prestige$type, useNA = 'always')

# Automatically calculate the sum of the counts per category:
addmargins(
  table(Prestige$type, useNA = 'always')
)


# e. If you want the proportions then we can use the function prop.table. Note that prop.table 
#    expects an object of class table as input, which means that most of the time we use the 
#   slightly odd expression prop.table(table(...))
round(
  prop.table(
    table(Prestige$type, useNA = 'always')
  ), digits = 3
) * 100




# ------------------------------------------------ X ------------------------------------------------ 


# The summary command: 

# a. One of the most useful functions in R is summary(). Try this with
summary(Prestige$income)
# Since income is a numeric variable, you get a standard 6-number summary of the data
# (minimum, lower quartile, median, mean, upper quartile and maximum).

# b. Such a summary would be unsuitable for a categorical variable, so
summary(Prestige$type)
# Notice that the summary command automatically reports missing values


# c. The Prestige data frame has row names containing the types of job, so
row.names(Prestige)[is.na(Prestige$type)]
# OUTPUT: "athletes" | "newsboys" | "babysitters" | "farmers"
# returns the 4 jobs, for which the value of type is missing.


# d. What does summary do if you give it a data frame as an argument? Try it and find out.
summary(Prestige)
# Give all the summary of each columns



# ------------------------------------------------ X ------------------------------------------------ 

# Boxplots:

# A boxplot is used to compare a numeric variable across several groups in a data frame. 
# The exact format of a box plot differs between packages; in R the box is defined by the 
# lower quartile, median and upper quartile, while the "whiskers" extend to the data point
# that is no more than 1.5 times the interquartile range from the box. Any observation outside
# the whiskers is defined as an extreme value and is shown as a point.

boxplot(
  prestige ~ type,
  data = Prestige,
  xlab = 'Job type',
  col = c('lightblue', 'lightgreen','orange')
)

# and discuss the result.
# Notice the strange use of the tilde sign ~ in prestige~type. 
# This is called an model formula. Model formula are common in model fitting, and the details are not 
# important now; you will come across them later in the course. For now, read the formula as prestige 
# depends on 'type using the data frame-Prestige'.


# b. Notice that the alphabetical ordering of the three values in the variable type is not ideal. 
#    This is because type is an ordinal variable and a more sensible ordering of these values would 
#    be bc, wc and prof. To override the default ordering, we redefine the factor variable with the 
#    levels specified as an argument.

Prestige$type <- factor(Prestige$type, levels = c('bc', 'wc', 'prof'))
boxplot(
  prestige ~ type, 
  data = Prestige,
  xlab = 'Job Type',
  col = c('lightblue', 'lightgreen','orange'),
  varwidth = TRUE
)


# c. Check the help for boxplot and find out what the argument varwidth=TRUE does to the visualization.

?boxplot

# The varwidth argument is TRUE/FALSE. 
# -> TRUE: the boxes are drawn with widths proportional to the sqrt. of the number of observations.
# -> FALSE: All the boxes are same width.