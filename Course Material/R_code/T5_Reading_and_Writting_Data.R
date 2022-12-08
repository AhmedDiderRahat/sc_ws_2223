#x <- read.table("Data/someData.txt")

someNumbers = rnorm(100)

aChar = rep("a", 100)

df <- data.frame(someNumbers, aChar)

write.table(df, "Data/someData.txt", append = FALSE, sep = " ", dec = ".", row.names = FALSE, col.names = TRUE)

# set the working directory
setwd("/Users/zeotaplaptop/Desktop/my_learning/sc_ws_2223/sc_ws_2223/Course Material")

# fetch the working directory
getwd()

x <- read.table("Data/someData.txt", header = T)
str(x)


# define the class for each variable
x <- read.table("Data/someData.txt")

classes = c(someNumbers = "numeric", aChar = "character")

y <- read.table("Data/someData.txt", header = T,
                nrows = 100,
                colClasses = classes)
str(y)

# readLines function to read a text file line by line
x <- readLines("Data/someData.txt")

x[1:4]

# writeLines function to write in a text file line by line
writeLines(x, con="Data/someData.txt")

x <- read.table("Data/someData.txt", header = T)
str(x)
