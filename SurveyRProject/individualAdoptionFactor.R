#install.packages("dplyr")
load("surveyData.RData")

require(reshape2)
require(ggplot2)
require(scales)
require(grid)
require(dplyr)

fator.individual.labels <- c(
  "Profile search for solutions in FOSS",  
  "Certainty in choosing an FOSS solution as the most suitable for the problem at hand",  
  "Prior adoption of FOSS successfully",  
  "Existence of some success between people of the circle of contacts",  
  "Political aspects and / or ideological" 
)

fator.individual.title <- "In your opinion, to what extent these factors influence the\n FOSS adoption from a technological point of view?"

# Quebrando o texto automaticamente (Só tirei os \n do vetor de cima e acrescentei as 3 linhas abaixo)
tamanho <- 50 # O limite de caracteres (ele vai quebrar no espaço anterior a palavra que ultrapassa o limite)
(fator.individual.labels <- strwrap(fator.individual.labels, tamanho, simplify=F)) # Cria uma lista onde cada elemento é um vetor com até 40 caracteres. 
(fator.individual.labels <- mapply(paste, fator.individual.labels, collapse='\n')) # Monta o vetor com as labels.


fator.individual.dados <- cbind(
  table(as.numeric(data[,38])),
  table(as.numeric(data[,39])),
  table(as.numeric(data[,40])),
  table(as.numeric(data[,41])),
  table(as.numeric(data[,42])) 
)

fator.individual.resultado <- as.data.frame(
  rbind(
    colSums(fator.individual.dados[3:4,]),
    colSums(fator.individual.dados[1:2,])
  )
)


fator.individual.resultado <- cbind(
  fator.individual.resultado,
  Label = c("high or considerable influence","little or no influence")
)


# Para usar o ggplot2 os dados precisam estar nesse formato.
fator.individual.resultado.agrupado <- reshape(
  fator.individual.resultado, 
  varying = list(c('V1', 'V2', 'V3', 'V4', 'V5')), 
  direction='long', 
  idvar='Label', 
  times=fator.individual.labels
) 

fator.individual.resultado.agrupado <- mutate(
  group_by(
    fator.individual.resultado.agrupado, 
    time),
  V1,
  cumulativo = cumsum(V1) - (V1 * 0.5)
)

#######################################################################################
# gráfico novo, mostrando barras empilhadas, e agrupando os níveis de influência
#######################################################################################

my_theme <- theme_update(panel.grid.major = element_line(colour = "grey90"), panel.grid.minor = element_blank(), panel.background = element_blank(), axis.ticks = element_blank(), legend.position = "top") 

fator.individual.resultado.agrupado.grafico <- ggplot(fator.individual.resultado.agrupado, aes(x = time, y = V1, fill = Label)) + # Informa os dados
  geom_bar(stat='identity', position="stack", color = "black") + # Informa que tu quer um gráfico de barras
  geom_text (aes(x = time, y = cumulativo, ymax = 152, label = sprintf("%d\n(%.2f%%)",V1, 100 * V1/152) ), size = 4, fontface = "bold", fontfamily= "Arial") +
  theme(   text = element_text(size=17, colour = "black"), axis.text.y = element_text(colour = "black")) +
  # Inverte os eixos X e Y
  coord_flip() + 
  ylab('Frequence') + 
  xlab('Adoption Factors') +  
  ggtitle(fator.individual.title) +
  # Coloca titulo na legenda
  #scale_fill_manual('Legenda', values = c("#66CC99","#CC6666"))
  scale_fill_brewer(palette="Set2")
#scale_fill_manual('Legenda', values = c("#00FF00","#FF0000"))


fator.individual.resultado.agrupado.grafico

ggsave(fator.individual.resultado.agrupado.grafico, file="pictures/09-fator-individual-stacked.png")

#######################################################################################
# gráfico antigo, agora com percentuais
#######################################################################################

fator.individual.dados.percentagem <- apply(
  fator.individual.dados,
  2,
  function(x) sprintf("%d (%.2f%%)", x, x * 100 / 152)
)

colnames(fator.individual.dados) <- fator.individual.labels
rownames(fator.individual.dados) <- c("No influence", "little influence", "considerable influence", "too much influence")


par(mar=c(5, 16, 4, 2))

fator.individual.dados.percentagem.graph <- barplot(
  fator.individual.dados,
  beside = TRUE, 
  horiz=TRUE, 
  las=1,  
  xlim=c(0,100),
  cex.axis = 0.7,  
  cex.names = 0.75,  
  legend.text = rownames(fator.individual.dados),
  args.legend = list("bottom", bty="n", cex = 0.7),
  col=rainbow(4),
  xpd=FALSE,
  cex.main = 0.9,
  main=fator.individual.title
)

text(   
  x = fator.individual.dados, 
  y = fator.individual.dados.percentagem.graph,
  labels = fator.individual.dados.percentagem,  
  pos = 4,   
  cex = .55)

dev.copy(png,"pictures/09-fator-individual.png",  width=1024, height=618, units = "px")
dev.off()
