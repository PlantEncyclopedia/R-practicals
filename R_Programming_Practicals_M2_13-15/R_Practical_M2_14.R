data <- read.csv("student_placement.csv")

data$Placed <- factor(data$Placed, levels = c(0, 1))

model <- glm(
  Placed ~ CGPA,
  data = data,
  family = binomial
)

summary(model)

cgpa_seq <- seq(min(data$CGPA), max(data$CGPA), length.out = 200)

predicted_prob <- predict(
  model,
  newdata = data.frame(CGPA = cgpa_seq),
  type = "response"
)

plot(
  data$CGPA,
  as.numeric(as.character(data$Placed)),
  xlab = "CGPA",
  ylab = "Placement Probability",
  pch = 16
)

lines(
  cgpa_seq,
  predicted_prob,
  lwd = 3
)
