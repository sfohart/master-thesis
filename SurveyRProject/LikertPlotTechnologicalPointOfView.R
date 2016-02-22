require(likert)
require(reshape2)
require(ggplot2)
require(scales)
require(grid)
require(plyr)
require(dplyr)


load("surveyData.RData")

survey_responses = c("nenhuma influência","pouca influência","influência considerável","muita influência")
likert_levels = c("no influence","little influence","considerable influence","much influence")

fossAdoption.technological.data <- data[,17:23]

fossAdoption.technological.data$G2_Q0001_1 <- mapvalues(fossAdoption.technological.data$G2_Q0001_1, from = survey_responses, to = likert_levels)
fossAdoption.technological.data$G2_Q0001_2 <- mapvalues(fossAdoption.technological.data$G2_Q0001_2, from = survey_responses, to = likert_levels)
fossAdoption.technological.data$G2_Q0001_3 <- mapvalues(fossAdoption.technological.data$G2_Q0001_3, from = survey_responses, to = likert_levels)
fossAdoption.technological.data$G2_Q0001_4 <- mapvalues(fossAdoption.technological.data$G2_Q0001_4, from = survey_responses, to = likert_levels)
fossAdoption.technological.data$G2_Q0001_5 <- mapvalues(fossAdoption.technological.data$G2_Q0001_5, from = survey_responses, to = likert_levels)
fossAdoption.technological.data$G2_Q0001_6 <- mapvalues(fossAdoption.technological.data$G2_Q0001_6, from = survey_responses, to = likert_levels)
fossAdoption.technological.data$G2_Q0001_7 <- mapvalues(fossAdoption.technological.data$G2_Q0001_7, from = survey_responses, to = likert_levels)


names(fossAdoption.technological.data) <- c(
  G2_Q0001_1="Ease of testing and be rated by users in general",
  G2_Q0001_2="Use of development and quality well-defined by the manufacturer",
  G2_Q0001_3="Compatibility with existing infrastructure with the requirements / needs / demands, and/or technology in place",
  G2_Q0001_4="Easy to understand, use and/or adapt",
  G2_Q0001_5="Advantages over hardware costs, minimum requirements less demanding, cost of license or support, etc.",
  G2_Q0001_6="Increased efficiency in relation to the solution, free or not, currently used",
  G2_Q0001_7="Increased reliability with respect to the solution, free or not, currently used"  
)

fossAdoption.technological.likert <- likert(fossAdoption.technological.data)

summary(fossAdoption.technological.likert)
#summary(l24, center=1.5)
#summary(l24, center=2)

#xtable(fossAdoption.technological.likert, digits = 2)


# Plots
fossAdoption.technological.plot <- plot(
  fossAdoption.technological.likert, 
  colors=c('#AA1111','#BB6666','#66BB66','#11AA11'), 
  legend = "Responses",
  legend.position = "bottom")
fossAdoption.technological.plot
ggsave(fossAdoption.technological.plot, file="pictures/06-fator-tecnologico-stacked.png")

# fossAdoption.technological.plot <- plot(fossAdoption.technological.likert, ordered=FALSE, group.order=names(fossAdoption.technological.data)) #Specify the exact order of the y-axis
# fossAdoption.technological.plot
# 
# fossAdoption.technological.plot <- plot(fossAdoption.technological.likert, centered=FALSE, wrap=30)
# fossAdoption.technological.plot
# 
# fossAdoption.technological.plot <- plot(fossAdoption.technological.likert, center=1.5, wrap=30)
# fossAdoption.technological.plot
# 
# fossAdoption.technological.plot <- plot(fossAdoption.technological.likert, center=2, wrap=30)
# fossAdoption.technological.plot
# 
# fossAdoption.technological.plot <- plot(fossAdoption.technological.likert, center=2, include.center=FALSE, wrap=30)
# fossAdoption.technological.plot
# 
# fossAdoption.technological.plot <- plot(fossAdoption.technological.likert, center=2, include.center=FALSE, wrap=20)
# fossAdoption.technological.plot
# 
# fossAdoption.technological.plot <- plot(fossAdoption.technological.likert, plot.percents=TRUE, plot.percent.low=FALSE, plot.percent.high=FALSE)
# fossAdoption.technological.plot
# 
# fossAdoption.technological.plot <- plot(fossAdoption.technological.likert, colors=c('orange','darkorange','darkblue','blue'))
# fossAdoption.technological.plot
# 
# #Include histogram with response counts
# fossAdoption.technological.plot <- plot(fossAdoption.technological.likert, include.histogram=TRUE)
# fossAdoption.technological.plot
# 
# # Density plot
# fossAdoption.technological.plot <- plot(fossAdoption.technological.likert, type='density')
# fossAdoption.technological.plot
# 
# fossAdoption.technological.plot <- plot(fossAdoption.technological.likert, type='density', facet=FALSE)
# fossAdoption.technological.plot
# 
# 
# # Heat map
# fossAdoption.technological.plot <- plot(fossAdoption.technological.likert, type='heat', wrap=30, text.size=4)
# fossAdoption.technological.plot