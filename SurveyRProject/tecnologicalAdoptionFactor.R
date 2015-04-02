#install.packages("dplyr")
load("surveyData.RData")

require(reshape2)
require(ggplot2)
require(scales)
require(grid)
require(plyr)

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
tamanho <- 35 # O limite de caracteres (ele vai quebrar no espaço anterior a palavra que ultrapassa o limite)
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

fator.tecnologico.resultado <- as.data.frame(
  rbind(
    colSums(fator.tecnologico.dados[3:4,]),
    colSums(fator.tecnologico.dados[1:2,])
  )
)

fator.tecnologico.percentagens <- as.data.frame(
  rbind(    
    mapply(
      colSums(fator.tecnologico.dados[3:4,]),
      FUN = function(r,c) round(r / 152 * 100, digits=2)
    ),
    mapply(
      colSums(fator.tecnologico.dados[1:2,]),
      FUN = function(r,c) round(r / 152 * 100, digits=2)
    )
  )
)

fator.tecnologico.resultado <- cbind(
  fator.tecnologico.resultado,
  Label = c("influência considerável ou alta","pouca ou nenhuma influência")
  #Label = c("pouca ou nenhuma influência","influência considerável ou alta")
)

fator.tecnologico.percentagens <- cbind(
  fator.tecnologico.percentagens,
  Label = c("influência considerável ou alta","pouca ou nenhuma influência")
  #Label = c("pouca ou nenhuma influência","influência considerável ou alta")
)

# Para usar o ggplot2 os dados precisam estar nesse formato.
fator.tecnologico.resultado.agrupado <- reshape(
  fator.tecnologico.resultado, 
  varying = list(c('V1', 'V2', 'V3', 'V4', 'V5', 'V6', 'V7')), 
  direction='long', 
  idvar='Label', 
  times=fator.tecnologico.labels
) 

fator.tecnologico.percentagens.agrupado <- reshape(
  fator.tecnologico.percentagens, 
  varying = list(c('V1', 'V2', 'V3', 'V4', 'V5', 'V6', 'V7')), 
  direction='long', 
  idvar='Label', 
  times=fator.tecnologico.labels
) 

fator.tecnologico.resultado.agrupado <- mutate(
  group_by(
    fator.tecnologico.resultado.agrupado, 
    time),
  V1,
  cumulativo = cumsum(V1)
  )

fator.tecnologico.percentagens.agrupado <- mutate(
  group_by(
    fator.tecnologico.resultado.agrupado, 
    time),
  V1,
  cumulativo = cumsum(V1)
)

fator.tecnologico.resultado.agrupado.grafico <- ggplot(fator.tecnologico.resultado.agrupado, aes(x = time, y = V1, fill = Label)) + # Informa os dados
  geom_bar(stat='identity') + # Informa que tu quer um gráfico de barras
  #geom_text (aes(x = time, y = cumulativo, label = sprintf("%d (%.2f%%)", V1, V1 / 152 * 100))) +
  geom_text (aes(x = time, y = cumulativo, label = V1), hjust=-0.25, size = 4.5) +
  scale_y_continuous(limit =  c(0,200)) +
  # Inverte os eixos X e Y
  coord_flip() + 
  ylab('Frequência') + 
  xlab('Fatores de adoção') +  
  ggtitle("Na sua opinião, em que grau estes fatores influenciam\n a adoção de software livre do ponto de vista tecnológico?") +
  # Coloca titulo na legenda
  scale_fill_manual('Legenda', values = c("#66CC99","#CC6666"))


fator.tecnologico.resultado.agrupado.grafico



ggsave(fator.tecnologico.resultado.agrupado.grafico, file="pictures/06-fator-tecnologico-percentagens.png")
