library(foreign)

SMO <- read.arff("../weka-files/output/regression/SMO.output.arff")

predictedoverallSMO <- SMO[,13]
overallSMO <- SMO[,14]

correlationSMO <- cor.test(
  overallSMO, 
  predictedoverallSMO, 
  method="pearson",
  alternative="two.sided",
  continuity=true)

correlationSMO
