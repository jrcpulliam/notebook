library(dplyr)

(3
	%>% cos()
	%T>% (. %>% sqrt() %>% print())
	%>% sin()
) %>% print()
