library(ggplot2)
theme_set(theme_light())

set.seed(1585)

n <- 113
loc <- 0.8
esc <- 1.8

#1,2
amostra_cauchy <- rcauchy(n, loc, esc)
amostra_cauchy_ord <- sort(amostra_cauchy)
quantis <- (1:n) / (n + 1)

#1
quantis_cauchy <- quantile(amostra_cauchy, quantis)

#2
valor_esperado <- -4
variancia <- sqrt(3.6)

quantis_normal <- qnorm(quantis, valor_esperado, variancia)

df <- data.frame(Valores = amostra_cauchy_ord,
                 Quantis_Cauchy = quantis_cauchy,
                 Quantis_Normal = quantis_normal)

ggplot(df, aes(x = Quantis_Cauchy, y = Valores)) +
  geom_point(aes(color = "Cauchy"), size = 0.8) +
  geom_point(aes(x = Quantis_Normal, y = Valores, color = "Normal"), size = 0.8) +
  geom_abline(intercept = 0, slope = 1, linetype = "dashed", color = "green") +
  labs(x = "", y = "") +
  ggtitle("") +
  theme_minimal() +
  scale_color_manual(values = c("blue", "red"),
                     labels = c("Cauchy", "Normal"),
                     name = "Legenda") +
  theme(legend.position = "right")


