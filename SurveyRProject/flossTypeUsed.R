A <- table(as.numeric(data[,9]))
B <- table(as.numeric(data[,10]))
C <- table(as.numeric(data[,11]))
D <- table(as.numeric(data[,12]))


floss_type <- cbind(A,B,C,D)
rm(A,B,C,D)

par(mfrow=c(1,1))

floss_type_graph <- barplot(
    floss_type,
    beside = TRUE,
    ylim=c(0,150),
    cex.axis = 0.8,
    cex.names = 1.0,
    offset = 1.5,
    legend.text = c("Sim","Não"),
    args.legend = list(x = 10, y=160, bty="n", cex = 0.8),
    col=c("darkgreen","red"),
    cex.main = 0.9,
    main="Que tipo de software livre você utiliza?",
    names.arg = c(
        "Software de\n Sistema",
        "Ferramentas de\n Programação",
        "Software de\n Uso Geral",
        "Software de\n Uso Específico")
  )


text(
    floss_type_graph, 
    floss_type, 
    labels = format(floss_type, 4),
    pos = 3, 
    cex = .7)


dev.copy(png,"pictures/02-tipo-floss-utilizado.png", width=861, height=545, units = "px")
dev.off()
