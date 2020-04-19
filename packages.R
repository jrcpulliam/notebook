i1 <- as.data.frame(installed.packages())
i2 <- rownames(subset(i1, is.na(Priority)))  ## ignore base/recommended

## a1 <- rownames(available.packages("https://probability.ca/cran"))
a1 <- rownames(available.packages())

setdiff(i2,a1)  ## packages not on CRAN

my_pkgs <- sort(intersect(i2,a1))
length(my_pkgs)
writeLines(my_pkgs, con="pkgs.txt")
system("wc -l pkgs.txt")
