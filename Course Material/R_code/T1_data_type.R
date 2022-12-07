#R data types

x <- c(0.5, 0.6)    # double
print(typeof(x))

x <- c(TRUE, FALSE) # logical
print(typeof(x))

x <- c(T, F)        # logical, but harder to read
print(typeof(x))


x <- c("a", "b", "c") # character
print(typeof(x))

x <- 9:29           # integer
print(typeof(x))

x <- c(1+0i, 2+4i)  # complex
print(typeof(x))

# ----------------------------- x ------------------------------

# Mixing Objects

# logical < integer < numeric < complex < character

x <- c(1.7, "a")
print(typeof(x))


x <- c(TRUE, 2)
print(typeof(x))

x <- c("a", TRUE, 1)
print(typeof(x))

x <- c("a", c(TRUE, 1))
print(typeof(x))
print(class(x))

# Explicit Coercion
x <- 0:6
class(x) # integer

y <- as.numeric(x) # Numeric
class(y)

y <- as.logical(x)
class(y)    # Logical

y <- as.character(x)
class(y)

y <- as.complex(x)
class(y)

# Nonsensical coercion results in NAs.
x <- c("a", "b", "c")
class(x)  # character

y <- as.numeric(x)
# Warning message:
# NAs introduced by coercion 
print(y)

# -------------------------- x --------------------------

# Factors

x <- factor(c("yes", "yes", "no", "yes", "no"))
x

table(x)

unclass(x)

# levels could be set by using lavels arguments 
x <- factor(c("yes", "yes", "no", "yes", "no"), levels = c("yes", "no"))
x

table(x)
unclass(x)

# Reorder and Levels of a factor
x
x <- relevel(x, ref="no")

unclass(x)

## New and relabeled Levels
exam <- c(TRUE, TRUE, FALSE, TRUE, FALSE)
exam <- factor(exam, 
               levels=c(TRUE, FALSE),
               labels = c("success", "failure"))
print(exam)
table(exam)

