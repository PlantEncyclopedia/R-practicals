library(dplyr)

#datset 1

jan <- data.frame(
  ID = c(1, 2, 3),
  Name = c("Shubham", "krishna", "Sumeet"),
  Jan_Sales = c(400, 150, 200)
)

#dataset 2

feb <- data.frame(
  ID = c(1, 2, 3),
  Name = c("Shubham", "krishna", "Sumeet"),
  Feb_Sales = c(320, 160, 210)
)

#dataset 3

data_new_hires <- data.frame(
  ID = c(4, 5),
  Name = c("Eren", "mikasa"),
  Jan_Sales = c(50, 70)
)

#printing january data
print("printing jan sales")
print(jan)

#printing february data
print("printing feb sales")
print(feb)

print("printing new hires sales")
print(data_new_hires)
#merging tables(Dataset)

merged_data <- merge(jan,feb,by = c("ID","Name"))

#printing merged data

print("Printing merged data")
print(merged_data)

#Append (Stacking rows)

final_list <- bind_rows(jan, data_new_hires)

print("--- Appended Data (Rows Added) ---")
print(final_list)























