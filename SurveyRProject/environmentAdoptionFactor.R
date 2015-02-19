fator_mercadologico_labels <- c(
  "Condições de mercado do software\n (custo, confiabilidade, uso\n por outras companhias concorrentes,\n dentre outros)",
  "Condições de mercado de uma\n organização (fôlego financeiro,\n tamanho das equipes,\n distribuição geográfica,\n dentre outros)",
  "Incentivo do governo\n para uso de software livre",
  "Marketing negativo por parte dos\n vendedores de software proprietário",
  "Disponibilidade de especialistas\n e serviços de suporte externos à organização",
  "Existência de um\n caso de sucesso no mercado"  
)

fator_mercadologico <- cbind(
  table(as.numeric(data[,31])),
  table(as.numeric(data[,32])),
  table(as.numeric(data[,33])),
  table(as.numeric(data[,34])),
  table(as.numeric(data[,35])),
  table(as.numeric(data[,36]))
)


colnames(fator_mercadologico) <- fator_mercadologico_labels
rownames(fator_mercadologico) <- c("nenhuma influência","pouca influência","influência considerável","muita influência")

par(mar=c(5, 16, 4, 2))

fator_mercadologico_graph <- barplot(
  fator_mercadologico,
  beside = TRUE, 
  horiz=TRUE, 
  las=1,  
  xlim=c(0,100),
  cex.axis = 0.7,  
  cex.names = 0.75,  
  legend.text = rownames(fator_mercadologico),
  args.legend = list("bottom", bty="n", cex = 0.7),
  col=rainbow(4),
  xpd=FALSE,
  cex.main = 0.9,
  main="Na sua opinião, em que grau os fatores abaixo\n influenciam a adoção de um software livre\n do ponto de vista mercadológico?"
)

text(   
  x = fator_mercadologico, 
  y = fator_mercadologico_graph,
  labels = fator_mercadologico,  
  pos = 4,   
  cex = .55)

dev.copy(png,"pictures/08-fator-mercadologico.png",  width=1024, height=618, units = "px")
dev.off()
