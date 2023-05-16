##### EXERCICE 3 #####
set.seed(31416)
df3 <- data.frame(
  peso = c(rnorm(100, mean = 65.9, sd = 20),
           rnorm(100, mean = 65.8, sd = 20), rnorm(100, mean = 80.5, sd = 20)),
  pais = c(rep("españa", times = 100),
           rep("portugal", times = 100), rep("egipto", times = 100))
)

#1. Realizar un histograma separado por "country"
library(___)

___(df3, ___(x = ___, fill = ___)) + 
  geom_histogram(aes(y = after_stat(density)), bins = 20, 
                 color = "black") + 
  theme_bw() + 
  theme(___) + #sin titulo "y" + texto en "y" y "x" en negro + sin leyenda
  ___(___ = "___", ___ = "___") + # titulo de "x": Peso (kg); titulo del grafico: Peso por paises
  scale_fill_brewer(___ = "___") + # usar la paleta "Dark2"
  ___(___ ~ .) # separados en funcion de "country"

#2. Comprueba la homocedasticidad usando el test de Levene

library(___)

___(___ ~ ___, ___ = ___)


#3. Construye el modelo anova y llamalo "aov1"

___ <- aov(___ ~ ___, data = ___)

#4. Comprueba la normalidad de los residuos del modelo

___(___$___)

#5. Haz un summary del modelo anova

___(___)

#6. Realiza un pos-hoc Tukey

___(aov1)

#7. Realiza un grafico de caja para visualizar tus datos

ggplot(___, aes(x = ___, y = ___, fill = ___)) + 
  stat_boxplot(geom = "errorbar", width = 0.15) + #asi le gusta mas a Irene -_-
  geom_boxplot(color = "black") + 
  theme_bw() + 
  theme(___) + #eje y: titulo i en negro; eje x: sin titulo ni texto ni ticks
  ___(___) + #titulo del eje y: Peso (kg); titulo del grafico: Peso por paises
  guides(fill = guide_legend(title = "Pais")) + 
  ___(___ = "___") #llenar con la paleta "Dark2"

#8. Realiza un grafico de barras con la SD

library(DataSummary)
data_sum <- data.summary(___, "___", "___")

ggplot(data_sum, ___(___)) + 
  ___(___) + #grafico de columas i borde en negro
  ___(___(___ = peso - SD, ___ = peso + SD), width=.1, 
                position=position_dodge(0.05)) +
  theme_bw() +
  theme(___) + #igual que el grafico anterior (no sirve copy paste)
  ___(___) + #mismos titulos que antes
  guides(fill = guide_legend(title = "Pais")) + 
  ___(___ = "___") #misma paleta "Dark2"
