#install.packages("dplyr")
library("dplyr")
load(".RData")

itemBased <- tbl_df(itemBased)

itemBasedSuccessfulRecomendations <- filter(
  itemBased,
  RecomendacoesSucessoPct == 1.00)

itemBasedFailedRecomendations <- filter(
  itemBased,
  RecomendacoesFalhaPct == 1.00)

evaluationItemBased <- summarise(
  group_by(itemBased,QuantosProjetosRecomendar), 
  successMean = mean(RecomendacoesSucesso, na.rm = TRUE),
  sdSuccessMean = sd(RecomendacoesSucesso),
  failMean = mean(RecomendacoesFalha, na.rm = TRUE),
  sdFailMean = sd(RecomendacoesFalha)
  )




itemBasedSuccessfulRecomendations <- arrange (itemBasedSuccessfulRecomendations, ProjetosVisualizados)
itemBasedFailedRecomendations <- arrange (itemBasedFailedRecomendations, desc(ProjetosVisualizados))

write.table(
  evaluationItemBased, 
  "data/evaluationItemBased.csv",
  sep=";",
  row.names=FALSE)

write.table(
  itemBasedSuccessfulRecomendations, 
  "data/itemBasedSuccessfulRecomendations.csv",
  sep=";",
  row.names=FALSE)

write.table(
  itemBasedFailedRecomendations, 
  "data/itemBasedFailedRecomendations.csv",
  sep=";",
  row.names=FALSE)