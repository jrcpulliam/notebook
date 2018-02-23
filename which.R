dat <- matrix(
	c(
		1, 2, 4, 7
		, 2, 3, NA, 6
		, 3, 4, 1, 2
	)
	, nrow=3, byrow=TRUE
)

best <- apply(dat, 2, max)
where <- apply(dat, 2, which.max)

print(best)
print(where)
