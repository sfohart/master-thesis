#install.packages("dplyr")
load("surveyData.RData")

require(reshape2)
require(ggplot2)
require(scales)
require(grid)
require(dplyr)

fator.organizacional.labels <- c(
  "Disponibilidade de recursos\n para pesquisa/estudo das soluções\n que façam uso de software livre",
  "Custo Total de\n Propriedade do Software\n (envolve benefícios/desvantagens\n técnicas e de negócio)",
  "Relevância do Software\n para a Organização",
  "Experiência dos membros\n da equipe com uso/customização\n de software livre",
  "Apoio à disseminação\n e uso de software livre\n por parte da alta gerência" 
)

# Quebrando o texto automaticamente (Só tirei os \n do vetor de cima e acrescentei as 3 linhas abaixo)
tamanho <- 35 # O limite de caracteres (ele vai quebrar no espaço anterior a palavra que ultrapassa o limite)
(fator.organizacional.labels <- strwrap(fator.organizacional.labels, tamanho, simplify=F)) # Cria uma lista onde cada elemento é um vetor com até 40 caracteres. 
(fator.organizacional.labels <- mapply(paste, fator.organizacional.labels, collapse='\n')) # Monta o vetor com as labels.


fator.organizacional.dados <- cbind(
  table(as.numeric(data[,25])),
  table(as.numeric(data[,26])),
  table(as.numeric(data[,27])),
  table(as.numeric(data[,28])),
  table(as.numeric(data[,29])) 
)

fator.organizacional.resultado <- as.data.frame(
  rbind(
    colSums(fator.organizacional.dados[3:4,]),
    colSums(fator.organizacional.dados[1:2,])
  )
)


fator.organizacional.resultado <- cbind(
  fator.organizacional.resultado,
  Label = c("influência considerável ou alta","pouca ou nenhuma influência")
  #Label = c("pouca ou nenhuma influência","influência considerável ou alta")
)


# Para usar o ggplot2 os dados precisam estar nesse formato.
fator.organizacional.resultado.agrupado <- reshape(
  fator.organizacional.resultado, 
  varying = list(c('V1', 'V2', 'V3', 'V4', 'V5')), 
  direction='long', 
  idvar='Label', 
  times=fator.organizacional.labels
) 

fator.organizacional.resultado.agrupado <- mutate(
  group_by(
    fator.organizacional.resultado.agrupado, 
    time),
  V1,
  cumulativo = cumsum(V1) - (V1 * 0.5)
)

#######################################################################################
# gráfico novo, mostrando barras empilhadas, e agrupando os níveis de influência
#######################################################################################

my_theme <- theme_update(panel.grid.major = element_line(colour = "grey90"), panel.grid.minor = element_blank(), panel.background = element_blank(), axis.ticks = element_blank(), legend.position = "top") 

fator.organizacional.resultado.agrupado.grafico <- ggplot(fator.organizacional.resultado.agrupado, aes(x = time, y = V1, fill = Label)) + # Informa os dados
  geom_bar(stat='identity', position="stack", color = "black") + # Informa que tu quer um gráfico de barras
  geom_text (aes(x = time, y = cumulativo, ymax = 152, label = sprintf("%d\n(%.2f%%)",V1, 100 * V1/152) ), size = 4, fontface = "bold", fontfamily= "Arial") +
  theme(   text = element_text(size=17, colour = "black"), axis.text.y = element_text(colour = "black")) +
  # Inverte os eixos X e Y
  coord_flip() + 
  ylab('Frequência') + 
  xlab('Fatores de adoção') +  
  ggtitle("Na sua opinião, em que grau estes fatores influenciam\n a adoção de software livre do ponto de vista tecnológico?") +
  # Coloca titulo na legenda
  #scale_fill_manual('Legenda', values = c("#66CC99","#CC6666"))
  scale_fill_brewer(palette="Set2")
#scale_fill_manual('Legenda', values = c("#00FF00","#FF0000"))


fator.organizacional.resultado.agrupado.grafico

ggsave(fator.organizacional.resultado.agrupado.grafico, file="pictures/07-fator-organizacional-stacked.png")

#######################################################################################
# gráfico antigo, agora com percentuais
#######################################################################################

fator.organizacional.dados.percentagem <- apply(
  fator.organizacional.dados,
  2,
  function(x) sprintf("%d (%.2f%%)", x, x * 100 / 152)
)

colnames(fator.organizacional.dados) <- fator.organizacional.labels
rownames(fator.organizacional.dados) <- c("nenhuma influência","pouca influência","influência considerável","muita influência")


par(mar=c(5, 16, 4, 2))

fator.organizacional.dados.percentagem.graph <- barplot(
  fator.organizacional.dados,
  beside = TRUE, 
  horiz=TRUE, 
  las=1,  
  xlim=c(0,100),
  cex.axis = 0.7,  
  cex.names = 0.75,  
  legend.text = rownames(fator.organizacional.dados),
  args.legend = list("bottom", bty="n", cex = 0.7),
  col=rainbow(4),
  xpd=FALSE,
  cex.main = 0.9,
  main="Na sua opinião,\n em que grau destes fatores influenciam\n a adoção de software livre em ambientes coorporativos?"
)

text(   
  x = fator.organizacional.dados, 
  y = fator.organizacional.dados.percentagem.graph,
  labels = fator.organizacional.dados.percentagem,  
  pos = 4,   
  cex = .55)

dev.copy(png,"pictures/07-fator-organizacional.png",  width=1024, height=618, units = "px")
dev.off()
