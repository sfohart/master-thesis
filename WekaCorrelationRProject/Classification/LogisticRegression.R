#install.packages(c("irr","psych"))

library(foreign)
library(irr)

LogisticRegression <- read.arff("../weka-files/output/classification/LogisticRegression.output.arff")

predictedoverallLogisticRegression <- LogisticRegression[,13]
overallLogisticRegression <- LogisticRegression[,14]

kappa2(LogisticRegression[,13:14], "unweighted")

kappa2(LogisticRegression[,13:14], "unweighted")["value"]
