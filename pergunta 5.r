set.seed(1658)  # Fixing the seed

n <- 1142  # Sample size
p <- 0.5   # Probability of success

# Function to generate geometric random variables
generate_geometric <- function(p) {
  u <- runif(1)  # Generate a random value from uniform distribution
  
  x <- 0  # Initialize x
  
  while (u > 1-(1-p)^(x+1)) {
    x <- x + 1  # Increment x until u is within the desired range
  }
  
  return(x)
}

# Generate the sample
sample_data <- replicate(n, generate_geometric(p))

# Calculate the sample mean and standard deviation
sample_mean <- mean(sample_data)
sample_sd <- sd(sample_data)

# Count the values greater than sample_mean + sample_sd among those greater than sample_mean
count <- sum(sample_data > (sample_mean + sample_sd))

# Calculate the proportion
proportion <- count / sum(sample_data > sample_mean)

result <- round(proportion, 4)
print(result)
