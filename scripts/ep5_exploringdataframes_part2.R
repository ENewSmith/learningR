#Exploring data frames
#Author:  Sharon Solis
#Date:  April 12, 2019
#UC Santa Barbara Library

# READ in gapminder.csv
gapminder <- read.csv("data/gapminder_data.csv")

View(gapminder)

str(gapminder)

#summary gives summary with descriptive statistics
summary(gapminder)

#object type
#what is the object type in the year column:

typeof(gapminder$year)

#object type in country column
typeof(gapminder$country)

#LENGTH --number of columns
length(gapminder)

typeof(gapminder)
#number of rows
nrow(gapminder)
ncol(gapminder)
dim(gapminder)

#column names or titles
colnames(gapminder)

#preview our dataset
#HEAD
head(gapminder)
head(gapminder, 15)

#preview last few lines
tail(gapminder)
tail(gapminder, 12)

#preview lines in middle
gapminder[850:870, ]


