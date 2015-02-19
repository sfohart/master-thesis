fator_organizacional_labels <- c(
  "Disponibilidade de recursos\n para pesquisa/estudo das solu��es\n que fa�am uso de software livre",
  "Custo Total de\n Propriedade do Software\n (envolve benef�cios/desvantagens\n t�cnicas e de neg�cio)",
  "Relev�ncia do Software\n para a Organiza��o",
  "Experi�ncia dos membros\n da equipe com uso/customiza��o\n de software livre",
  "Apoio � dissemina��o\n e uso de software livre\n por parte da alta ger�ncia"
)

fator_organizacional <- cbind(
  table(as.numeric(data[,25])),
  table(as.numeric(data[,26])),
  table(as.numeric(data[,27])),
  table(as.numeric(data[,28])),
  table(as.numeric(data[,29])) 
)


colnames(fator_organizacional) <- fator_organizacional_labels
rownames(fator_organizacional) <- c("nenhuma influ�ncia","pouca influ�ncia","influ�ncia consider�vel","muita influ�ncia")

par(mar=c(5, 16, 4, 2))

fator_organizacional_graph <- barplot(
  fator_organizacional,
  beside = TRUE, 
  horiz=TRUE, 
  las=1,  
  xlim=c(0,100),
  cex.axis = 0.7,  
  cex.names = 0.75,  
  legend.text = rownames(fator_organizacional),
  args.legend = list("bottom", bty="n", cex = 0.7),
  col=rainbow(4),
  xpd=FALSE,
  cex.main = 0.9,
  main="Na sua opini�o,\n em que grau destes fatores influenciam\n a ado��o de software livre em ambientes coorporativos?"
)

text(   
  x = fator_organizacional, 
  y = fator_organizacional_graph,
  labels = fator_organizacional,  
  pos = 4,   
  cex = .55)

dev.copy(png,"pictures/07-fator-organizacional.png",  width=1024, height=618, units = "px")
dev.off()