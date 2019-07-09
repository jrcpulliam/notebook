library(readxl)
library(dplyr)
library(tidyr)

convert <- 14.5
accounts <- read_excel(input_files[[1]])

print(accounts)

paid <- (accounts
	%>% rename(who=Paid)
	%>% group_by(who)
	%>% summarize(Paid=sum(Amount)/convert)
)

print(paid)

used <- (accounts
	%>% gather(who, share, JP:BR)
	%>% mutate(
		share=ifelse(is.na(share), 0, share)
		, Used = share*Amount/(convert*Denominator)
	)
	%>% group_by(who)
	%>% summarize(Used=sum(Used))
)

print(used)

final <- (full_join(paid, used)
	%>% mutate(
		Paid = ifelse(is.na(Paid), 0, Paid)
		, net=Paid-Used
	)
)

print(final)

print(final %>% summarize(zero = sum(net)))
