#Combining datasets vertically (concatenation) using rbind() (R).

#Load the datasets
#iris <- read.csv("iris.csv")
data(iris)
flower_data <- read.csv("flower_dataset.csv")
print("--- Data Structure Before Transformation ---")
print(names(iris))
print(names(flower_data))

#2. DATA PREPARATION Aligning Columns

iris_clean <- iris[, c("Species", "Sepal.Length")]
names(iris_clean) <- c("Species", "Height")

#Prepare Flower Data

flower_clean <- flower_data[, c("species", "height_cm")]
names(flower_clean) <- c("Species", "Height")

# Ensure both are numeric

iris_clean$Height <- as.numeric(iris_clean$Height)
flower_clean$Height <- as.numeric(flower_clean$Height)

# 3. VERTICAL COMBINATION using rbind

combined_data <- rbind(iris_clean, flower_clean)
print("--- Combined Data Summary ---")
print(paste("Iris rows:", nrow(iris_clean)))
print(paste("Flower rows:", nrow(flower_clean)))
print(paste("Total rows (Expected):", nrow(iris_clean) + nrow(flower_clean)))
print(paste("Total rows (Actual):", nrow(combined_data)))
print("Preview of Combined Data (Top and Bottom)")
print(head(combined_data))
print(tail(combined_data))