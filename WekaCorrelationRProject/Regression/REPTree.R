library(foreign)

REPTree <- read.arff("../weka-files/output/regression/REPTree.output.arff")

predictedoverallREPTree <- REPTree[,13]
overallREPTree <- REPTree[,14]

correlationREPTree <- cor.test(
  overallREPTree, 
  predictedoverallREPTree, 
  method="pearson",
  alternative="two.sided",
  continuity=true)

correlationREPTree
