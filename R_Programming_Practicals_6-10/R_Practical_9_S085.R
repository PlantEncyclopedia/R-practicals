install.packages("stringr")
# Load libraries

library(stringr)
library(tidyr)
library(dplyr)

# Import dataset
df <- read.csv("StudentsPerformance.csv", na.strings = c("", "NA"))

print(" Original Data (First Rows)")
print(head(df))

# 1. Using str_sub(): extract substrings

# Extract first 3 letters of gender
df$gender_code <- str_sub(df$gender, 1, 3)

# Extract last 2 characters of lunch type
df$lunch_end <- str_sub(df$lunch, -2, -1)

print("Data After str_sub()")
print(df %>% select(gender, gender_code, lunch, lunch_end) %>% head())

# 2. Using str_split(): split text into parts

# Split 'race/ethnicity' column (e.g., "group A" → "group", "A")
split_matrix <- str_split(df$race.ethnicity, " ", simplify = TRUE)

df$race_main <- split_matrix[, 1]
df$race_group <- split_matrix[, 2]

print("--- Data After str_split() ---")
print(df %>% select(race.ethnicity, race_main, race_group) %>% head())

# 3. Tidy method: separate()

tidy_df <- df %>% 
  separate(race.ethnicity, into = c("race_word", "race_letter"), sep = " ")

print(" Data After separate()")
print(tidy_df %>% select(race_word, race_letter) %>% head())
