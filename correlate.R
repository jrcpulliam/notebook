library(MASS)

m <- matrix(
	c(
	  1.00, 0.60, 0.40
	, 0.60, 1.00, 0.97
	, 0.40, 0.97, 1.00
	), nrow=3
)


eigen(m)
