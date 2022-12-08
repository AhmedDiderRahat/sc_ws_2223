x <- 1:4  # 1, 2, 3, 4

y <- 6:9  # 6, 7, 8, 9

x+y       # element-wise sum

x > 2     # where, x is greater than 2

x >= 2    # where, x is greater than or equal to 2

y == 8    # where, y is 8

x / y     # vector divison 

# -------------------------------- x --------------------------------

# Operators

x <- c(TRUE, TRUE)
y <- c(TRUE, FALSE)

print(x & y)  # element-wise AND operation

print(x && y) # Logical AND

# TRUE
# Warning messages:
# 1: In x && y : 'length(x) = 2 > 1' in coercion to 'logical(1)'
# 2: In x && y : 'length(x) = 2 > 1' in coercion to 'logical(1)'

# Output is TRUE, but we need to apply logical into two object with length
