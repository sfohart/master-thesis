#install.packages("dplyr")
load("surveyData.RData")

require(reshape2)
require(ggplot2)
require(scales)
require(grid)
require(dplyr)

fator.tecnologico.labels <- c(
  "Ease of testing and be rated by users in general",
  "Use of development and quality well-defined by the manufacturer",
  "Compatibility with existing infrastructure with the requirements / needs / demands, and/or technology in place",
  "Easy to understand, use and/or adapt",
  "Advantages over hardware costs, minimum requirements less demanding, cost of license or support, etc.",
  "Increased efficiency in relation to the solution, free or not, currently used",
  "Increased reliability with respect to the solution, free or not, currently used"  
)

fator.tecnologico.title <- "In your opinion, to what extent these factors influence the\n FOSS adoption from a technological point of view?"

# Quebrando o texto automaticamente (S� tirei os \n do vetor de cima e acrescentei as 3 linhas abaixo)
tamanho <- 50 # O limite de caracteres (ele vai quebrar no espa�o anterior a palavra que ultrapassa o limite)
(fator.tecnologico.labels <- strwrap(fator.tecnologico.labels, tamanho, simplify=F)) # Cria uma lista onde cada elemento � um vetor com at� 40 caracteres. 
(fator.tecnologico.labels <- mapply(paste, fator.tecnologico.labels, collapse='\n')) # Monta o vetor com as labels.


fator.tecnologico.dados <- cbind(
  table(as.numeric(data[,17])),
  table(as.numeric(data[,18])),
  table(as.numeric(data[,19])),
  table(as.numeric(data[,20])),
  table(as.numeric(data[,21])),
  table(as.numeric(data[,22])),
  table(as.numeric(data[,23]))
)

fator.tecnologico.resultado <- as.data.frame(
  rbind(
    colSums(fator.tecnologico.dados[3:4,]),
    colSums(fator.tecnologico.dados[1:2,])
  )
)


fator.tecnologico.resultado <- cbind(
  fator.tecnologico.resultado,
  Label = c("high or considerable influence","little or no influence")
  #Label = c("pouca ou nenhuma influ�ncia","influ�ncia consider�vel ou alta")
)


# Para usar o ggplot2 os dados precisam estar nesse formato.
fator.tecnologico.resultado.agrupado <- reshape(
  fator.tecnologico.resultado, 
  varying = list(c('V1', 'V2', 'V3', 'V4', 'V5', 'V6', 'V7')), 
  direction='long', 
  idvar='Label', 
  times=fator.tecnologico.labels
) 

fator.tecnologico.resultado.agrupado <- mutate(
  group_by(
    fator.tecnologico.resultado.agrupado, 
    time),
  V1,
  cumulativo = cumsum(V1) - (V1 * 0.5)
  )

#######################################################################################
# gr�fico novo, mostrando barras empilhadas, e agrupando os n�veis de influ�ncia
#######################################################################################

my_theme <- theme_update(panel.grid.major = element_line(colour = "grey90"), panel.grid.minor = element_blank(), panel.background = element_blank(), axis.ticks = element_blank(), legend.position = "top") 

fator.tecnologico.resultado.agrupado.grafico <- ggplot(fator.tecnologico.resultado.agrupado, aes(x = time, y = V1, fill = Label)) + # Informa os dados
  geom_bar(stat='identity', position="stack", color = "black") + # Informa que tu quer um gr�fico de barras
  geom_text (aes(x = time, y = cumulativo, ymax = 152, label = sprintf("%d\n(%.2f%%)",V1, 100 * V1/152) ), size = 4, fontface = "bold", fontfamily= "Arial") +
  theme(   text = element_text(size=17, colour = "black"), axis.text.y = element_text(colour = "black")) +
  # Inverte os eixos X e Y
  coord_flip() + 
  ylab('Frequence') + 
  xlab('Adoption Factors') +   
  ggtitle(fator.tecnologico.title) +
  # Coloca titulo na legenda
  #scale_fill_manual('Legenda', values = c("#66CC99","#CC6666"))
  scale_fill_brewer(palette="Set2")
  #scale_fill_manual('Legenda', values = c("#00FF00","#FF0000"))


fator.tecnologico.resultado.agrupado.grafico

ggsave(fator.tecnologico.resultado.agrupado.grafico, file="pictures/06-fator-tecnologico-stacked.png")

#######################################################################################
# gr�fico antigo, agora com percentuais
#######################################################################################

fator.tecnologico.dados.percentagem <- apply(
  fator.tecnologico.dados,
  2,
  function(x) sprintf("%d (%.2f%%)", x, x * 100 / 152)
)

colnames(fator.tecnologico.dados) <- fator.tecnologico.labels
rownames(fator.tecnologico.dados) <- c("No influence", "little influence", "considerable influence", "too much influence")


par(mar=c(5, 16, 4, 2))

fator.tecnologico.dados.percentagem.graph <- barplot(
  fator.tecnologico.dados,
  beside = TRUE, 
  horiz=TRUE, 
  las=1,  
  xlim=c(0,100),
  cex.axis = 0.7,  
  cex.names = 0.75,  
  legend.text = rownames(fator.tecnologico.dados),
  args.legend = list("bottom", bty="n", cex = 0.7),
  col=rainbow(4),
  xpd=FALSE,
  cex.main = 0.9,
  main=fator.tecnologico.title
)

text(   
  x = fator.tecnologico.dados, 
  y = fator.tecnologico.dados.percentagem.graph,
  labels = fator.tecnologico.dados.percentagem,  
  pos = 4,   
  cex = .55)

dev.copy(png,"pictures/06-fator-tecnologico.png",  width=1024, height=618, units = "px")
dev.off()
