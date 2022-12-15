#######################################################################################################
#   Statistical Computing Exercise-02                                                                 #
#   Date: 15th Dec 2022                                                                               #
#######################################################################################################


# Reading text data

# a. Read the data from GU.csv using the command read.csv via

Gotham <- read.csv(file = '../Data/GU.csv')

# c. Start investigating the Gotham data set by running

nrow(Gotham) # number of row

ncol(Gotham) # number of column

dim(Gotham)  # number of dimension  

# Variable names and types

# a. Gotham is stored in R as a data.frame object:

class(Gotham)

# b. You have already found out how many variables are in this data set. Use names(Gotham) 
#    to find the names of the variables in the data set.
names(Gotham)


# c. You can access a variable (= column) in a data frame easily using the dollar sign
Gotham$Income

# d. To find out the variable type of the values stored in Gotham$Income use: 
class(Gotham$Income)

# e. Determine the data types of all the variables in the data set.
sapply(Gotham, typeof)

# f. Run str(Gotham) and discuss the outcome.
str(Gotham)

# Here, Gotham dataset has 26 observation and 5 variable/columns
# all the variable type of the columns are also given


# Frequencies for a nominal variable
# As nominal variable we choose Gotham$DegreeSubject.

# a. Table of absolute frequencies:
table(Gotham$DegreeSubject)

# b. Table of relative frequencies:
prop.table(
  table(Gotham$DegreeSubject)
)

# c. The amount of decimal places is a bit overkill! Let's round the proportions to 3 decimal
#    places and present them as percentages

round(
  prop.table(
    table(Gotham$DegreeSubject)
  ), 
  digits = 3
) * 100

# d. We can present both the absolute and relative frequences in one object using the function cbind:
cbind(
  table(
    Gotham$DegreeSubject
  ), round(
    prop.table(
      table(
        Gotham$DegreeSubject
      )
    ), digits = 3
  ) * 100
)


# e. What do you think the function rbind() does? Try it out. Check the help ?rbind.
?rbind

rbind(
  table(
    Gotham$DegreeSubject
  ), round(
    prop.table(
      table(
        Gotham$DegreeSubject
      )
    ), digits = 3
  ) * 100
)

# f. Table of cumulative frequencies:
cumsum(
  table(Gotham$DegreeSubject)
)


# Graphics for frequency data

# a. Presenting frequency data is usually done using a bar chart:
barplot(
  table(Gotham$DegreeSubject)
)


# b. For i) this plot is sufficient. For ii) we need to add arguments for the titles, colours or a
#           legend. As an example

barplot(
  table(Gotham$DegreeSubject),
  main = '26 Gotham City Uni. Student', # the title
  sub = 'Degree Subject',               # x-axis label   
  ylab = 'Frequency',                   # y-axis label
  col = c('lightgreen', 'lightpink',    # Color of each bar
          'lightblue', 'orange')
)

# c. For continuous variables a bar chart is not a good idea. To find out why, plot a bar
#    chart for the variable Income.

barplot(
  table(Gotham$Income),
  main = '26 Gotham City Uni. Student', # the title
  sub = 'Income',                       # x-axis label   
  ylab = 'Frequency',                   # y-axis label
  col = c('lightgreen', 'lightpink',    # Color of each bar
          'lightblue', 'orange')
)

# A lot of individual points are in the plot.

# d. Now we go for a histogram
hist(Gotham$Income)

# e. Improve the layout of the histogram using the arguments you have learned by 
#    improving the bar chart.

hist(
  Gotham$Income,
  main = 'Histrogram of Income Data',
  xlab = 'Income',
  ylab = 'Frequency'
)

# ----------------------------------------------- x -----------------------------------------------

# Exercise: Frequency table
# a. Obtain the four types frequency for the variable number of siblings, in the GCU data
#    and present them all in one table.

cbind(
  table(
    Gotham$NSiblings
  ), round(
    prop.table(
      table(
        Gotham$NSiblings
      )
    ), digits = 3
  ) * 100
)


# b. Obtain a bar chart for the number of siblings.
barplot(
  table(Gotham$NSiblings),
  main = '26 Gotham Uni Student',
  sub = 'Number of Sibling',
  ylab = 'Frequency',
  col = c('lightgreen', 'lightpink', 'lightblue', 'orange')
  
)
