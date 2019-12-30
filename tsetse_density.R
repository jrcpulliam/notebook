library(readr)
library(dplyr)

(read_csv(input_files[[1]])
	%>% transmute(D_e = Ne/S_S, D_c=Nc/S_S)
	## %>% summarize(diff = exp(sqrt(mean(log(D_e/D_c), na.rm=TRUE))))
) %>% print()
