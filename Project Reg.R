library(readxl)
Tax_Burden_clean
library(pastecs)
reg1 <-lm(LocationDesc ~ Year + GeoLocation + Edu, data = Tax_Burden_clean)
summary(reg1)