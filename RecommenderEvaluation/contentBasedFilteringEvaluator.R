#install.packages("dplyr")
library("dplyr")
load(".RData")

contentBased <- tbl_df(contentBased)

contentBased <- arrange(
  contentBased,
  IdUsuario
  )

contentBasedSuccessfulRecomendations <- filter(
  contentBased,
  ProjetoRecomendado != "")

contentBasedFailedRecomendations <- filter(
  contentBased,
  ProjetoRecomendado == "")

contentBasedSuccessfulRecomendations <- arrange (
  contentBasedSuccessfulRecomendations, 
  IdUsuario,
  PosicaoNaLista,
  desc(InterseccaoTags)
  )

contentBasedFailedRecomendations <- arrange (
  contentBasedFailedRecomendations, 
  IdUsuario,
  desc(ProjetosVisualizados)
  )

write.table(
  contentBased,
  "data/Avaliação Offline - Projetos Similares.csv", 
  sep=";",
  row.names=FALSE)

write.table(
  contentBasedSuccessfulRecomendations, 
  "data/contentBasedSuccessfulRecomendations.csv",
  sep=";",
  row.names=FALSE)

write.table(
  contentBasedFailedRecomendations, 
  "data/contentBasedFailedRecomendations.csv",
  sep=";",
  row.names=FALSE)