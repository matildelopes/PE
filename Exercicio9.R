library(ggplot2)
theme_set(theme_light())

set.seed(1584)

k <- 2500

p <- 0.6

gama <- 0.9

sample_sizes <- c(30, 50, 100, 200, 300, 500, 1000)

#Criacão de um vetor que armazena as médias das diferêncas entre os comprimentos dos intervalos 
diff_mean <- numeric(length(sample_sizes))

for (i in 1:7) {
  n <- sample_sizes[i]
  
  #Criação de um vetor que armazena as diferenças entre os intervalos de comprimento
  diff <- numeric(k)
  
  for (j in 1:k) {
    #Criação de uma amostra de Bernoulli de tamanho n e parametro p
    sample <- rbinom(n, 1, p)
    
    #Cálculo da média amostral
    sample_mean <- mean(sample)
    
    #Obtenção do valor crítico
    z <- qnorm((1 + gama) / 2)
    
    #Método 1
    a <- 1 + (z^2 / n)
    b <- -2 * sample_mean - (z^2 / n)
    c <- sample_mean^2
    lim_inf1 <- (- b - sqrt(b^2 -4 * a * c)) / (2 * a)
    lim_sup1 <- (- b + sqrt(b^2 -4 * a * c)) / (2 * a)
    
    #Método 2
    lim_inf2 <- sample_mean - z * sqrt(sample_mean * (1 - sample_mean) / n)
    lim_sup2 <- sample_mean + z * sqrt(sample_mean * (1 - sample_mean) / n)
    
    #Cálculo da diferença entre os intervalos de confiança construídos pelos dois métodos
    diff[j] <- abs(lim_sup2 - lim_inf2 - (lim_sup1 - lim_inf1))
  }
  
  #Cálculo da média das diferenças calculadas previamente
  diff_mean[i] <- mean(diff)
}

#Criação do DataFrame
data <- data.frame(sample_sizes, diff_mean)

#Criação do Gráfico
ggplot(data, aes(x = sample_sizes, y = diff_mean)) +
    geom_line() +
    geom_point() +
    labs(x = "Tamanho da Amostra", y = "Valores") +
    ggtitle("Diferenças Médias entre os 2 Métodos de Construcão de Intervalos de Confiança") +
    theme_minimal()

