fator_individual_labels <- c(
  "Perfil para pesquisa de\n solu��es em software livre",  
  "Certeza na escolha de uma\n solu��o de software livre como a mais\n adequada para o problema em quest�o",  
  "Ado��o pr�via\n de um software livre com sucesso",  
  "Exist�ncia de algum caso de sucesso\n entre pessoas do c�rculo de contatos",  
  "Aspectos pol�ticos e/ou ideol�gicos"
)

fator_individual <- cbind(
  table(as.numeric(data[,38])),
  table(as.numeric(data[,39])),
  table(as.numeric(data[,40])),
  table(as.numeric(data[,41])),
  table(as.numeric(data[,42]))
)


colnames(fator_individual) <- fator_individual_labels
rownames(fator_individual) <- c("nenhuma influ�ncia","pouca influ�ncia","influ�ncia consider�vel","muita influ�ncia")

par(mar=c(5, 16, 4, 2))

fator_individual_graph <- barplot(
  fator_individual,
  beside = TRUE, 
  horiz=TRUE, 
  las=1,  
  xlim=c(0,100),
  cex.axis = 0.7,  
  cex.names = 0.75,  
  legend.text = rownames(fator_individual),
  args.legend = list("bottom", bty="n", cex = 0.7),
  col=rainbow(4),
  xpd=FALSE,
  cex.main = 0.9,
  main="Na sua opini�o, em que grau estes fatores influenciam\n a ado��o de software livre, do ponto de vista de um indiv�duo qualquer?"
)

text(   
  x = fator_individual, 
  y = fator_individual_graph,
  labels = fator_individual,  
  pos = 4,   
  cex = .55)

dev.copy(png,"pictures/09-fator-individual.png",  width=1024, height=618, units = "px")
dev.off()