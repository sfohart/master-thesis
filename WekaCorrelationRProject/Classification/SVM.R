#install.packages(c("irr","psych"))

library(foreign)
library(irr)

SVM <- read.arff("../weka-files/output/classification/SVM.output.arff")

predictedoverallSVM <- SVM[,13]
overallSVM <- SVM[,14]

kappa2(SVM[,13:14], "unweighted")

kappa2(SVM[,13:14], "unweighted")["value"]
