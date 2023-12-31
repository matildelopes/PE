library(ggplot2)
theme_set(theme_light())

dados <- read.delim("C:/Users/joaos/Downloads/GENDER_EMP_19032023152556091.txt")

dados_USA <- dados[dados$Country == "United States",]

dados_USA_2019 <- dados_USA[dados_USA$Time == 2019,]

dados_USA_2019_EMP2 <- dados_USA_2019[dados_USA_2019$IND == "EMP2",]

dados_USA_2019_EMP2 <- dados_USA_2019_EMP2[dados_USA_2019_EMP2$Age.Group == "15-24" | dados_USA_2019_EMP2$Age.Group == "25-54"| dados_USA_2019_EMP2$Age.Group == "55-64", ]

dados_USA_2019_EMP2 <- dados_USA_2019_EMP2[dados_USA_2019_EMP2$Sex == "Men" | dados_USA_2019_EMP2$Sex == "Women",]

info <- data.frame("Age_Group" = dados_USA_2019_EMP2$Age.Group, "Sex" = dados_USA_2019_EMP2$Sex, "Value" = dados_USA_2019_EMP2$Value)

ggplot(info, aes(x = Age_Group, y = Value, fill = Sex, group = Sex)) +
  geom_bar(stat = "identity", position = "dodge") + 
  labs(title = "")
  
