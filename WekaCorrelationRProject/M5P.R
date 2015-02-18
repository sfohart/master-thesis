library(foreign)

M5P <- read.arff("../weka-files/output/regression/M5P.output.arff")

predictedoverallM5P <- M5P[,13]
overallM5P <- M5P[,14]

correlationM5P <- cor.test(
  overallM5P, 
  predictedoverallM5P, 
  method="pearson",
  alternative="two.sided",
  continuity=true)

correlationM5P
