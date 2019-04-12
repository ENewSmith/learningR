## Learning dplyr

rm(list = ls())

#Restart R session
install.packages("tidyverse")
library(dplyr)
library(ggplot2)

gapminder <- read.csv("data/gapminder_data.csv")

#using select function to pick certain columns
year_country_gdp <- gapminder %>% select(year, country, gdpPercap)
str(year_country_gdp)

#using filter function to pick certain rows
year_country_gdp_euro <- gapminder %>%
  filter(continent == "Europe") %>%
  select(year, country, gdpPercap)
str(year_country_gdp_euro)

# if put select first, won't work because no continent

#using dplyr for grouping variables

gdp_by_continent <- gapminder %>%
  group_by(continent) %>%
  summarize(mean_gdp = mean(gdpPercap))
  
gdp_by_continent

# challenge number 2 Find average life expectency by country
life_exp_by_country <-gapminder %>%
  select(lifeExp, country) %>%
  group_by(country) %>%
  summarize(mean_life = mean(lifeExp))

life_exp_by_country

#which has longest  lifexpectency?

max(life_exp_by_country$mean_life)# still don't know which country

life_exp_by_country %>% filter(mean_life == max(mean_life)) #== means exactly
 # equal to

##which has shortest lifexpectency?

life_exp_by_country %>% filter(mean_life == max(mean_life) |
                                 mean_life == min(mean_life))

#integrating ggplot and dplyr

#plot 
gapminder %>%
  group_by(country) %>%
  summarize(mean_life = mean(lifeExp)) %>%
  ggplot(aes(x=country, y=mean_life)) + geom_boxplot()

gapminder %>%
  group_by(country, year) %>%
  summarize(mean_lif = mean(lifeExp))

