#lendo dados do projeto
itemBased <- read.table(
  "data/Avaliação Offline - Projetos Visualizados.csv", 
  header = TRUE,
  sep=";")

contentBased <- read.table(
  "data/Avaliação Offline - Projetos Similares - Quantitativo.csv", 
  header = TRUE,
  sep=";")

multicriteriaRecommendationPrediction <- read.table(
  "data/Recomendação Multicritério - Função de Agregação.csv", 
  header = TRUE,
  sep=";")


multicriteriaRecommendationLists <- read.table(
  "data/Recomendação Multicritério - Listas Concatenadas.csv", 
  header = TRUE,
  sep=";")