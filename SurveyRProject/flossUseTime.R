#install.packages("dplyr")
load("surveyData.RData")


tempo.uso.labels <- c("há menos de 6 meses",
                      "entre 6 meses e 1 ano",
                      "entre 1 e 2 anos",
                      "entre 3 e 5 anos",
                      "entre 5 e 10 anos",
                      "há mais de 10 anos")

# Quebrando o texto automaticamente (Só tirei os \n do vetor de cima e acrescentei as 3 linhas abaixo)
# tamanho <- 20 # O limite de caracteres (ele vai quebrar no espaço anterior a palavra que ultrapassa o limite)
# (tempo.uso.labels <- strwrap(tempo.uso.labels, tamanho, simplify=F)) # Cria uma lista onde cada elemento é um vetor com até 40 caracteres. 
# (tempo.uso.labels <- mapply(paste, tempo.uso.labels, collapse='\n')) # Monta o vetor com as labels.


tempo.uso <- cbind( table( as.numeric(data[,15]) ) )

par(mfrow=c(1,1))

tempo.uso.percentagem <- apply(
  tempo.uso,
  2,
  function(x) sprintf("%d\n(%.2f%%)", x, x * 100 / 152)
)

tempo.uso.grafico <- 
  barplot (
    tempo.uso,
    space = c(0, 0.25, 0.25, 0.25, 0.25, 0.25),
    beside = TRUE,
    cex.axis = 0.7,
    cex.names = 0.7,
    cex.main = 0.9,
    ylim=c(0,80),
    main="Há quanto tempo você utiliza software livre?",
    col=rainbow(6),
    args.legend = list(x = 4, bty = "n", cex = 0.8, ncol=2, adj = c(0, .6)),
    legend.text = tempo.uso.labels
  )

text(
  tempo.uso.grafico, 
  tempo.uso, 
  labels = format(tempo.uso.percentagem, 4),
  pos = 3, 
  cex = .7)

dev.copy(png,"pictures/05-tempo-uso-floss.png", width=1024, height=618, units = "px")
dev.off()