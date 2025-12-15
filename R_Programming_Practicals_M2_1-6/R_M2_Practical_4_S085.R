library(dplyr)

data <- read.csv("StudentsPerformance.csv", stringsAsFactors = TRUE)

head(data)

t.test(data$math.score, mu = 55)

female_math <- data %>%
  filter(gender == "female") %>%
  pull(math.score)

t.test(female_math, mu = 55)

male_math <- data %>%
  filter(gender == "male") %>%
  pull(math.score)

t.test(male_math, mu = 55)

t.test(data$reading.score, mu = 55)

t.test(data$writing.score, mu = 55)
