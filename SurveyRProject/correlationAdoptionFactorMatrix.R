#install.packages(c("lattice", "ellipse"))
library(lattice)
library(ellipse)


escala_labels <- c("nenhuma influ�ncia","pouca influ�ncia","influ�ncia consider�vel","muita influ�ncia")

fatores_labels <- c(
    "Facilidade de testar e de ser avaliado por usu�rios de um modo geral",
    "Utiliza��o de modelos de desenvolvimento e de qualidade bem definidos por parte do fabricante",
    "Compatibilidade com a infraestrutura existente, com os requisitos/necessidades/demandas, e/ou com a tecnologia em vigor",
    "Facilidade de entender, utilizar e/ou adaptar",
    "Vantagem(ns) em rela��o a custos com hardware, requisitos m�nimos menos exigentes, custos com licen�a ou suporte, etc",
    "Maior efici�ncia em rela��o � solu��o, livre ou n�o, utilizada atualmente",
    "Maior confiabilidade em rela��o � solu��o, livre ou n�o, utilizada atualmente",
    "Disponibilidade de recursos para pesquisa/estudo das solu��es que fa�am uso de software livre",
    "Custo Total de Propriedade do Software (envolve benef�cios/desvantagens t�cnicas e de neg�cio)",
    "Relev�ncia do Software para a Organiza��o",
    "Experi�ncia dos membros da equipe com uso/customiza��o de software livre",
    "Apoio � dissemina��o e uso de software livre por parte da alta ger�ncia",
    "Condi��es de mercado do softwaren (custo, confiabilidade, uso por outras companhias concorrentes, dentre outros)",
    "Condi��es de mercado de uma organiza��o (f�lego financeiro, tamanho das equipes, distribui��o geogr�fica, dentre outros)",
    "Incentivo do governo para uso de software livre",
    "Marketing negativo por parte dos vendedores de software propriet�rio",
    "Disponibilidade de especialistas e servi�os de suporte externos � organiza��o",
    "Exist�ncia de um caso de sucesso no mercado",
    "Perfil para pesquisa de solu��es em software livre",  
    "Certeza na escolha de uma solu��o de software livre como a mais adequada para o problema em quest�o",  
    "Ado��o pr�via de um software livre com sucesso",  
    "Exist�ncia de algum caso de sucesso entre pessoas do c�rculo de contatos",  
    "Aspectos pol�ticos e/ou ideol�gicos"
  )


tamanho <- 100 # O limite de caracteres (ele vai quebrar no espa�o anterior a palavra que ultrapassa o limite)
(fatores_labels <- strwrap(fatores_labels, tamanho, simplify=F)) # Cria uma lista onde cada elemento � um vetor com at� 40 caracteres. 
(fatores_labels <- mapply(paste, fatores_labels, collapse='\n')) # Monta o vetor com as labels.


fatores_dados <- 
    cbind(
      table(as.numeric(data[,17])),
      table(as.numeric(data[,18])),
      table(as.numeric(data[,19])),
      table(as.numeric(data[,20])),
      table(as.numeric(data[,21])),
      table(as.numeric(data[,22])),
      table(as.numeric(data[,23])),
      table(as.numeric(data[,25])),
      table(as.numeric(data[,26])),
      table(as.numeric(data[,27])),
      table(as.numeric(data[,28])),
      table(as.numeric(data[,29])),
      table(as.numeric(data[,31])),
      table(as.numeric(data[,32])),
      table(as.numeric(data[,33])),
      table(as.numeric(data[,34])),
      table(as.numeric(data[,35])),
      table(as.numeric(data[,36])),
      table(as.numeric(data[,38])),
      table(as.numeric(data[,39])),
      table(as.numeric(data[,40])),
      table(as.numeric(data[,41])),
      table(as.numeric(data[,42]))
    )

#usage of my.plotcorr
#much like the my.plotcorr function, this is modified from the plotcorr documentation
#this function requires the ellipse library, though, once installed you don't need to load it - it is loaded in the function
#install.packages(c('ellipse'))
#library(ellipse)
source('my-plotcorr-function.R')
# Get some data
#data(fatores)
# Get the correlation matrix
corr.fatores <- cor(fatores_dados, method="spearman")
# Change the column and row names for clarity
#colnames(corr.fatores) = fatores_labels
rownames(corr.fatores) <- fatores_labels
#rownames(corr.fatores) = colnames(corr.fatores)

# Standard plot, all ellipses are grey, nothing is put in the diagonal
#my.plotcorr(corr.fatores)

# Here we play around with the colors, colors are selected from a list with colors recycled
# Thus to map correlations to colors we need to make a list of suitable colors
# To start, pick the end (and mid) points of a scale, here a red to white to blue for neg to none to pos correlation
colsc=c(rgb(241, 54, 23, maxColorValue=255), 'white', rgb(0, 61, 104, maxColorValue=255))

# Build a ramp function to interpolate along the scale, I've opted for the Lab interpolation rather than the default rgb, check the documentation about the differences
colramp = colorRampPalette(colsc, space='Lab')

# I'll show two types of color styles using this color ramp
# the first
# Use the same number of colors along the scale for the number of variables
colors = colramp(length(corr.fatores[1,]))

# then plot an example with only ellipses, without a diagonal and with a main title
# the color selection stuff here multiplies the correlations such that they can index individual colors and create a sufficiently large list
# incase you are confused, r allows vector indexing with non-integers by rounding down, i.e. colors[1.8] == colors[1]
#my.plotcorr(corr.fatores, col=colors[5*corr.fatores + 6], main='Predictor correlations')

# the second form
# we could, alternatively, make a scale with 100 points
colors = colramp(100)
# then pick colors along this 100 point scale given the correlation value * 100 rounded down to the nearest integer
# to do that we need to move the correlation range from [-1, 1] to [0, 100]
# now plot again with ellipses along the diagonal
#my.plotcorr(corr.fatores, col=colors[((corr.fatores + 1)/2) * 100], diag='ellipse', main='Predictor correlations')

# or, add numbers to the bottom of the chart
#my.plotcorr(corr.fatores, col=colors[((corr.fatores + 1)/2) * 100], diag='ellipse', lower.panel="number", main='Predictor correlations')

# or, switch the numbers and ellipses and reduce the margins



my.plotcorr(
    corr.fatores,     
    col=colors[((corr.fatores + 1)/2) * 100], 
    diag='none',    
    cex=0.25,
    pty="m",
    cex.lab=0.25,
    upper.panel='number', 
    lower.panel='ellipse',
    mar=c(0,0,0,0))


#dev.copy(png,"pictures/correlacao-fatores.png", width=861, height=545, units = "px")
#dev.off()

dev.copy(pdf,file="pictures/correlacao-fatores.pdf", paper="a4r", compress=TRUE, pointsize=72)
dev.off()


# or, drop the diagonal and numbers
my.plotcorr(corr.fatores, col=colors[((corr.fatores + 1)/2) * 100], upper.panel="none", mar=c(0,2,0,0), main='Predictor correlations')