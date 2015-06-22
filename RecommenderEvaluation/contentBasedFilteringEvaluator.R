#install.packages("dplyr")
library("dplyr")
load(".RData")

contentBased <- tbl_df(contentBased)

contentBasedSuccessfulRecomendations <- filter(
  contentBased,
  RecomendacoesSucessoPct == 1.00)

contentBasedFailedRecomendations <- filter(
  contentBased,
  RecomendacoesFalhaPct == 1.00)

evaluationContentBased <- summarise(
  group_by(contentBased,QuantosProjetosRecomendar), 
  successMean = mean(RecomendacoesSucesso, na.rm = TRUE),
  sdSuccessMean = sd(RecomendacoesSucesso),
  failMean = mean(RecomendacoesFalha, na.rm = TRUE),
  sdFailMean = sd(RecomendacoesFalha)
)




contentBasedSuccessfulRecomendations <- arrange (contentBasedSuccessfulRecomendations, ProjetosVisualizados)
contentBasedFailedRecomendations <- arrange (contentBasedFailedRecomendations, desc(ProjetosVisualizados))

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

write.table(
  contentBasedFailedRecomendations, 
  "data/contentBasedFailedRecomendations.csv",
  sep=";",
  row.names=FALSE)