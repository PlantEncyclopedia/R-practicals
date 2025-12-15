library(dplyr)

# Load the student performance dataset
data <- read.csv("StudentsPerformance.csv", stringsAsFactors = TRUE)

# Preview data
head(data)

# Independent two-sample t-test: Math scores by gender
t.test(math.score ~ gender, data = data)

# Independent two-sample t-test: Reading scores by gender
t.test(reading.score ~ gender, data = data)

# Independent two-sample t-test: Writing scores by gender
t.test(writing.score ~ gender, data = data)

# Independent two-sample t-test: Math scores by lunch type
t.test(math.score ~ lunch, data = data)

# Independent two-sample t-test: Reading scores by test preparation course
t.test(reading.score ~ test.preparation.course, data = data)

# Independent two-sample t-test: Writing scores by test preparation course
t.test(writing.score ~ test.preparation.course, data = data)
