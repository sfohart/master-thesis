experiencia_programacao <- cbind( table( as.numeric(data[,14]) ) )

#par(mfrow=c(1,1))

experiencia_programacao_grafico <- 
  barplot (
    experiencia_programacao,
    space = c(0, 0.25, 0.25, 0.25),
    beside = TRUE,
    cex.axis = 0.7,
    cex.names = 0.7,
    cex.main = 0.9,
    offset = 1.5,
    ylim=c(0,50),
    main="Você possui experiência em programação\n de/com software de código aberto?",
    col=rainbow(4),
    args.legend = list(x = 4, y = 0, bty="n", cex = 0.8),
    legend.text = c("Nunca desenvolvi software de código aberto, nem utilizei componentes de código aberto",
                    "Já desenvolvi soluções proprietárias utilizando componentes de código aberto",
                    "Já desenvolvi software de código aberto com domínio específico",
                    "Já contribuí dando manutenção em projetos de código aberto")
  )

text(
  experiencia_programacao_grafico, 
  experiencia_programacao, 
  labels = format(experiencia_programacao, 4),
  pos = 3, 
  cex = .55)

dev.copy(png,"pictures/04-experiencia-programacao.png", width=861, height=545, units = "px")
dev.off()