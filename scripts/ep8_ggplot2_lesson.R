#practice for lesson episode *

#open library ggplot2
library(ggplot2)

# read in gapminder data
gapminder <- read.csv("data/gapminder_data_csv")
#looking at row 1, column 1
gapminder[1,1]

#make ggplot scatterplot
ggplot(data = gapminder, aes(x = gdpPercap, y = lifeExp)) +
  geom_point()

ggplot(data = gapminder, aes(x= year, y = lifeExp, color = continent)) +
  geom_point()

## layers
#lineplots  use geom_line

ggplot(data = gapminder, aes(x= year, y = lifeExp, by = country, color = continent)) +
  geom_line()

ggplot(data = gapminder, aes(x= year, y = lifeExp, by = continent, color = continent)) +
  geom_line() + #line plot layer
  geom_point() #scatter plot layer

# theme_bw changes the background to white 
ggplot(data = gapminder, aes(x= year, y = lifeExp, color = continent)) +
  geom_line() + #line layer
  geom_point() +#scatterlayer
  theme_bw()

#drop points on top of lines, black color for points
ggplot(data = gapminder, aes(x= year, y = lifeExp, by = country)) +
  geom_line(aes(col = continent)) + #line layer
  geom_point() #scatterlayer

# change colors to all lines purple
ggplot(data = gapminder, aes(x= year, y = lifeExp, by = country)) +
  geom_line (col = 'purple') + #line layer
  geom_point() #scatterlayer

# change colors to blue
ggplot(data = gapminder, aes(x= year, y = lifeExp, by = country)) +
  geom_line (col = 'blue') + #line layer
  geom_point() #scatterlayer

#challenge
ggplot(data = gapminder, aes(x= year, y = lifeExp, by = country)) +
  geom_point() + #scatterlayer
  geom_line (col = 'blue')

# using statistics on plot
ggplot(data = gapminder, aes(x = gdpPercap, y = lifeExp, color = continent)) +
  geom_point()
#add in layers, log scale
ggplot(data = gapminder, aes(x = gdpPercap, y = lifeExp, color = continent)) + #base layer
  geom_point(alpha = 0.5) +  #change transparancy of points
  scale_x_log10()

ggplot(data = gapminder, aes(x = gdpPercap, y = lifeExp, color = continent)) + #base layer
  geom_point(aes(alpha = continent)) +  #change transparancy of points
  scale_x_log10()

#data trends
ggplot(data = gapminder, aes(x = gdpPercap, y = lifeExp, color = continent)) + #base layer
  geom_point() +  #change transparancy of points
  scale_x_log10() + 
  geom_smooth(method = "lm") #geom smooth layer - linear model

ggplot(data = gapminder, aes(x = gdpPercap, y = lifeExp)) + #base layer
  geom_point() +  #change transparancy of points
  scale_x_log10() + 
  geom_smooth(method = "lm") #geom smooth layer - linear model

# make geom smooth line thicker
ggplot(data = gapminder, aes(x = gdpPercap, y = lifeExp)) + #base layer
  geom_point() +  #change transparancy of points
  scale_x_log10() + 
  geom_smooth(method = "lm", col = "red", sie = 1.5) #geom smooth layer - linear model

# challenge
ggplot(data = gapminder, aes(x = gdpPercap, y = lifeExp)) + #base layer
  geom_point(aes(shape = continent), col = "red", size = -3) +  #change transparancy of points
  scale_x_log10() + 
  geom_smooth(method = "lm", col = "purple", size = 5.0) #geom smooth layer - linear model

# multi-panel figures
# first sub set data
# %in% allows us to make multiple comparisons 
starts.with <- substr(gapminder$country, start = 1, stop = 1)
az.countries <- gapminder[starts.with %in% c("A", "Z"),]

ggplot(data = az.countries, aes(x = year, y = lifeExp, color = continent)) +
  geom_line() + 
  facet_wrap( ~ country)  #new layer--facet wrap layer. facet wrap took the above
#formula as its agrgument, denoted by ~This tells R to draw panel for each unique value
