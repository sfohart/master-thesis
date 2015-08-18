#install.packages("dplyr")
library("dplyr")
load(".RData")

multicriteriaRecommendationPrediction <- tbl_df(multicriteriaRecommendationPrediction)

evaluationMulticriteriaPredictionBasedRecommendation <- summarise(
  group_by(multicriteriaRecommendationPrediction,QuantosProjetosRecomendar), 
  successMean = mean(ProjetosRecomendadosVistosNaoAvaliados, na.rm = TRUE),
  sdSuccessMean = sd(ProjetosRecomendadosVistosNaoAvaliados),
  failMean = mean(ProjetosRecomendadosNaoVistosOuJaAvaliados, na.rm = TRUE),
  sdFailMean = sd(ProjetosRecomendadosNaoVistosOuJaAvaliados)
)