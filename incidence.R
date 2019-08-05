library(readxl)
library(dplyr)
library(ggplot2)
theme_set(theme_bw())

inc <- (read_excel(input_files[[1]])
	%>% transmute(ID=ID, onset=.[[2]])
) 

ts <- (inc
	%>% count(onset)
)

print(ggplot(ts, aes(x=onset, y=n))
	+ geom_point()
	+ scale_y_log10()
)
