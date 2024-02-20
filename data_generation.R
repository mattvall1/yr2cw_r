# Author: Matthew Vallance
# Date: 13/02/24
# Description: Data generation script

# Weights of 200 mice before: mean = 20, and variance = 2
mice_before <- rnorm(200, 20, sd = sqrt(2))

# Weights of 200 mice after: mean = 21, and variance = 2.5
mice_after <- rnorm(200, 21, sd = sqrt(2.5))

# Weights of 200 rats before: shape = 10, and scale = 20
rats_before <- rweibull(n = 200, 10, 20)

# Weights of 200 rats after: shape = 9 and scale = 21
rats_after <- rweibull(n = 200, 9, 21)

print("Data generated")

# Export all values to CSV, for data consistency in other tasks
df_to_export <- data.frame(
  mice_before = mice_before,
  mice_after = mice_after,
  rats_before = rats_before,
  rats_after = rats_after
)

write.csv(df_to_export, "datasets/data.csv", row.names = TRUE)
print("Data written to CSV")