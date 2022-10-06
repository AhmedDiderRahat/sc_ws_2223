# subsetting

# subset of List

x <- c("a", "b", "c", "c", "d", "a")

x[1]    # first object

x[2]    # second object

x[1:4]  # object from 1 to 4

x[x > "a"]  # objects that are larger then a

y <- x > "a"  # create a logical vector to see all vectors that are greater than a
y

x[y]    # print all the element of x, which has a TRUE value in vector y


# ---------------------------------- x ----------------------------------

# subset of DataFrame

x <- data.frame(eggs = 1:4, 
                ham = c(TRUE, TRUE, FALSE, TRUE))
print(x)  # print the dataframe

print(x$eggs)         # print all the element from column eggs-> with column name

print(x[["eggs"]])    # print all the element from column eggs-> with column name

print(x[, "eggs"])    # print all the element from column eggs-> with column name


# Subsetting data frames with positions

print(x[1])           # print the first column

print(x[[1]])         # print all the elements from first column

print(x[c(1,3), 2])   # Print element 1, and 3 from column 2



# Subsetting data frames with logicals

x[x$eggs > 2, ]     # All rows that have more than 2 eggs

x[x$ham, ]          # All rows that have ham == TRUE

x[c(FALSE, TRUE)]   # by setting a logical vector we can spacify which column need to pick



# Subsetting data frames with logicals

# To delete elements in a list you can simply assign the value NULL to them
x[1] <- NULL
x


x <- data.frame(eggs = 1:4,
                ham = c(TRUE, TRUE, FALSE, FALSE))
print(x)

# For a subset of rows select the rows to keep or use data.frame[-<rows>, ]
print(x[-(1:2), ])  # Print all rows expect 1 and 2


# ---------------------------------- x ----------------------------------


# Removing NA values

x <- c(1, 2, NA, 4, NA, 5)
print(x)

bad <- is.na(x)
print(bad)

print(x[!bad])

airquality[1:6, ]

# Omitting Na values
na.omit(airquality)[1:6, ]


# Subsetting Lists
x <- list(a = list(10, 12, 14), 
          b = c(3.14, 2.81))

print(x[[1]][[3]])    # get the data from 1st row and 3rd column

print(x[[c(1,3)]])    # get data from c(1,3) location



# Partial Matching
x <- list(ham = 1:5, cheese = pi)
print(x)

print(x$c)  # use partial naming: used c instead of cheese

print(x[["c"]])
print(x[["cheese"]])  # partial naming is not working with the indexing

print(x[["c", exact=FALSE]])  # adding exact argument

x <- c(x, hohoho="Hohoho")
print(x)

print(x$h)  # will give NULL, because there are two elements start with h

print(x$ha) # will give the elements of ham
