# Author: Matthew Vallance
# Date: 10/03/24
# Description: Performing a paired t-test on mice data (Task: 3a)

# Import data from CSV
mice_rats_data <- read.csv("datasets/data.csv", header=TRUE)

# Remove columns we don't need
mice_rats_data[1] <- NULL

# Perform paired t-test
results <- t.test(mice_rats_data$mice_before, mice_rats_data$mice_after, paired = TRUE)

# T-test statistics
t_test_statistics <- results$statistic
cat("T-test statistics: ", t_test_statistics, "\n")

# Degrees of freedom
deg_of_fdom <- results$parameter
cat("Degrees of freedom: ", deg_of_fdom, "\n")

# P-value
p_value <- results$p.value
cat("P-value: ",p_value, "\n")

# Confidence interval
confidence_interval <- results$conf.int
cat("Confidence interval: ", confidence_interval, "\n")

# Sample estimates (mean of the differences)
mean_of_diff <- results$estimate
cat("Sample estimates: ", mean_of_diff, "\n")
