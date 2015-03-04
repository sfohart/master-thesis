#install.packages(c("irr","psych"))

library(foreign)
library(irr)

AODE <- read.arff("../weka-files/output/classification/AODE.output.arff")

predictedoverallAODE <- AODE[,13]
overallAODE <- AODE[,14]

kappa2(AODE[,13:14], "unweighted")

kappa2(AODE[,13:14], "unweighted")["value"]
