#### Exercice 1 ####
set.seed(1997)
df1 <- data.frame(
  altura = c(rnorm(100, mean = 176, sd = 10), rnorm(100, mean = 162, sd = 10)),
  sexo = c(rep("male", times = 100), rep("female", times = 100))
)
#df1 contiene unas seqüencias aleatorias que contienen la altura (en cm) de 100 hombres y 100 mujeres

#1. Cread dos data sets, uno con los males y otro con females
library(dplyr)

males <- df1 ___
___(sexo ___ "male")

females <- df1 ___
___(sexo ___ "female")

#2. Cual es la altura promedio de los hombres (en metros)?
library(DataSummary)


#3. Cual es el valor minimo en las mujeres (en metros)?



#4. Grafica la distribucion de los datos en dos histogramas agrupados
#El grafico debe llamarse: Alturas por Sexo
#El eje y no debe tener titulo
#El eje x debe llamarse: Altura (cm)
#Debe poner en la parte inferior: Fuente: la del comedor
#El titulo de la leyenda debe ser: Sexo
#Los hombres deben estar en verde y las mujeres en rosa
#Remplazad SOLO los ___ para obtener el grafico deseado
library(ggplot2)

ggplot(___, aes(x = altura, fill = ___)) + 
  geom_histogram(aes(y = after_stat(density)), bins = 20, 
                 color = "black") + 
  theme_bw() + 
  theme(axis.title.y = ___, 
        axis.text.y = element_text(color = "black"),
        axis.text.x = element_text(color = "black"), 
        ___ = "bottom") + 
  ___(x = "Altura (cm)", title = "___",
       ___ = "Fuente: la del comedor") + 
  guides(fill = guide_legend(___ = "Sexo")) + 
  ___(breaks = c("male", "female"),
                    values = ___("green", "pink")) + 
  ___(sexo ~ .)



#5. Comprobad usando un test de shapiro lo normalidad de ambos sexos

___(males$___)
___(females$___)

#6. Comprobad la homogenidad de variancias
library(car)

leveneTest(___ ~ ___, ___ = df1)

#7. Utiliza el test apropiado para comprovar si existen diferencias significativas

___(altura ~ ___, ___ = df1, paired = ___, var.eq = ___)

#8. Cread un grafico de barras con la desviacion estandard (SD)
ggplot(___, aes(x = sexo, y = altura, fill = ___)) + 
  geom_col(color = "black") + 
  ___(aes(___ = VarNum - ___, ymax = ___ + SD), width=.1, 
                position=position_dodge(0.05)) +
  theme_bw() + 
  theme(axis.text.___ = element_text(color = "black"),
        axis.text.___ = element_text(color = "black"),
        axis.title.x = element_blank(),
        legend.position = "bottom") + 
  ___(y = "Altura (cm)", title = "Alturas por sexos") + 
  guides(fill = guide_legend(title = "Sexo")) + 
  scale_fill____(breaks = c("male", "female"),
                    values=c("green", "pink"))