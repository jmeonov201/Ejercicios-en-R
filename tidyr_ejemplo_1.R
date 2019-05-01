library(tidyr)

## creando data frame

set.seed(123)
df <- data.frame(
        name = rep(c("firstName", "secondName"), each=4),
        numbers = rep(1:4, 2),
        value = rnorm(8)
)

df

## spread ayuda a volver mas ancho un data frame

df %>%
        spread(key = numbers,value = value)

df %>%
        spread(key = name,value = value)


