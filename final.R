setwd('/Users/zhangjiahao/Desktop/pycharm/data/')

library(readxl)#read excel
library(data.table) #data.frame
library(dplyr)
library(strucchange)# Chow test
library(lmtest)# test

df = read_xlsx("data/output1.xlsx", sheet = "output1")
str(df)
head(df) ; tail(df)

Regression=lm(score ~ ratings + position + include_food,data = df)
summary(Regression)

#Whites tests
bptest(score ~ ratings + position + include_food,data = df)

#Chow test
sctest(score ~ ratings + position + include_food,data = df, type = "Chow", point = 700)

#ramsey's RESRT test
resettest(score ~ ratings + position + include_food,data = df, power=2, type="regressor")
