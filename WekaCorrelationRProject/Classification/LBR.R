#install.packages(c("irr","psych"))

library(foreign)
library(irr)

LBR <- read.arff("../weka-files/output/classification/LBR.output.arff")

predictedoverallLBR <- LBR[,13]
overallLBR <- LBR[,14]

kappa2(LBR[,13:14], "unweighted")

kappa2(LBR[,13:14], "unweighted")["value"]
