library(googlesheets)
library(dplyr)

## If you put a key on github, you lose crypto
## If you use these tools at all, do you necessarily lose crypto?

url <-  "https://docs.google.com/spreadsheets/d/KEY/edit?usp=sharing"
key <- extract_key_from_url(url)
sheet <- gs_key(key)
