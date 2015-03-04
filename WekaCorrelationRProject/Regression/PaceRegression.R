library(foreign)

PaceRegression <- read.arff("../weka-files/output/regression/PaceRegression.output.arff")

predictedoverallPaceRegression <- PaceRegression[,13]
overallPaceRegression <- PaceRegression[,14]

correlationPaceRegression <- cor.test(
  overallPaceRegression, 
  predictedoverallPaceRegression, 
  method="pearson",
  alternative="two.sided",
  continuity=true)

correlationPaceRegression
