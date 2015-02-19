fator_individual_labels <- c(
  "Perfil para pesquisa de\n soluções em software livre",  
  "Certeza na escolha de uma\n solução de software livre como a mais\n adequada para o problema em questão",  
  "Adoção prévia\n de um software livre com sucesso",  
  "Existência de algum caso de sucesso\n entre pessoas do círculo de contatos",  
  "Aspectos políticos e/ou ideológicos"
)

fator_individual <- cbind(
  table(as.numeric(data[,38])),
  table(as.numeric(data[,39])),
  table(as.numeric(data[,40])),
  table(as.numeric(data[,41])),
  table(as.numeric(data[,42]))
)


colnames(fator_individual) <- fator_individual_labels
rownames(fator_individual) <- c("nenhuma influência","pouca influência","influência considerável","muita influência")

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
  main="Na sua opinião, em que grau estes fatores influenciam\n a adoção de software livre, do ponto de vista de um indivíduo qualquer?"
)

text(   
  x = fator_individual, 
  y = fator_individual_graph,
  labels = fator_individual,  
  pos = 4,   
  cex = .55)

dev.copy(png,"pictures/09-fator-individual.png",  width=1024, height=618, units = "px")
dev.off()
