require(likert)
require(reshape2)
require(ggplot2)
require(scales)
require(grid)
require(plyr)
require(dplyr)


load("surveyData.RData")

survey_responses = c("nenhuma influência","pouca influência","influência considerável","muita influência")
likert_levels = c("no influence","few influence","considerable influence","high influence")

fossAdoption.environment.data <- data[,31:36]

fossAdoption.environment.data$G4_Q0001_1 <- mapvalues(fossAdoption.environment.data$G4_Q0001_1, from = survey_responses, to = likert_levels)
fossAdoption.environment.data$G4_Q0001_2 <- mapvalues(fossAdoption.environment.data$G4_Q0001_2, from = survey_responses, to = likert_levels)
fossAdoption.environment.data$G4_Q0001_3 <- mapvalues(fossAdoption.environment.data$G4_Q0001_3, from = survey_responses, to = likert_levels)
fossAdoption.environment.data$G4_Q0001_4 <- mapvalues(fossAdoption.environment.data$G4_Q0001_4, from = survey_responses, to = likert_levels)
fossAdoption.environment.data$G4_Q0001_5 <- mapvalues(fossAdoption.environment.data$G4_Q0001_5, from = survey_responses, to = likert_levels)
fossAdoption.environment.data$G4_Q0001_6 <- mapvalues(fossAdoption.environment.data$G4_Q0001_6, from = survey_responses, to = likert_levels)


names(fossAdoption.environment.data) <- c(
  G4_Q0001_1="Market conditions software (cost, reliability, use by other competing companies, etc.)",
  G4_Q0001_2="Market conditions of an organization (financial strength, the team size, geographical distribution, etc.)",
  G4_Q0001_3="Government incentives for the use of FOSS",
  G4_Q0001_4="Negative marketing by the proprietary software vendors",
  G4_Q0001_5="Availability of external experts and support services to the organization",
  G4_Q0001_6="Existence of a success in the market"  
)

fossAdoption.environment.likert <- likert(fossAdoption.environment.data)

summary(fossAdoption.environment.likert)
#summary(l24, center=1.5)
#summary(l24, center=2)

#xtable(l24)


# Plots
fossAdoption.environment.plot <- plot(
    fossAdoption.environment.likert, 
    colors=c('#AA1111','#BB6666','#66BB66','#11AA11'), 
    legend = "Responses",
    legend.position = "bottom")
fossAdoption.environment.plot
ggsave(fossAdoption.environment.plot, file="pictures/08-fator-mercadologico-stacked.png")

# fossAdoption.environment.plot <- plot(fossAdoption.environment.likert, ordered=FALSE, group.order=names(fossAdoption.environment.data)) #Specify the exact order of the y-axis
# fossAdoption.environment.plot
# 
# fossAdoption.environment.plot <- plot(fossAdoption.environment.likert, centered=FALSE, wrap=30)
# fossAdoption.environment.plot
# 
# fossAdoption.environment.plot <- plot(fossAdoption.environment.likert, center=1.5, wrap=30)
# fossAdoption.environment.plot
# 
# fossAdoption.environment.plot <- plot(fossAdoption.environment.likert, center=2, wrap=30)
# fossAdoption.environment.plot
# 
# fossAdoption.environment.plot <- plot(fossAdoption.environment.likert, center=2, include.center=FALSE, wrap=30)
# fossAdoption.environment.plot
# 
# fossAdoption.environment.plot <- plot(fossAdoption.environment.likert, center=2, include.center=FALSE, wrap=20)
# fossAdoption.environment.plot
# 
# fossAdoption.environment.plot <- plot(fossAdoption.environment.likert, plot.percents=TRUE, plot.percent.low=FALSE, plot.percent.high=FALSE)
# fossAdoption.environment.plot
# 
# fossAdoption.environment.plot <- plot(fossAdoption.environment.likert, colors=c('orange','darkorange','darkblue','blue'))
# fossAdoption.environment.plot
# 
# #Include histogram with response counts
# fossAdoption.environment.plot <- plot(fossAdoption.environment.likert, include.histogram=TRUE)
# fossAdoption.environment.plot
# 
# # Density plot
# fossAdoption.environment.plot <- plot(fossAdoption.environment.likert, type='density')
# fossAdoption.environment.plot
# 
# fossAdoption.environment.plot <- plot(fossAdoption.environment.likert, type='density', facet=FALSE)
# fossAdoption.environment.plot
# 
# 
# # Heat map
# fossAdoption.environment.plot <- plot(fossAdoption.environment.likert, type='heat', wrap=30, text.size=4)
# fossAdoption.environment.plot