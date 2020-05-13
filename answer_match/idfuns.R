top <- function(mf, wrongWeight=2, num=6){
	mf <- within(mf, {
		score = wrongWeight*wrong + right
		jname = ids[j]
		iname = ids[i]
	})
	mf <- mf[order(mf$score, decreasing=TRUE), ]
	return(mf[1:num, ])
}
