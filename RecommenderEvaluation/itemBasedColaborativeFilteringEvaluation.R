#install.packages("dplyr")
library("dplyr")
load(".RData")

itemBased <- tbl_df(itemBased)

itemBasedSuccessfulRecomendations <- filter(
  itemBased,
  RecomendacoesSucesso / ProjetosVisualizados == 1.00)

evaluationItemBased <- summarise(
  group_by(itemBased,QuantosProjetosRecomendar), 
  successMean = mean(RecomendacoesSucesso / ProjetosVisualizados, na.rm = TRUE),
  sdSuccessMean = sd(RecomendacoesSucesso / ProjetosVisualizados)
  )

itemBasedSuccessfulRecomendations <- arrange (itemBasedSuccessfulRecomendations, ProjetosVisualizados)

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
