rss <- read.csv(input_files[1], header=FALSE)

answers <- as.vector(unlist(rss[1, 2:ncol(rss)]))

responses <- as.matrix(rss[2:nrow(rss), 2:ncol(rss)])
ids <- rss[[1]][-1]

# rdsave(answers, responses, ids)
