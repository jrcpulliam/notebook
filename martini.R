n <- 1e6
p <- 1/2

cloud <- data.frame(
	x = runif(n, min=-1)
	, y = runif(n, min=-1)
	, z = runif(n)
)

cloud$qmax <- with(cloud, 
	(x-z)/(x+z-2)
)

cone <- subset(cloud, (x^2+y^2 < z^2))
cone$qmax <- with(cone, 
	(x-z)/(x+z-2)
)

print(summary(cone))

v <- numeric()
for(p in (1:9)){
	v[[p]] <- mean(cone$qmax<p/10)
}

print(v)
