# Ejercicio 1 Manejo de Vectores

linkedin<-list(16,9,13,5,2,17,14)

facebook<-list(17,7,5,16,8,13,14)

li_vec<-as.vector(unlist(linkedin))

fb_vec<-as.vector(unlist(facebook))

social_vec<-c(li_vec,fb_vec)

social_vec<-sort(social_vec,decreasing = T)
print(social_vec)

# Ejercicio 2 Ciclos

velocidad<-64

while (velocidad > 30) {
        print("Tu velocidad es")
        print(velocidad)
        print("Baja la velocidad")
        while (velocidad > 48) {
                print("Baja más la velociad")
                velocidad = velocidad - 11       
        }
        velocidad = velocidad - 6
}

velocidad

# Ejercicio 3 Uso de Funciones Base 

vec1<-c(1.5,2.5,8.4,3.7,6.3)

vec2<-rev(vec1)

mean(abs(c(vec1,vec2)))

# Ejercicio 4 Matrices y ciclo for:

totito<-matrix(c("O", "NA", "X", "NA", "O", "NA", "X", "O", "X"), nrow=3, ncol=3) 
print(totito)

totito[1,1]
nrow(totito)
ncol(totito)

for(fila in 1:nrow(totito)) {
        for(columna in 1:ncol(totito)){
                print(totito[fila,columna])
        }
        
} 
