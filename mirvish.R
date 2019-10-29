startTime <- -120
startVal <- 20272

finish <- function(currTime, currVal){
	rate <- (startVal-currVal)/(currTime-startTime)
	return(startTime+startVal/rate)
}

print(finish(currTime=-60, currVal=18723))
print(finish(currTime=-23, currVal=13043))
print(finish(currTime=-15, currVal=11809))

