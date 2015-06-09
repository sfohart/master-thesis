#install.packages("dplyr")
load(".RData")

itemBased <- tbl_df(itemBased)

itemBasedSuccessfulRecomendations <- filter(
  itemBased,
  RecomendacoesComSucessoPct == 1.00)

itemBasedFailedRecomendations <- filter(
  itemBased,
  RecomendacoesSemSucessoPct == 1.00)


itemBasedSuccessfulRecomendations <- arrange (itemBasedSuccessfulRecomendations, ProjetosVisualizados)
itemBasedFailedRecomendations <- arrange (itemBasedFailedRecomendations, desc(ProjetosVisualizados))

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