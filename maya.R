library(googlesheets)
library(dplyr)

url <-  "https://docs.google.com/spreadsheets/d/1qTYPV7PXb_5EVyG2SoxuAdlzXRfvJxgRUOwAgbYwS7s/edit?usp=sharing"
key <- extract_key_from_url(url)
sheet <- gs_key(key)
