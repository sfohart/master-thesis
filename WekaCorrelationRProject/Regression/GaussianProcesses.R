library(foreign)

GaussianProcesses <- read.arff("../weka-files/output/regression/GaussianProcesses.output.arff")

predictedoverallGaussianProcesses <- GaussianProcesses[,13]
overallGaussianProcesses <- GaussianProcesses[,14]

correlationGaussianProcesses <- cor.test(
  overallGaussianProcesses, 
  predictedoverallGaussianProcesses, 
  method="pearson",
  alternative="two.sided",
  continuity=true)

correlationGaussianProcesses
