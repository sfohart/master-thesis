#install.packages(c("irr","psych"))

library(foreign)
library(irr)

SMO <- read.arff("../weka-files/output/classification/SMO.output.arff")

predictedoverallSMO <- SMO[,13]
overallSMO <- SMO[,14]

kappa2(SMO[,13:14], "unweighted")

kappa2(SMO[,13:14], "unweighted")["value"]
