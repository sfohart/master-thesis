#lendo dados do projeto
itemBased <- read.table(
  "data/Avalia��o Offline - Projetos Visualizados.csv", 
  header = TRUE,
  sep=";")

contentBased <- read.table(
  "data/Avalia��o Offline - Projetos Similares.csv", 
  header = TRUE,
  sep=";")

multicriteriaRecommendationPrediction <- read.table(
  "data/Recomenda��o Multicrit�rio - Fun��o de Agrega��o.csv", 
  header = TRUE,
  sep=";")


multicriteriaRecommendationLists <- read.table(
  "data/Recomenda��o Multicrit�rio - Listas Concatenadas.csv", 
  header = TRUE,
  sep=";")
