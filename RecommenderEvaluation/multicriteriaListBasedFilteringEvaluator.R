#install.packages("dplyr")
library("dplyr")
load(".RData")

multicriteriaRecommendationLists <- tbl_df(multicriteriaRecommendationLists)

evaluationMulticriteriaListBasedRecommendation <- summarise(
  group_by(multicriteriaRecommendationLists,QuantosProjetosRecomendar), 
  successMean = mean(ProjetosRecomendadosVistosNaoAvaliados / ProjetosAvaliados, na.rm = TRUE),
  sdSuccessMean = sd(ProjetosRecomendadosVistosNaoAvaliados / ProjetosAvaliados)
)