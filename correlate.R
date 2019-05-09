library(MASS)

## Start with a basis vector
## Add a second vector with 0.96 weight corresponding to the basis vector
## And a third with 0.6 weight corresponding to the basis vector
## These numbers were chosen in honor of Pythagoras ☺

## Doing this with all positive entries gives the maximum correlation
mx <- matrix(
	c(
	  1.00, 0.00, 0.00
	, 0.96, 0.28, 0.00
	, 0.60, 0.80, 0.00
	), nrow=3
)
print(t(mx) %*% mx)

## Reversing one of the signs gives the minimum
mx <- matrix(
	c(
	  1.00, 0.00, 0.00
	, 0.96, 0.28, 0.00
	, 0.60, -.80, 1.00
	), nrow=3
)
print(t(mx) %*% mx)

## The answers are the values next to the lower corner (0.8 and 0.352)
## How did you do?
