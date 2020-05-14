library(readr)

mix <- as.matrix(read.table(input_files[[1]]))

rho <- symMat(mix)
print(rho)

T <- rowSums(rho)
Tnew <- 1 + T

print(mixAdj(rho, Tnew=Tnew))
