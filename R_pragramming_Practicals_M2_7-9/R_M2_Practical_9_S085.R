# Load dataset
student_data <- read.csv("StudentsPerformance.csv")

# Remove rows with missing values
clean_data <- student_data[
  complete.cases(
    student_data$gender,
    student_data$lunch,
    student_data$test.preparation.course,
    student_data$parental.level.of.education
  ),
]

# Chi-square Test 1: Gender vs Lunch
gender_lunch_table <- table(clean_data$gender, clean_data$lunch)
chisq.test(gender_lunch_table)

# Chi-square Test 2: Gender vs Test Preparation Course
gender_testprep_table <- table(
  clean_data$gender,
  clean_data$test.preparation.course
)
chisq.test(gender_testprep_table)

# Chi-square Test 3: Parental Education vs Lunch
parentedu_lunch_table <- table(
  clean_data$parental.level.of.education,
  clean_data$lunch
)
chisq.test(parentedu_lunch_table)
