#Você utiliza software livre?
library(graphics)
usa_floss <- data[,8]
table(usa_floss)


usa_floss_grafico <- barplot(
    table(usa_floss[-1]), 
    main="Você utiliza software livre?",
    names.arg = c("Sim","Não"),
    col=c("darkgreen","red"),
    cex.axis = 0.7,
    cex.names = 0.7,
    cex.main = 0.8,
    ylim=c(0,170),
    ylab="Total")


text(
  usa_floss_grafico, 
  table(usa_floss[-1]), 
  labels = format(table(usa_floss[-1]), 4),
  pos = 3, 
  cex = .55)

dev.copy(png,"pictures/01-uso-floss.png", width=861, height=545, units = "px")
dev.off()