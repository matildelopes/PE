set.seed(1595)  # Setting the seed

m <- 1987  # Number of samples
n <- 10    # Dimension of each sample

# Simulate m samples from a normal distribution with zero mean and unit variance
samplest <- matrix(rnorm(n * m), nrow = n, ncol = m)
samples<-t(samplest)

# Compute the sum of squares for each sample
sums_of_squares <- rowSums(samples^2)

# Compute the quantile of the sample sums of squares at 0.63
quantile_sample <- quantile(sums_of_squares, probs = 0.63, type = 2)

# Compute the quantile of the theoretical distribution of sum of squares of independent reduced normal variables
quantile_theoretical <- qchisq(0.63, df = n)

# Compute the absolute difference between the two quantiles
difference <- abs(quantile_sample - quantile_theoretical)

# Round the difference to 4 decimal places
difference_rounded <- round(difference, 4)

# Display the result
print(difference_rounded)





ou

generate_value <- function(n) {
  u <- rnorm(n)
  v <- u^2
  soma<-sum(v)
}

sums_of_squares<-replicate(m, generate_value(n)) 

