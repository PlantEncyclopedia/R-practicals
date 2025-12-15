
# loading required packages
install.packages("dplyr")

# Load library
library(dplyr)

# 1. Load the dataset

heart_df <- read.csv("Heart_Disease_Prediction.csv")

# View structure of dataset
str(heart_df)

# 2. Frequency Table using table() [Base R]

# Frequency of Gender
table(heart_df$Sex)

# Frequency of Chest Pain Type
table(heart_df$Chest.pain.type)

# Frequency of FBS.over.120
table(heart_df$FBS.over.120)

# Frequency of Heart Disease (Target Variable)
table(heart_df$Heart.Disease)

# 3. Frequency Table using count() [dplyr]

# Frequency of Gender
heart_df %>% count(Sex)

# Frequency of Chest Pain Type
heart_df %>% count(Chest.pain.type)

# Frequency of FBS.over.120
heart_df %>% count(FBS.over.120)

# Frequency of Heart Disease
heart_df %>% count(Heart.Disease)

# 4. Frequency Table with Sorting

heart_df %>%
  count(Chest.pain.type) %>%
  arrange(desc(n))
