# Learning R
# Friday, April 12

#initialize a cats data.frame
cats <- data.frame(coat = c("calico", "black", "tabby"), 
                   weight = c(2.1, 5.0, 3.2), 
                   likes_string = c(1, 0, 1))
write.csv(x = cats, file="data/feline.csv")
cats$weight <- cats$weight + 2

# an intentional error
cats$weight + cats$coat

#what tylpe of variable?
typeof(cats$weight)

class(cats)

#let's talk about vectors

my_vector <- vector(length = 3)
my_vector 

#another vector: character

another_vector <- vector(mode="character", length = 3)
another_vector

#another exploratory command
str(another_vector)
str(cats$coat)
str(cats$weight)
str(cats$likes_string)

# make a new vector
combine_vector <- c(2,6,3)
combine_vector

quiz_vector <- c(2,6,"3")
quiz_vector
typeof(quiz_vector)

coercion_vector <- c('a', TRUE)
coercion_vector
typeof(coercion_vector)

another_coercion_vector <- c(0, TRUE)
another_coercion_vector
typeof(another_coercion_vector)

#forcing example
charchter_vector_example <- c('0', '2', '4')
charchter_vector_example
typeof(charchter_vector_example)

character_coerce_to_numeric <- as.numeric(charchter_vector_example)
character_coerce_to_numeric
typeof(character_coerce_to_numeric)

#useful coercion
cats$likes_string
typeof(cats$likes_string)
cats$likes_string <- as.logical(cats$likes_string)
cats$likes_string

#appending data
ab_vector <- c('a', 'b')
combine_example <- c(ab_vector, "SWC")
combine_example
typeof(combine_example)

#populate quickly
mySeries <- 1:10
mySeries

#data frames
str(cats$weight)
str(cats$coat)
coats <- c('tabby', 'tortoiseshell', 'tortoiseshell', "black", 'tabby')
str(coats)
CATegories <- factor(coats)
str(CATegories)

#age of cats
age <- c(2,3,5)
cats
cbind(cats, age)
cats

#rbind adding a row
nrow(cats)
newRow <- list('tortoiseshell', 3.3, TRUE, 9)
newRow
cats <- rbind(cats, newRow)
cats
levels(cats$coat)
levels(cats$coat) <- c(levels(cats$coat), "tortoiseshell")
levels(cats$coat)

cats <- rbind(cats, newRow)
cats

#removing NAs
cats[-4,]
na.omit(cats)
cats <- na.omit(cats)
cats
