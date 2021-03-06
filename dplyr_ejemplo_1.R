library(dplyr)

mtcars_tbl <- as_data_frame(tibble::rownames_to_column(mtcars, "cars"))

head(mtcars_tbl)

## USO DE FILTER para filas

## filtrando por filas que tienen ciertos criterios
mtcars_tbl%>%
        filter(cyl==4)

## filtrando la misma columna con dos criterios, el simbolo | significa o
mtcars_tbl%>%
        filter(cyl==4 | cyl==6,gear==5)

## USO DE SLICE
## seleccionando un conjunto de filas con slice
mtcars_tbl%>%
        slice(6:9)

## USO DE ARRANGE

## ordena los datos segun la columna que se le diga
## por inercia lo hace ascendente
mtcars_tbl%>%
        arrange(hp)

## agregando mas parametros para ordenar, desc ordena de forma descedente
mtcars_tbl%>%
        arrange(desc(mpg),cyl)

## USO DE SELECT para columnas

## seleccionando varias columnas
mtcars_tbl%>%
        select(mpg,disp,wt,qsec,vs)

## seleccionado columnas consecutivas de forma abreviada para ello usar dos puntos
mtcars_tbl%>%
        select(cars:disp,vs:carb)

## haciendo lo mismo de arriba solo que de otra forma
## usar el signo menos lo que hace es que no toma en cuentas esas columnas
mtcars_tbl%>%
        select(-(hp:qsec))

## seleccionando columnas y cambiandoles de nombre
mtcars_tbl%>%
        select(cylinders = cyl,displacement=disp)

## USO DE RENAME

## cambiando de nombre a las columnas pero en el data frame
mtcars_tbl%>%
        rename(cylinders = cyl,displacement=disp)

## USO DE MUTATE

## permite agregar mas columnas como campos calculados a partir de las existentes
mtcars_tbl%>%
        mutate(weight_ton = wt/2, weight_pounds = weight_ton*200)

## USO DE TRANSMUTE

## creando columnas sin agregarlas al dataframe orginal
mtcars_tbl%>%
        transmute(weight_ton = wt/2, weight_pounds = weight_ton*200)


## USO DE SUMMARISE

## permite calcular estadisticas resumidas por columna 

mtcars_tbl%>%
        summarise(mean_mpg = mean(mpg), sd_mpg = sd(mpg),
          mean_disp = mean(disp), sd_disp = sd(disp))

## USO DE GROUPBY

##permite agrupar datos y realizar operaciones 
## creamos grupos por cilindraje y luego calculamos estadisticos para millas por galon
## media y desviacion estandar

mtcars_tbl%>%
        group_by(cyl)%>%
        summarise(mean_mpg = mean(mpg), sd_mpg = sd(mpg))

## APLICANDO TODO
## siempre que se agrupa algo se debe hacer un calculo para que se vea el efecto de la agrupacion
mtcars_tbl%>%
        select(cars:hp, gear)%>%
        arrange(cyl,desc(mpg))%>%
        group_by(gear)%>%
        filter(mpg > 20, hp > 75)

## USO DE SUMMARISE_ALL()

## aca se podran funciones a todas las columnas y no es necesario agrupar
## n_distinct() cuenta el n�mero de distintos elementos de una variable.
mtcars_tbl%>%
        summarise_all(n_distinct)

mtcars_tbl %>%
        group_by(cyl) %>%
        summarise_all(n_distinct)

## USO DE SUMMARISE_AT()

## agrupando por cilindros y sumarizando columnas especificas
        
mtcars_tbl %>%
        group_by(cyl) %>%
        summarise_at(c("mpg", "disp", "hp"), mean)

## agrupasmos por cilindros
## sumarisamos varias columnas
## y calculamos 2 medidas estadisticas media y desviacion 

mtcars_tbl %>%
        group_by(cyl) %>%
        summarise_at(c("mpg", "disp", "hp"),
                     c("mean", "sd"))

## lo mismo solo que de otra forma
## indicando las fuciones sin comillas
mtcars_tbl %>%
        group_by(cyl) %>%
        summarise_at(c("mpg", "disp", "hp"),
                     funs(mean, sd))

## lo mismo solo que poniendo nombres a los calculos con la inicial mayuscula
## para los estadisticos 
mtcars_tbl %>%
        group_by(cyl) %>%
        summarise_at(c("mpg", "disp", "hp"),
                     c(Mean = "mean", SD = "sd"))

mtcars_tbl %>%
        group_by(cyl) %>%
        summarise_at(c("mpg", "disp", "hp"),
                     funs(Mean = mean, SD = sd))

## USO DE SUMMARISE_IF()

## agrupa por cilindros
## sumariza sacando la media si son de tipo numerico
## si no no calcula y no presenta la colmuna 
mtcars_tbl %>%
        group_by(cyl) %>%
        summarise_if(is.numeric, mean)

## no entiendo que hace aca
mtcars_tbl %>%
        group_by(cyl) %>%
        summarise_if(function(x) is.numeric(x) & n_distinct(x) > 6, mean)

## lo que restas de la pagina 161 ya no se practico
