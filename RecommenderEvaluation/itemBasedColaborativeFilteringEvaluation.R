#install.packages("dplyr")
load(".RData")

itemBased <- tbl_df(itemBased)

successfulRecomendations <- filter(
  itemBased,
  RecomendacoesComSucessoPct == 1.00)

failedRecomendations <- filter(
  itemBased,
  RecomendacoesSemSucessoPct == 1.00)


successfulRecomendations <- arrange (successfulRecomendations, ProjetosVisualizados)
failedRecomendations <- arrange (failedRecomendations, desc(ProjetosVisualizados))

write.table(
  successfulRecomendations, 
  "data/itemBasedSuccessfulRecomendations.csv",
  sep=";",
  row.names=FALSE)

write.table(
  failedRecomendations, 
  "data/itemBasedFailedRecomendations.csv",
  sep=";",
  row.names=FALSE)