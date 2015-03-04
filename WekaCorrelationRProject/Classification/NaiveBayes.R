#install.packages(c("irr","psych"))

library(foreign)
library(irr)

NaiveBayes <- read.arff("../weka-files/output/classification/NaiveBayes.output.arff")

predictedoverallNaiveBayes <- NaiveBayes[,13]
overallNaiveBayes <- NaiveBayes[,14]

kappa2(NaiveBayes[,13:14], "unweighted")

kappa2(NaiveBayes[,13:14], "unweighted")["value"]
