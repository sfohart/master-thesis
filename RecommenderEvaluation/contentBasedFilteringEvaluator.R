#install.packages("dplyr")
library("dplyr")
load(".RData")

contentBased <- tbl_df(contentBased)

contentBasedSuccessfulRecomendations <- filter(
  contentBased,
  RecomendacoesSucesso / ProjetosVisualizados == 1.00)

evaluationContentBased <- summarise(
  group_by(contentBased,QuantosProjetosRecomendar), 
  successMean = mean(RecomendacoesSucesso / ProjetosVisualizados, na.rm = TRUE),
  sdSuccessMean = sd(RecomendacoesSucesso / ProjetosVisualizados)
)

contentBasedSuccessfulRecomendations <- arrange (contentBasedSuccessfulRecomendations, ProjetosVisualizados)


write.table(
  evaluationContentBased, 
  "data/evaluationContentBased.csv",
  sep=";",
  row.names=FALSE)

write.table(
  contentBasedSuccessfulRecomendations, 
  "data/contentBasedSuccessfulRecomendations.csv",
  sep=";",
  row.names=FALSE)

