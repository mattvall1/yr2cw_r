# Author: Matthew Vallance
# Date: 20/02/24
# Description: Plotting with generated data (Task: 1c, 1d)
library(ggplot2)

# Import data from CSV
mice_rats_data <- read.csv("datasets/data.csv", header=TRUE)

# Remove columns we don't need
mice_rats_data[1] <- NULL
# mice_rats_data format: mice_before is 1, mice_after is 2, rats_before is 3, rats_after is 4.
summary(mice_rats_data)


# Create a new dataframe with just the data we need to create the first density chart
mice_before_after <- data.frame(
  Category = c(rep("Mice before", length(mice_rats_data$mice_before)),
               rep("Mice after", length(mice_rats_data$mice_after))),
  values = c(mice_rats_data$mice_before, mice_rats_data$mice_after)
)

# Create the density plot
qplot(values, data=mice_before_after, geom="density", fill=Category, alpha=I(0.5), main="Mice before & after",
      xlab="Weights",
      ylab="Density")

# Create the boxplot
qplot(values, data=mice_before_after, geom="boxplot", fill=Category, alpha=I(0.5), main="Mice before & after",
      xlab="Weights",
      ylab="Density")

# Create a new dataframe with just the data we need to create the second density chart
mice_before_after <- data.frame(
  Category = c(rep("Rats before", length(mice_rats_data$rats_before)),
               rep("Rats after", length(mice_rats_data$rats_after))),
  values = c(mice_rats_data$rats_before, mice_rats_data$rats_after)
)

# Create the density plot
qplot(values, data=mice_before_after, geom="density", fill=Category, alpha=I(0.5), main="Rats before & after",
      xlab="Weights",
      ylab="Density")

# Create the boxplot
qplot(values, data=mice_before_after, geom="boxplot", fill=Category, alpha=I(0.5), main="Rats before & after",
      xlab="Weights",
      ylab="Density")


