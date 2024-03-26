# Author: Matthew Vallance
# Date: 12/03/24
# Description: Examining best-fit distribution (Task: 4)
library(fitdistrplus)

# Import data from CSV
mice_rats_data <- read.csv("datasets/data.csv", header=TRUE)

# Remove columns we don't need
mice_rats_data[1] <- NULL

# Create new dataframe with the data we need to examine
rats <- data.frame(
  Category = rep("Rats before", length(mice_rats_data$rats_before)),
  values = mice_rats_data$rats_before
)

# Assuming 'rats' is your data
# Fit Weibull, Lognormal, and Gamma distributions
fit_weibull <- fitdist(rats$values, "weibull")
fit_lnorm <- fitdist(rats$values, "lnorm")
fit_gamma <- fitdist(rats$values, "gamma")

# Compare fitted distributions
fit_list <- list(weibull = fit_weibull, lnorm = fit_lnorm, gamma = fit_gamma)
descdist(rats$values, discrete = FALSE)
comp_dist <- gofstat(fit_list)

# Goodness-of-fit statistics
print(comp_dist)

# Plot density
plot.legend <- c("Weibull", "Lognormal", "Gamma")
denscomp(fit_list, legendtext = plot.legend)

# Plot cumulative distribution
cdfcomp(fit_list, legendtext = plot.legend)

# Plot QQ
qqcomp(fit_list, legendtext = plot.legend)

# Plot PP
ppcomp(fit_list, legendtext = plot.legend)
