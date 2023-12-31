library(ggplot2)
theme_set(theme_light())

dados <- read.csv("C:/Users/joaos/Downloads/TIME_USE_24092022.csv")

dados_new <- dados[dados$País != "África do Sul",]

dados_mulheres <- dados_new[dados_new$Sexo == "Mulheres",]

outros <- dados_mulheres$Tempo[dados_mulheres$Ocupação == "Outros"]
trab_ou_est <- dados_mulheres$Tempo[dados_mulheres$Ocupação == "Trabalho remunerado ou estudo"]

info <- data.frame(grupo = c(rep("Outros", length(outros)), rep("Trab. rem. ou estudo", length(trab_ou_est))), valor = c(outros, trab_ou_est))

ggplot(info, aes(x = grupo, y = valor, fill = grupo)) +
geom_boxplot() +
labs(title = "", x = "Ocupação", y = "Valor", fill = "Grupo")