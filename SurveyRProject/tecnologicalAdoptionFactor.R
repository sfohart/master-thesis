load("surveyData.RData")

fator.tecnologico.labels <- c(
  "Facilidade de testar e de ser avaliado por usuários de um modo geral",
  "Utilização de desenvolvimento e de qualidade bem definidos por parte do fabricante",
  "Compatibilidade com a infraestrutura existente, com os requisitos/necessidades/demandas, e/ou com a tecnologia em vigor",
  "Facilidade de entender, utilizar e/ou adaptar",
  "Vantagem(ns) em relação a custos com hardware, requisitos mínimos menos exigentes, custos com licença ou suporte, etc",
  "Maior eficiência em relação à solução, livre ou não, utilizada atualmente",
  "Maior confiabilidade em relação à solução, livre ou não, utilizada atualmente"  
)

# Quebrando o texto automaticamente (Só tirei os \n do vetor de cima e acrescentei as 3 linhas abaixo)
tamanho <- 40 # O limite de caracteres (ele vai quebrar no espaço anterior a palavra que ultrapassa o limite)
(fator.tecnologico.labels <- strwrap(fator.tecnologico.labels, tamanho, simplify=F)) # Cria uma lista onde cada elemento é um vetor com até 40 caracteres. 
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

# Analisando respostas 'muita influência' e 'influência considerável'
# fator.tecnologico.resultado <- rbind(
#   fator.tecnologico.dados[3:4,]
# )


# fator.tecnologico.resultado <- data.frame(
#   fatores = fator.tecnologico.labels,
#   total = colSums(fator.tecnologico.dados[3:4,])
# )
# 
# 
# fator.tecnologico.resultado <- rbind(
#   mapply(fator.tecnologico.resultado, 7, FUN = function(r,c) round(r / 152 * 100, digits=2))
# )  

fator.tecnologico.resultado = data.frame(
  fatores = fator.tecnologico.labels,
  total = colSums(fator.tecnologico.dados[3:4,])  
  )

fator.tecnologico.percentagens = data.frame(
  fatores = fator.tecnologico.labels,
  total = mapply(
    colSums(fator.tecnologico.dados[3:4,]),
    FUN = function(r,c) round(r / 152 * 100, digits=2)
    )
)


require(ggplot2)
require(scales)


fator.tecnologico.grafico <-
  ggplot(data = fator.tecnologico.percentagens, aes(x = fatores, y = total, color = "black"), size = 3.5) +
  theme(text = element_text(size=18, face = "bold")) +
  geom_bar(stat = "identity", position = "dodge", fill="#99CCFF", colour="black") +
  geom_text(aes(label = paste(total, "%", " ")), hjust = 1.2, color="black", fontface = "bold") +
  #scale_y_continuous(labels = percent_format()) +  
  coord_flip() +
  xlab('Fatores de adoção') +
  ylab('Muita Influência + Influência Considerável (%)') +
  ggtitle("Na sua opinião, em que grau estes fatores influenciam\n a adoção de software livre do ponto de vista tecnológico?\n")

fator.tecnologico.grafico


ggsave(fator.tecnologico.grafico, file="pictures/06-fator-tecnologico.png")
