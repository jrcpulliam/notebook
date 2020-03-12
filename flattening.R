library(emdbook)

R <- seq(1, 3, length.out=11)

peak <- (R-1-log(R))/R
size <- 1 + lambertW(-R*exp(-R))/R

plot(R, peak, type="b")
plot(R, size, type="b")
