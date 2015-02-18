library(foreign)

LinearRegression <- read.arff("../weka-files/output/regression/LinearRegression.output.arff")

predictedoverallLinearRegression <- LinearRegression[,13]
overallLinearRegression <- LinearRegression[,14]

correlationLinearRegression <- cor.test(
  overallLinearRegression, 
  predictedoverallLinearRegression, 
  method="pearson",
  alternative="two.sided",
  continuity=true)

correlationLinearRegression
