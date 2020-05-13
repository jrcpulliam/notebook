right <- matrix(0, nrow=nrow(responses), ncol=nrow(responses))
wrong <- matrix(0, nrow=nrow(responses), ncol=nrow(responses))
ilist <- matrix(0, nrow=nrow(responses), ncol=nrow(responses))
jlist <- matrix(0, nrow=nrow(responses), ncol=nrow(responses))

for (i in 2:nrow(responses)){
	for(j in 1:(i-1)){
		match <- which(responses[i,]==responses[j,])
		right[i,j] <- sum(responses[i,match]==answers[match])
		wrong[i,j] <- sum(responses[i,match]!=answers[match])
		ilist[i,j] <- i
		jlist[i,j] <- j
	}
}

mf <- data.frame(right=as.vector(right)
	, wrong=as.vector(wrong)
	, i=as.vector(ilist)
	, j=as.vector(jlist)
)

mf <- subset(mf, i>0)

mf <- within(mf, {
	score <- 10*wrong + 7*right
})

# rdsave(mf, ids)
