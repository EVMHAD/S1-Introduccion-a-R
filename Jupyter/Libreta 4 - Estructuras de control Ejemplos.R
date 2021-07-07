# Ejemplos IF / ELSE
if(4>2){
  "Verdadero"
}

if(3>5){
  "Verdadero"
}

if(4>2){
  "Verdadero"
}else{
  "Falso"
}

if(3>5){
  "Verdadero"
}else{
  "Falso"
}

x <- 30
y <- 30

if(x>y){
  "Verdadero"
}else if(x<y){
  "Falso"
}else{
  "Iguales"
}

vec <- 1:10

if(vec < 3){
  "Verdadero"
}else{
  "Falso"
}

vec < 3

ifelse(vec<3,"Verdadero","Falso")
ifelse(vec<3,"Menor que 3",ifelse(vec==3,"Igual a 3","Mayor que 3"))

a <- 1:10
b <- 10:1

a < b

switch(3,"first", "second","third","fourth")

# Ejemplos FOR

dado <- c(1,3,5,7,9)

for(cara in dado){
  cara^2
}

for(cara in dado){
  print(cara^2)
}

cuadrados <- NULL

for(cara in dado){
  cuadrados[cara] <- cara^2
}

cuadrados <- cuadrados[dado]

cuadrados <- NULL

for(cara in 1:length(dado)){
  cuadrados[cara] <- cara^2
}

for(i in 1:20){
  print(i)
}

for(i in 10:5){
  print(i)
}

# Ejemplos WHILE
limite <- 5
valor <- 0

while(valor<limite){
  print("Todavia no llega")
  valor <- valor+1
  if(valor==limite){
    print("Ya llego")
  }
}



# Ejemplos BREAK / NEXT

for(i in 1:20){
  if(i %% 2 == 0){
    next
  }
  if(i>15){
    break
  }
  print(i)
}

# Ejemplos REPEAT

a <- 0
repeat{
  a <- a + 1
  if(a==5){
    print(a)
  }
}
