set.seed(570)

# Parâmetros
mu <- 34.1
sigma <- sqrt(4)
m <- 150
n <- 31
mu0 <- 32.7
alpha <- 0.07

# Gerando m amostras de dimensão n da população Normal
samples <- replicate(m, rnorm(n, mu, sigma))

# Teste de hipóteses para cada amostra
test_results <- apply(samples, 2, function(sample) {
  t_value <- (mean(sample) - mu0) / (sigma / sqrt(n))
  p_value <- 2 * (1 - pnorm(abs(t_value)))
  return(p_value > alpha)
})

# Estimativa da probabilidade do teste conduzir à não rejeição de H0
prob <- mean(test_results)

# Arredondar para 3 casas decimais
prob <- round(prob, 3)
prob

