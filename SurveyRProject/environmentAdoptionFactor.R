#install.packages("dplyr")
load("surveyData.RData")

require(reshape2)
require(ggplot2)
require(scales)
require(grid)
require(dplyr)

fator.mercadologico.labels <- c(
  "Market conditions software (cost, reliability, use by other competing companies, etc.)",
  "Market conditions of an organization (financial strength, the team size, geographical distribution, etc.)",
  "Government incentives for the use of FOSS",
  "Negative marketing by the proprietary software vendors",
  "Availability of external experts and support services to the organization",
  "Existence of a success in the market"  
)

fator.mercadologico.title <- "In your opinion, to what extent these factors influence the\n FOSS adoption from a technological point of view?"

# Quebrando o texto automaticamente (Só tirei os \n do vetor de cima e acrescentei as 3 linhas abaixo)
tamanho <- 50 # O limite de caracteres (ele vai quebrar no espaço anterior a palavra que ultrapassa o limite)
(fator.mercadologico.labels <- strwrap(fator.mercadologico.labels, tamanho, simplify=F)) # Cria uma lista onde cada elemento é um vetor com até 40 caracteres. 
(fator.mercadologico.labels <- mapply(paste, fator.mercadologico.labels, collapse='\n')) # Monta o vetor com as labels.


fator.mercadologico.dados <- cbind(
  table(as.numeric(data[,31])),
  table(as.numeric(data[,32])),
  table(as.numeric(data[,33])),
  table(as.numeric(data[,34])),
  table(as.numeric(data[,35])),
  table(as.numeric(data[,36])) 
)

fator.mercadologico.resultado <- as.data.frame(
  rbind(
    colSums(fator.mercadologico.dados[3:4,]),
    colSums(fator.mercadologico.dados[1:2,])
  )
)


fator.mercadologico.resultado <- cbind(
  fator.mercadologico.resultado,
  Label = c("high or considerable influence","little or no influence")
  #Label = c("pouca ou nenhuma influência","influência considerável ou alta")
)


# Para usar o ggplot2 os dados precisam estar nesse formato.
fator.mercadologico.resultado.agrupado <- reshape(
  fator.mercadologico.resultado, 
  varying = list(c('V1', 'V2', 'V3', 'V4', 'V5', 'V6')), 
  direction='long', 
  idvar='Label', 
  times=fator.mercadologico.labels
) 

fator.mercadologico.resultado.agrupado <- mutate(
  group_by(
    fator.mercadologico.resultado.agrupado, 
    time),
  V1,
  cumulativo = cumsum(V1) - (V1 * 0.5)
)

#######################################################################################
# gráfico novo, mostrando barras empilhadas, e agrupando os níveis de influência
#######################################################################################

my_theme <- theme_update(panel.grid.major = element_line(colour = "grey90"), panel.grid.minor = element_blank(), panel.background = element_blank(), axis.ticks = element_blank(), legend.position = "top") 




fator.mercadologico.resultado.agrupado.grafico <- ggplot(fator.mercadologico.resultado.agrupado, aes(x = time, y = V1, fill = Label)) + # Informa os dados
  geom_bar(stat='identity', position="stack", color = "black") + # Informa que tu quer um gráfico de barras
  geom_text (aes(x = time, y = cumulativo, ymax = 152, label = sprintf("%d\n(%.2f%%)",V1, 100 * V1/152) ), size = 4, fontface = "bold", fontfamily= "Arial") +
  theme(   text = element_text(size=17, colour = "black"), axis.text.y = element_text(colour = "black")) +
  # Inverte os eixos X e Y
  coord_flip() + 
  ylab('Frequence') + 
  xlab('Adoption Factors') +   
  ggtitle(fator.mercadologico.title) +
  # Coloca titulo na legenda
  #scale_fill_manual('Legenda', values = c("#66CC99","#CC6666"))
  scale_fill_brewer(palette="Set2")
#scale_fill_manual('Legenda', values = c("#00FF00","#FF0000"))


fator.mercadologico.resultado.agrupado.grafico

ggsave(fator.mercadologico.resultado.agrupado.grafico, file="pictures/08-fator-mercadologico-stacked.png")

#######################################################################################
# gráfico antigo, agora com percentuais
#######################################################################################

fator.mercadologico.dados.percentagem <- apply(
  fator.mercadologico.dados,
  2,
  function(x) sprintf("%d (%.2f%%)", x, x * 100 / 152)
)

colnames(fator.mercadologico.dados) <- fator.mercadologico.labels
rownames(fator.mercadologico.dados) <- c("No influence", "little influence", "considerable influence", "too much influence")


par(mar=c(5, 16, 4, 2))

fator.mercadologico.dados.percentagem.graph <- barplot(
  fator.mercadologico.dados,
  beside = TRUE, 
  horiz=TRUE, 
  las=1,  
  xlim=c(0,100),
  cex.axis = 0.7,  
  cex.names = 0.75,  
  legend.text = rownames(fator.mercadologico.dados),
  args.legend = list("bottom", bty="n", cex = 0.7),
  col=rainbow(4),
  xpd=FALSE,
  cex.main = 0.9,
  main=fator.mercadologico.title
)

text(   
  x = fator.mercadologico.dados, 
  y = fator.mercadologico.dados.percentagem.graph,
  labels = fator.mercadologico.dados.percentagem,  
  pos = 4,   
  cex = .55)

dev.copy(png,"pictures/08-fator-mercadologico.png",  width=1024, height=618, units = "px")
dev.off()
