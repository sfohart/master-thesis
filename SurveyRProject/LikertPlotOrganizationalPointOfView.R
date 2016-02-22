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

fossAdoption.organizational.data <- data[,25:29] 
  
fossAdoption.organizational.data$G3_Q0001_1 <- mapvalues(fossAdoption.organizational.data$G3_Q0001_1, from = survey_responses, to = likert_levels)
fossAdoption.organizational.data$G3_Q0001_2 <- mapvalues(fossAdoption.organizational.data$G3_Q0001_2, from = survey_responses, to = likert_levels)
fossAdoption.organizational.data$G3_Q0001_3 <- mapvalues(fossAdoption.organizational.data$G3_Q0001_3, from = survey_responses, to = likert_levels)
fossAdoption.organizational.data$G3_Q0001_4 <- mapvalues(fossAdoption.organizational.data$G3_Q0001_4, from = survey_responses, to = likert_levels)
fossAdoption.organizational.data$G3_Q0001_5 <- mapvalues(fossAdoption.organizational.data$G3_Q0001_5, from = survey_responses, to = likert_levels)


names(fossAdoption.organizational.data) <- c(
  G3_Q0001_1="Availability of resources for research / study of solutions that make use of FOSS",
  G3_Q0001_2="Total Cost of Ownership",
  G3_Q0001_3="Software's Relevance for the Organization",
  G3_Q0001_4="Experience of team members to use / customizing FOSS",
  G3_Q0001_5="Support for the dissemination and use of FOSS by the top management" 
)

fossAdoption.organizational.likert <- likert(fossAdoption.organizational.data)

summary(fossAdoption.organizational.likert)
#summary(l24, center=1.5)
#summary(l24, center=2)

#xtable(l24)


# Plots
fossAdoption.organizational.plot <- plot(
  fossAdoption.organizational.likert, 
  colors=c('#AA1111','#BB6666','#66BB66','#11AA11'), 
  legend = "Responses",
  legend.position = "bottom")
fossAdoption.organizational.plot
ggsave(fossAdoption.organizational.plot, file="pictures/07-fator-organizacional-stacked.png")

# fossAdoption.organizational.plot <- plot(fossAdoption.organizational.likert, ordered=FALSE, group.order=names(fossAdoption.organizational.data)) #Specify the exact order of the y-axis
# fossAdoption.organizational.plot
# 
# fossAdoption.organizational.plot <- plot(fossAdoption.organizational.likert, centered=FALSE, wrap=30)
# fossAdoption.organizational.plot
# 
# fossAdoption.organizational.plot <- plot(fossAdoption.organizational.likert, center=1.5, wrap=30)
# fossAdoption.organizational.plot
# 
# fossAdoption.organizational.plot <- plot(fossAdoption.organizational.likert, center=2, wrap=30)
# fossAdoption.organizational.plot
# 
# fossAdoption.organizational.plot <- plot(fossAdoption.organizational.likert, center=2, include.center=FALSE, wrap=30)
# fossAdoption.organizational.plot
# 
# fossAdoption.organizational.plot <- plot(fossAdoption.organizational.likert, center=2, include.center=FALSE, wrap=20)
# fossAdoption.organizational.plot
# 
# fossAdoption.organizational.plot <- plot(fossAdoption.organizational.likert, plot.percents=TRUE, plot.percent.low=FALSE, plot.percent.high=FALSE)
# fossAdoption.organizational.plot
# 
# fossAdoption.organizational.plot <- plot(fossAdoption.organizational.likert, colors=c('orange','darkorange','darkblue','blue'))
# fossAdoption.organizational.plot
# 
# #Include histogram with response counts
# fossAdoption.organizational.plot <- plot(fossAdoption.organizational.likert, include.histogram=TRUE)
# fossAdoption.organizational.plot
# 
# # Density plot
# fossAdoption.organizational.plot <- plot(fossAdoption.organizational.likert, type='density')
# fossAdoption.organizational.plot
# 
# fossAdoption.organizational.plot <- plot(fossAdoption.organizational.likert, type='density', facet=FALSE)
# fossAdoption.organizational.plot
# 
# 
# # Heat map
# fossAdoption.organizational.plot <- plot(fossAdoption.organizational.likert, type='heat', wrap=30, text.size=4)
# fossAdoption.organizational.plot