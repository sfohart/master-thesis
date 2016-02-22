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

fossAdoption.individual.data <- data[,38:42]

fossAdoption.individual.data$G5_Q0001_1 <- mapvalues(fossAdoption.individual.data$G5_Q0001_1, from = survey_responses, to = likert_levels)
fossAdoption.individual.data$G5_Q0001_2 <- mapvalues(fossAdoption.individual.data$G5_Q0001_2, from = survey_responses, to = likert_levels)
fossAdoption.individual.data$G5_Q0001_3 <- mapvalues(fossAdoption.individual.data$G5_Q0001_3, from = survey_responses, to = likert_levels)
fossAdoption.individual.data$G5_Q0001_4 <- mapvalues(fossAdoption.individual.data$G5_Q0001_4, from = survey_responses, to = likert_levels)
fossAdoption.individual.data$G5_Q0001_5 <- mapvalues(fossAdoption.individual.data$G5_Q0001_5, from = survey_responses, to = likert_levels)



names(fossAdoption.individual.data) <- c(
  G5_Q0001_1="Profile search for solutions in FOSS",  
  G5_Q0001_2="Certainty in choosing an FOSS solution as the most suitable for the problem at hand",  
  G5_Q0001_3="Prior adoption of FOSS successfully",  
  G5_Q0001_4="Existence of some success between people of the circle of contacts",  
  G5_Q0001_5="Political aspects and / or ideological" 
)

fossAdoption.individual.likert <- likert(fossAdoption.individual.data)

summary(fossAdoption.individual.likert)
#summary(l24, center=1.5)
#summary(l24, center=2)

#xtable(l24)


# Plots
fossAdoption.individual.plot <- plot(
    fossAdoption.individual.likert, 
    colors=c('#AA1111','#BB6666','#66BB66','#11AA11'), 
    legend = "Responses",
    legend.position = "bottom")
fossAdoption.individual.plot
ggsave(fossAdoption.individual.plot, file="pictures/09-fator-individual-stacked.png")

# fossAdoption.individual.plot <- plot(fossAdoption.individual.likert, ordered=FALSE, group.order=names(fossAdoption.individual.data)) #Specify the exact order of the y-axis
# fossAdoption.individual.plot
# 
# fossAdoption.individual.plot <- plot(fossAdoption.individual.likert, centered=FALSE, wrap=30)
# fossAdoption.individual.plot
# 
# fossAdoption.individual.plot <- plot(fossAdoption.individual.likert, center=1.5, wrap=30)
# fossAdoption.individual.plot
# 
# fossAdoption.individual.plot <- plot(fossAdoption.individual.likert, center=2, wrap=30)
# fossAdoption.individual.plot
# 
# fossAdoption.individual.plot <- plot(fossAdoption.individual.likert, center=2, include.center=FALSE, wrap=30)
# fossAdoption.individual.plot
# 
# fossAdoption.individual.plot <- plot(fossAdoption.individual.likert, center=2, include.center=FALSE, wrap=20)
# fossAdoption.individual.plot
# 
# fossAdoption.individual.plot <- plot(fossAdoption.individual.likert, plot.percents=TRUE, plot.percent.low=FALSE, plot.percent.high=FALSE)
# fossAdoption.individual.plot
# 
# fossAdoption.individual.plot <- plot(fossAdoption.individual.likert, colors=c('orange','darkorange','darkblue','blue'))
# fossAdoption.individual.plot
# 
# #Include histogram with response counts
# fossAdoption.individual.plot <- plot(fossAdoption.individual.likert, include.histogram=TRUE)
# fossAdoption.individual.plot
# 
# # Density plot
# fossAdoption.individual.plot <- plot(fossAdoption.individual.likert, type='density')
# fossAdoption.individual.plot
# 
# fossAdoption.individual.plot <- plot(fossAdoption.individual.likert, type='density', facet=FALSE)
# fossAdoption.individual.plot
# 
# 
# # Heat map
# fossAdoption.individual.plot <- plot(fossAdoption.individual.likert, type='heat', wrap=30, text.size=4)
# fossAdoption.individual.plot