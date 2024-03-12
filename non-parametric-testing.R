# Author: Matthew Vallance
# Date: 12/03/24
# Description: Performing a non-parametric test on the rats data (Task: 3b)

# Import data from CSV
mice_rats_data <- read.csv("datasets/data.csv", header=TRUE)

# Remove columns we don't need
mice_rats_data[1] <- NULL

# Perform a Wilcoxon Rank Sum test
parametric_test <- wilcox.test(mice_rats_data$rats_before, mice_rats_data$rats_after)

# Print the results
print(parametric_test)