##### EXERCICE 2 #####

df2 <- data.frame(humidity = c(rep("dry", 9), rep("water", 12),
                               rep("wet", 12)),
                  glucose = c(6.03,6.49,6.07,21.00,24.61,17.42,
                              311.63,414.40,231.15,
                              8.63,30.72,0.85,4.94,24.19,
                              22.49,1212.14,1105.86,1165.60,61.43,
                              441.56,148.46,49.27,33.03,16.79,25.38,
                              48.97,22.06,369.42,506.88,297.80,106.58,
                              236.09,106.36))

#1. Realizar un histograma separado por "humidity"
library(___)

ggplot(df2, aes(x = ___, fill = ___)) + 
  geom_histogram(aes(y = after_stat(density)), ___ = 7, #el eje x debe estar repartido en 7 columnas
                 color = "black") + 
  theme_bw() + 
  theme(___ = element_blank(), #eliminar el titulo del eje y
        ___ = ___(color = "black"), #color de los numeros del eje y en negro
        ___ = ___(color = "black"), #color de los numeros del eje x en negro
        ___ = ___) + #No quiero leyenda
  labs(x = "eq. de Glucosa (µg) / Peso seco (g)", title = 'Distribución de "glucose"',
      caption = "Fuente: Mi TFG") + 
  ___(palette = "Reds") + 
  ___(humidity ~ .)

#2. Comprueba la homocedasticidad usando el test de Levene

library(___)

___(___ ~ ___, ___ = ___)


#3. Construye el modelo anova y llamalo "aov1"

___ <- aov(___ ~ humidity, data = ___)

#4. Comprueba la normalidad de los residuos del modelo

shapiro.test(___$res)

#5. Repite el modelo usando esta vez el ln de "glucose" y llamalo "aov2"
#Pista: por defecto la base de la funcion log() es "e"

___ <- aov(___ ~ humidity, data = ___)

#6. Repite el test de Levene usando el ln de "glucose"

___(___ ~ ___, ___ = ___)

#7. Haz un summary del modelo aov2.
#¿La humedad afecta a la cantidad de glucosa del biofilm?

___(aov2)

#Moraleja: Cuando todo parece perdido, aun puede ir a peor. Estate preparado