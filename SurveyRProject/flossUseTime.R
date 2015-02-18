tempo_uso <- cbind( table( as.numeric(data[,15]) ) )

#par(mfrow=c(1,1))

tempo_uso_grafico <- 
  barplot (
    tempo_uso,
    space = c(0, 0.25, 0.25, 0.25, 0.25, 0.25),
    beside = TRUE,
    cex.axis = 0.7,
    cex.names = 0.7,
    cex.main = 0.9,
    ylim=c(0,60),
    main="Há quanto tempo você utiliza software livre?",
    col=rainbow(6),
    args.legend = list(x = 7, y = 0, bty="n", cex = 0.8, ncol=2),
    legend.text = c("Utilizo há menos de 6 meses",
                    "Utilizo entre 6 meses e 1 ano",
                    "Utilizo entre 1 e 2 anos",
                    "Utilizo entre 3 e 5 anos",
                    "Utilizo entre 5 e 10 anos",
                    "Utilizo há mais de 10 anos")
  )

text(
  tempo_uso_grafico, 
  tempo_uso, 
  labels = format(tempo_uso, 4),
  pos = 3, 
  cex = .7)

dev.copy(png,"pictures/05-tempo-uso-floss.png", width=861, height=545, units = "px")
dev.off()