
st <- 1
v <- rbinom(1, 1, 1)
identical(st, v)
identical(as.integer(st), v)

x <- c(2)
w <- x
w <- c(w[-1], as.integer(2))
identical(w, x)
