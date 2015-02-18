experiencia_manutencao <- cbind( table( as.numeric(data[,13]) ) )

#par(mfrow=c(1,1))

experiencia_manutencao_grafico <- 
    barplot (
        experiencia_manutencao,
        space = c(0,0.5,0.5),
        beside = TRUE,
        cex.axis = 0.7,
        cex.names = 0.7,
        cex.main = 0.7,
        ylim=c(0,80),
        main="Você possui experiência em manter serviços\n de TI utilizando software livre?",
        col=rainbow(3),
        args.legend = list(x = 3, y = 0, bty="n", cex = 0.8),
        legend.text = c(
            "Nunca mantive serviços de TI com software de código aberto",
            "Já implantei serviços de TI com software de código aberto",
            "Já customizei serviços de TI de código aberto")
        )

text(
    experiencia_manutencao_grafico, 
    experiencia_manutencao, 
    labels = format(experiencia_manutencao, 4),
    pos = 3, 
    cex = .55)


dev.copy(png,"pictures/03-experiencia-manutencao.png", width=600, height=400, units = "px")
dev.off()