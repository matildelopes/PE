library(ggplot2)
theme_set(theme_light())

library(readxl)

economicos <- readxl::read_excel("C:/Users/joaos/Downloads/econ.xlsx")

economicos$tempo <- as.Date(economicos$tempo, format = "%d/%m/%Y")

economicos_new <- economicos[economicos$tempo >= as.Date("1981-01-01"),]

ndesemp <- economicos_new$ndesemp
tpp <- economicos_new$tpp

desvio_padrao_ndesemp <- sd(ndesemp)
desvio_padrao_tpp <- sd(tpp)

media_ndesemp <- mean(ndesemp)
media_tpp <- mean(tpp)

ndesemp_new <- (ndesemp - media_ndesemp) / desvio_padrao_ndesemp
tpp_new <- (tpp - media_tpp) / desvio_padrao_tpp

info <- data.frame(ndesemp_new, tpp_new, economicos_new$tempo)

ggplot(info) +
geom_line(aes(y = ndesemp_new, x = economicos_new$tempo),color = "red") +
geom_line(aes(y = tpp_new, x = economicos_new$tempo),color = "blue") +
labs(x = "", y = "",title = "")


             

