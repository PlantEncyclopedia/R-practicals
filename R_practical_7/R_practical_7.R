library(dplyr)

# Import dataset
marks <- read.csv("data_science_student_marks.csv")

print(" Original Dataset (First 3 rows) ")
print(head(marks, 3))

# SELECTING VARIABLES

# Select specific columns
selected_cols <- marks %>%
  select(student_id, age, python_marks)

print("--- Selected Specific Columns ---")
print(head(selected_cols, 3))

# Select a range of adjacent columns
range_cols <- marks %>%
  select(student_id:python_marks)

print(" Selected Range of Columns ")
print(head(range_cols, 3))

# Select columns starting with 'p'
starts_with_p <- marks %>%
  select(starts_with("p"))

print("--- Columns starting with 'p' ---")
print(head(starts_with_p, 3))

# DROPPING VARIABLES

# Drop single column
drop_one <- marks %>%
  select(-location)

print(" After Dropping 'location'")
print(names(drop_one))

# Drop multiple columns
drop_multiple <- marks %>%
  select(-c(location, english_marks))

print(" After Dropping Multiple Columns ")
print(names(drop_multiple))
