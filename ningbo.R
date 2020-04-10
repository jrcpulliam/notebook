library(tibble)
library(dplyr)

trans <- tribble(
	~type, ~primary, ~contacts, ~secSymp, ~secAsymp,
	"Symptomatic", 161, 2001, 107, 19,
	"Asymptomatic", 30, 146, 3, 3
) 

trans <- trans %>% mutate(sec=secSymp+secAsymp)

summary(
	glm(sec~type+offset(I(log(primary)))
		, family=poisson, data=trans
	)
)

summary(
	glm(contacts~type+offset(I(log(primary)))
		, family=poisson, data=trans
	)
)
