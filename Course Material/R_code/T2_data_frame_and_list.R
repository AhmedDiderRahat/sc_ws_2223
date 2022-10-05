# Data Frame

x <- data.frame(eggs = 1:4, ham = c(TRUE, TRUE, FALSE, FALSE))

print(x)

print(nrow(x)) # number of row

print(ncol(x)) # number of column

print(dim(x)) # total dimension


# str() function is used to get the summary of the data frame

x <- data.frame(my_num = 1:4,
                my_char = "a", 
                my_logic = c(TRUE, FALSE, FALSE, TRUE))

print(x)

str(x)

# ------------------------- x -------------------------


# Lists

x <- list(1, 2, "a", TRUE)
print(typeof(x))

print(x)

# Named List/ Nested List

x <- list(a = 1, 
          b = list(1, 2), 
          c = data.frame(x = 1:2))
print(x)

str(x)
