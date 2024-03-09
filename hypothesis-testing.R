# Author: Matthew Vallance
# Date: 20/02/24
# Description: Appropriateness for Hypothesis t-testing (Task: 2a, 2b)
library(ggplot2)

# Import data from CSV
mice_rats_data <- read.csv("datasets/data.csv", header=TRUE)

# Remove columns we don't need
mice_rats_data[1] <- NULL

# Create new dataframes with the data we need to create charts
mice <- data.frame(
  Category = c(rep("Mice before", length(mice_rats_data$mice_before)),
               rep("Mice after", length(mice_rats_data$mice_after))),
  values = c(mice_rats_data$mice_before, mice_rats_data$mice_after)
)

rats <- data.frame(
  Category = c(rep("Mice before", length(mice_rats_data$rats_before)),
               rep("Mice after", length(mice_rats_data$rats_after))),
  values = c(mice_rats_data$rats_before, mice_rats_data$rats_after)
)

# Generate QQ plot for mice
ggplot(mice, aes(sample = values)) +
  geom_qq() +
  geom_qq_line() +
  ggtitle("QQ Plot - Mice") +
  xlab("Theoretical Quantiles") +
  ylab("Sample Quantiles")

# Generate QQ plot for rats
ggplot(rats, aes(sample = values)) +
  geom_qq() +
  geom_qq_line() +
  ggtitle("QQ Plot - Rats") +
  xlab("Theoretical Quantiles") +
  ylab("Sample Quantiles")

# Shapiro-Wilk tests:
shapiro_mice <- shapiro.test(mice$values)
shapiro_rats <- shapiro.test(rats$values)

# Print results
print(shapiro_mice)
print(shapiro_rats)
