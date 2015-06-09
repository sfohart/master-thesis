#lendo dados do projeto
itemBased <- read.table(
  "data/Avaliação Offline - Projetos Visualizados.csv", 
  header = TRUE,
  sep=";")

contentBased <- read.table(
  "data/Avaliação Offline - Projetos Similares.csv", 
  header = TRUE,
  sep=";")
