library(tidyverse)
library(furrr)

#set number of cores to use for parallel (all of this is fast so 1 is fine)
nc<-1

plan(strategy=multiprocess, workers=nc) #this is telling the computer to get ready for the future_ commands

# Normal, 1-sample t-test, single sample size

true_mu<-11
reps<-5000
ss<-100

sampledat<-map_dfr(1:reps, function(x){
   data.frame(myrep=x, sample_vals=rnorm(100, mean=true_mu, sd=4))
})

ttest_ps<-future_map_dfr(1:reps, function(x){
   data.frame(rep=x, 
		p=t.test(sampledat[sampledat$myrep==x, "sample_vals"]
			, mu=true_mu, alternative="greater"
		)$p.value)
})

print(ttest_ps %>% ggplot(aes(p))
	+geom_histogram(breaks=seq(0, 1, by=0.04))
	+theme_classic()
)
