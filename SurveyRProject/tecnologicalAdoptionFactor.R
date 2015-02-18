fator_tecnologico_labels <- c(
  "Facilidade de testar\n e de ser avaliado por usuários\n de um modo geral",
  "Utilização de modelos de desenvolvimento\n e de qualidade bem definidos\n por parte do fabricante",
  "Compatibilidade com a infraestrutura existente,\n com os requisitos/necessidades/demandas,\n e/ou com a tecnologia em vigor",
  "Facilidade de entender,\n utilizar e/ou adaptar",
  "Vantagem(ns) em relação a custos com hardware,\n requisitos mínimos menos exigentes,\n custos com licença ou suporte, etc",
  "Maior eficiência em relação à solução,\n livre ou não, utilizada atualmente",
  "Maior confiabilidade em relação à solução,\n livre ou não, utilizada atualmente"  
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
rownames(fator_tecnologico) <- c("nenhuma influência","pouca influência","influência considerável","muita influência")

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
  main="Na sua opinião, em que grau estes fatores influenciam\n a adoção de software livre do ponto de vista tecnológico?"
)

text(   
  x = fator_tecnologico, 
  y = fator_tecnologico_graph,
  labels = fator_tecnologico,  
  pos = 4,   
  cex = .55)

dev.copy(png,"pictures/06-fator-tecnologico.png", width=861, height=545, units = "px")
dev.off()
