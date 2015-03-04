#install.packages(c("irr","psych"))

library(foreign)
library(irr)

FT <- read.arff("../weka-files/output/classification/FT.output.arff")

predictedoverallFT <- FT[,13]
overallFT <- FT[,14]

kappa2(FT[,13:14], "unweighted")

kappa2(FT[,13:14], "unweighted")["value"]
