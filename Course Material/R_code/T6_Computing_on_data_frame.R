library(dplyr)

# install the library
# install.packages("nycflights13", dep=T)

# Load the dataset
library(nycflights13)

# Summary of the dataset
str(flights)

# Class of the dataset
class(flights)

# ------------------------------------- x -------------------------------------

# Filter Rows: we can select all flights on july 1st with:

x <- filter(flights, month == 7, day == 1)
x

# This is equivalent to the more verbose:

x <- flights[flights$month == 7 & flights$day == 1]
x

# Multiple filtering conditions
# For example, we can select all flights that started early and arrived late:

filter(flights, dep_delay < 0  &  arr_delay > 0)

# Select rows by position
# To select rows by position, use slice():

slice(flights, 2:5)

# Arrange (reorder) rows with arrange()
# arrange() orders the rows of a data frame by the values of selected columns

arrange(flights, year, month, day)

# Use desc() to order a column in descending order:
arrange(flights, desc(arr_delay))

# select column by their name
select(flights, year, month, day)


# Select all columns between year and day (inclusive)
select(flights, year:day)

# Select all columns except those from year to arr_time (inclusive)
select(flights, -(year:arr_time))

# renaming of variables
# You can rename variables with select() by using named arguments:

select(flights, depTime = dep_time)

# Instead, use rename():
rename(flights, depTime = dep_time)

# Extract distinct (unique) rows

# A common use of select() is to find out which values a set of variables takes
distinct(select(flights, tailnum))

# distinct pair
distinct(select(flights, origin, dest))

# Generate new columns with mutate()
# As well as selecting from the set of existing columns, it’s often useful to add new columns that are functions of existing columns.

x <- mutate(flights, 
       gain = arr_delay - dep_delay,
       speed = distance / air_time * 60)

select(x, gain, speed)

# If you only want to keep the new variables, use transmute():
transmute(flights,
          gain = arr_delay - dep_delay,
          speed = distance / air_time * 60)

# Summarize values with 'summarise()'
summarise(flights,
          delay = mean(dep_delay, na.rm = TRUE))

# ------------------------------------- x -------------------------------------

# Randomly sample rows

# Took n sample
sample_n(flights, 10)

# Took specific portion of data
sample_frac(flights, 0.01)


# Grouped Operations
by_tailnum <- group_by(flights, tailnum)

delay <- summarise(by_tailnum,
                   count = n(),
                   dist = mean(distance, na.rm = TRUE), 
                   delay = mean(arr_delay, na.rm = TRUE))

delay <- filter(delay, count>20, dist <2000)

delay

# Grouped by operations
destinations <- group_by(flights, dest)

summarise(destinations,
          no_of_planes = n_distinct(tailnum),
          no_of_flights = n())


# ------------------------------------- x -------------------------------------

# Function Chaining: 

a1 <- group_by(flights, year, month, day)

a2 <- select(a1, arr_delay, dep_delay)

a3 <- summarise(a2, 
                arr = mean(arr_delay, na.rm=TRUE), 
                dep = mean(dep_delay, na.rm = TRUE))

a4 <- filter(a3, arr > 30 | dep > 30)

a4

# Or implement it with Chaining

filter(
  summarise(
    select(
      group_by(flights, year, month, day),
      arr_delay,
      dep_delay
    ),
    arr = mean(arr_delay, na.rm = TRUE),
    dep = mean(dep_delay, na.rm = TRUE)
  ),
  arr > 30 | dep > 30
)


# Or use Pipe Operator

flights %>%
  group_by(year, month, day) %>%
  select(arr_delay, dep_delay) %>%
  summarise( 
    arr = mean(arr_delay, na.rm=TRUE), 
    dep = mean(dep_delay, na.rm = TRUE)
    ) %>%
  filter(arr > 30 | dep > 30)
  