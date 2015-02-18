fator_tecnologico_labels <- c(
  "Facilidade de testar\n e de ser avaliado por usu�rios\n de um modo geral",
  "Utiliza��o de modelos de desenvolvimento\n e de qualidade bem definidos\n por parte do fabricante",
  "Compatibilidade com a infraestrutura existente,\n com os requisitos/necessidades/demandas,\n e/ou com a tecnologia em vigor",
  "Facilidade de entender,\n utilizar e/ou adaptar",
  "Vantagem(ns) em rela��o a custos com hardware,\n requisitos m�nimos menos exigentes,\n custos com licen�a ou suporte, etc",
  "Maior efici�ncia em rela��o � solu��o,\n livre ou n�o, utilizada atualmente",
  "Maior confiabilidade em rela��o � solu��o,\n livre ou n�o, utilizada atualmente"  
)

fator_tecnologico <- cbind(
  table(as.numeric(data[,17])),
  table(as.numeric(data[,18])),
  table(as.numeric(data[,19])),
  table(as.numeric(data[,20])),
  table(as.numeric(data[,21])),
  table(as.numeric(data[,22])),
  table(as.numeric(data[,23]))
)


colnames(fator_tecnologico) <- fator_tecnologico_labels
rownames(fator_tecnologico) <- c("nenhuma influ�ncia","pouca influ�ncia","influ�ncia consider�vel","muita influ�ncia")

par(mar=c(5, 18, 4, 2))

fator_tecnologico_graph <- barplot(
  fator_tecnologico,
  beside = TRUE, 
  horiz=TRUE, 
  las=1,  
  xlim=c(0,110),
  cex.axis = 0.7,  
  cex.names = 0.6,  
  legend.text = rownames(fator_tecnologico),
  args.legend = list("bottom", bty="n", cex = 0.7),
  col=rainbow(4),
  xpd=FALSE,
  cex.main = 0.9,
  main="Na sua opini�o, em que grau estes fatores influenciam\n a ado��o de software livre do ponto de vista tecnol�gico?"
)

text(   
  x = fator_tecnologico, 
  y = fator_tecnologico_graph,
  labels = fator_tecnologico,  
  pos = 4,   
  cex = .55)

dev.copy(png,"pictures/06-fator-tecnologico.png", width=861, height=545, units = "px")
dev.off()