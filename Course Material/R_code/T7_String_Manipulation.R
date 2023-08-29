# Preparations
rm(list = ls(all.names = TRUE))

# Paste: Convert any arguments to a character and concatenates them
x <- "Some"
paste(x, "String")

y <- paste(x, "String")
y

z <- c("Some", "More")
a <- paste(z, "String", sep = '_')
a

b <- paste("Some", "More", "String", sep = '_')
b

# ------------------------------------- x -------------------------------------


# strsplit: Split  a string into several substring

strsplit(y, split = ' ')

b1 <- strsplit(a, split = '_')
b1

b2 <- strsplit(b, split = '_')
b2

# Escape Sequences

newLine <- "new\nLine"
print(newLine)

cat(newLine)

moreNewLines <- paste(rep('new', 3), 'line', sep = '\n')
moreNewLines


# ------------------------------------- x -------------------------------------

# Grep: Find patterns inside of characters

print(a)

grep('String', a)
# return the position of the strings whose are matched with 'String'

c1 <- "Some_String More_String dider rahat_String"
c1 <- strsplit(c1, ' ')
c1[[1]]

c1

grep('String', c1[[1]])


# if the string is not in the given list
grep('Rahat', a)

grep('Rahat', c1)
grep('rahat', c1[[1]])

# get logical output
grepl('Some', a)

# ------------------------------------- x -------------------------------------

# replace a string with sub
print(a)
sub('String', 'Somethings', a)


# Select only those columns in dat which start with “x’ ’
dat <- as.data.frame(matrix(1:100, nrow = 10))
dat

str(dat)

names(dat)[1:5] <- paste('x', 1:5, sep = '')
dat

str(dat)

# select those columns whose name starts with x

dat[, grep('x', names(dat))]


# rename multiple columns

names(dat)[1:2] <- c('y1', 'z1')
dat[1:3, ]

# with pipe operator

dat %>% select(starts_with('x')) %>% slice(1:3)

# ------------------------------------- x -------------------------------------

names(dat)[1:2] <- c('vX1', 'x_something')

names(dat)

grep('^x[0-9]', names(dat))
# output: 3, 4, 5
# 1 is not included because X is capital
# 2 is not incluede because there are no number after x

# now use X or x
grep('*[xX][0-9]', names(dat))
# ^ means starts with