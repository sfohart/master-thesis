data <- read.table("survey_757858_R_data_file.csv", sep=",", quote = "'", na.strings=c("","\"\""), stringsAsFactors=FALSE)

data[, 1] <- as.numeric(data[, 1])
attributes(data)$variable.labels[1] <- "id"
names(data)[1] <- "id"

data[, 2] <- as.character(data[, 2])
attributes(data)$variable.labels[2] <- "submitdate"
names(data)[2] <- "submitdate"

#Field hidden

data[, 3] <- as.character(data[, 3])
attributes(data)$variable.labels[3] <- "startlanguage"
names(data)[3] <- "startlanguage"

data[, 4] <- as.character(data[, 4])
attributes(data)$variable.labels[4] <- "token"
names(data)[4] <- "token"

data[, 5] <- as.character(data[, 5])
attributes(data)$variable.labels[5] <- "datestamp"
names(data)[5] <- "datestamp"

data[, 6] <- as.character(data[, 6])
attributes(data)$variable.labels[6] <- "startdate"
names(data)[6] <- "startdate"

data[, 7] <- as.character(data[, 7])
attributes(data)$variable.labels[7] <- "ipaddr"
names(data)[7] <- "ipaddr"

data[, 8] <- as.numeric(data[, 8])
attributes(data)$variable.labels[8] <- "Você utiliza software livre?"
data[, 8] <- factor(data[, 8], levels=c(1,2),labels=c("Yes","No"))
names(data)[8] <- "G1_Q0001"

data[, 9] <- as.numeric(data[, 9])
attributes(data)$variable.labels[9] <- "[Software de Sistema (sistemas operacionais, servidores, utilitários, drivers de equipamentos, ferramentas de diagnóstico, etc)] 
Que tipo de software livre você utiliza?"
data[, 9] <- factor(data[, 9], levels=c(1,0),labels=c("Yes","Not Selected"))
names(data)[9] <- "G1_Q0002_SQ001"

data[, 10] <- as.numeric(data[, 10])
attributes(data)$variable.labels[10] <- "[Ferramentas de Programação (compiladores, IDE\'s, depuradores, interpretadores, linkadores, etc)] 
Que tipo de software livre você utiliza?"
data[, 10] <- factor(data[, 10], levels=c(1,0),labels=c("Yes","Not Selected"))
names(data)[10] <- "G1_Q0002_SQ002"

data[, 11] <- as.numeric(data[, 11])
attributes(data)$variable.labels[11] <- "[Software de Uso Geral (jogos, navegadores de internet, etc)] 
Que tipo de software livre você utiliza?"
data[, 11] <- factor(data[, 11], levels=c(1,0),labels=c("Yes","Not Selected"))
names(data)[11] <- "G1_Q0002_SQ003"

data[, 12] <- as.numeric(data[, 12])
attributes(data)$variable.labels[12] <- "[Software de Uso Específico (software para área médica, química, de engenharia, dentre outros)] 
Que tipo de software livre você utiliza?"
data[, 12] <- factor(data[, 12], levels=c(1,0),labels=c("Yes","Not Selected"))
names(data)[12] <- "G1_Q0002_SQ004"

data[, 13] <- as.character(data[, 13])
attributes(data)$variable.labels[13] <- "Você possui experiência em manter serviços de TI utilizando software livre?"
data[, 13] <- factor(data[, 13], levels=c("A1","A2","A3"),labels=c("Nunca mantive serviços de TI com software de código aberto","Já implantei serviços de TI com software de código aberto","Já customizei serviços de TI de código aberto"))
names(data)[13] <- "G1_Q0003"

data[, 14] <- as.character(data[, 14])
attributes(data)$variable.labels[14] <- "Você possui experiência em programação de/com software de código aberto?"
data[, 14] <- factor(data[, 14], levels=c("A1","A2","A3","A4"),labels=c("Nunca desenvolvi software de código aberto, nem utilizei componentes de código aberto","Já desenvolvi soluções proprietárias utilizando componentes de código aberto","Já desenvolvi software de código aberto com domínio específico","Já contribuí dando manutenção em projetos de código aberto"))
names(data)[14] <- "G1_Q0004"

data[, 15] <- as.character(data[, 15])
attributes(data)$variable.labels[15] <- "Há quanto tempo você utiliza software livre?"
data[, 15] <- factor(data[, 15], levels=c("A1","A2","A3","A4","A5","A6"),labels=c("Utilizo há menos de 6 meses","Utilizo entre 6 meses e 1 ano","Utilizo entre 1 e 2 anos","Utilizo entre 3 e 5 anos","Utilizo entre 5 e 10 anos","Utilizo há mais de 10 anos"))
names(data)[15] <- "G1_Q0005"

data[, 16] <- as.numeric(data[, 16])
attributes(data)$variable.labels[16] <- "Qual o seu nível de satisfação com sua experiência no uso de software livre?"
data[, 16] <- factor(data[, 16], levels=c(1,2,3,4,5),labels=c("Completamente insatisfeito","Insatisfeito","Indiferente","Satisfeito","Completamente Satisfeito"))
names(data)[16] <- "G1_Q0006"

data[, 17] <- as.character(data[, 17])
attributes(data)$variable.labels[17] <- "[Facilidade de testar e de ser avaliado por usuários de um modo geral] 

Na sua opinião, em que grau estes fatores influenciam a adoção de software livre do ponto de vista tecnológico?"
data[, 17] <- factor(data[, 17], levels=c("A1","A2","A3","A4"),labels=c("nenhuma influência","pouca influência","influência considerável","muita influência"))
names(data)[17] <- "G2_Q0001_1"

data[, 18] <- as.character(data[, 18])
attributes(data)$variable.labels[18] <- "[Utilização de desenvolvimento e de qualidade bem definidos por parte do fabricante] 

Na sua opinião, em que grau estes fatores influenciam a adoção de software livre do ponto de vista tecnológico?"
data[, 18] <- factor(data[, 18], levels=c("A1","A2","A3","A4"),labels=c("nenhuma influência","pouca influência","influência considerável","muita influência"))
names(data)[18] <- "G2_Q0001_7"

data[, 19] <- as.character(data[, 19])
attributes(data)$variable.labels[19] <- "[Compatibilidade com a infraestrutura existente, com os requisitos/necessidades/demandas, e/ou com a tecnologia em vigor] 

Na sua opinião, em que grau estes fatores influenciam a adoção de software livre do ponto de vista tecnológico?"
data[, 19] <- factor(data[, 19], levels=c("A1","A2","A3","A4"),labels=c("nenhuma influência","pouca influência","influência considerável","muita influência"))
names(data)[19] <- "G2_Q0001_2"

data[, 20] <- as.character(data[, 20])
attributes(data)$variable.labels[20] <- "[Facilidade de entender, utilizar e/ou adaptar] 

Na sua opinião, em que grau estes fatores influenciam a adoção de software livre do ponto de vista tecnológico?"
data[, 20] <- factor(data[, 20], levels=c("A1","A2","A3","A4"),labels=c("nenhuma influência","pouca influência","influência considerável","muita influência"))
names(data)[20] <- "G2_Q0001_3"

data[, 21] <- as.character(data[, 21])
attributes(data)$variable.labels[21] <- "[Vantagem(ns) em relação a custos com hardware, requisitos mínimos menos exigentes, custos com licença ou suporte, etc] 

Na sua opinião, em que grau estes fatores influenciam a adoção de software livre do ponto de vista tecnológico?"
data[, 21] <- factor(data[, 21], levels=c("A1","A2","A3","A4"),labels=c("nenhuma influência","pouca influência","influência considerável","muita influência"))
names(data)[21] <- "G2_Q0001_4"

data[, 22] <- as.character(data[, 22])
attributes(data)$variable.labels[22] <- "[Maior eficiência em relação à  solução, livre ou não, utilizada atualmente] 

Na sua opinião, em que grau estes fatores influenciam a adoção de software livre do ponto de vista tecnológico?"
data[, 22] <- factor(data[, 22], levels=c("A1","A2","A3","A4"),labels=c("nenhuma influência","pouca influência","influência considerável","muita influência"))
names(data)[22] <- "G2_Q0001_5"

data[, 23] <- as.character(data[, 23])
attributes(data)$variable.labels[23] <- "[Maior confiabilidade em relação à solução, livre ou não, utilizada atualmente] 

Na sua opinião, em que grau estes fatores influenciam a adoção de software livre do ponto de vista tecnológico?"
data[, 23] <- factor(data[, 23], levels=c("A1","A2","A3","A4"),labels=c("nenhuma influência","pouca influência","influência considerável","muita influência"))
names(data)[23] <- "G2_Q0001_6"

data[, 24] <- as.character(data[, 24])
attributes(data)$variable.labels[24] <- "Que outros aspectos você considera tecnologicamente importantes para a adoção de software livre?"
names(data)[24] <- "G2_Q0002"

data[, 25] <- as.character(data[, 25])
attributes(data)$variable.labels[25] <- "[Disponibilidade de recursos para pesquisa/estudo das soluções que façam uso de software livre] 
Na sua opinião, em que grau destes fatores influenciam a adoção de software livre em ambientes coorporativos?"
data[, 25] <- factor(data[, 25], levels=c("A1","A2","A3","A4"),labels=c("nenhuma influência","pouca influência","influência considerável","muita influência"))
names(data)[25] <- "G3_Q0001_1"

data[, 26] <- as.character(data[, 26])
attributes(data)$variable.labels[26] <- "[Custo Total de Propriedade do Software (envolve benefícios/desvantagens técnicas e de negócio)] 
Na sua opinião, em que grau destes fatores influenciam a adoção de software livre em ambientes coorporativos?"
data[, 26] <- factor(data[, 26], levels=c("A1","A2","A3","A4"),labels=c("nenhuma influência","pouca influência","influência considerável","muita influência"))
names(data)[26] <- "G3_Q0001_2"

data[, 27] <- as.character(data[, 27])
attributes(data)$variable.labels[27] <- "[Relevância do Software para a Organização] 
Na sua opinião, em que grau destes fatores influenciam a adoção de software livre em ambientes coorporativos?"
data[, 27] <- factor(data[, 27], levels=c("A1","A2","A3","A4"),labels=c("nenhuma influência","pouca influência","influência considerável","muita influência"))
names(data)[27] <- "G3_Q0001_3"

data[, 28] <- as.character(data[, 28])
attributes(data)$variable.labels[28] <- "[Experiência dos membros da equipe com uso/customização de software livre] 
Na sua opinião, em que grau destes fatores influenciam a adoção de software livre em ambientes coorporativos?"
data[, 28] <- factor(data[, 28], levels=c("A1","A2","A3","A4"),labels=c("nenhuma influência","pouca influência","influência considerável","muita influência"))
names(data)[28] <- "G3_Q0001_4"

data[, 29] <- as.character(data[, 29])
attributes(data)$variable.labels[29] <- "[Apoio à disseminação e uso de software livre por parte da alta gerência] 
Na sua opinião, em que grau destes fatores influenciam a adoção de software livre em ambientes coorporativos?"
data[, 29] <- factor(data[, 29], levels=c("A1","A2","A3","A4"),labels=c("nenhuma influência","pouca influência","influência considerável","muita influência"))
names(data)[29] <- "G3_Q0001_5"

data[, 30] <- as.character(data[, 30])
attributes(data)$variable.labels[30] <- "Que outros aspectos você considera relevantes na adoção de software livre por parte de organizações?"
names(data)[30] <- "G3_Q0002"

data[, 31] <- as.character(data[, 31])
attributes(data)$variable.labels[31] <- "[Condições de mercado do software (custo, confiabilidade, uso por outras companhias concorrentes, dentre outros)] 
Na sua opinião, em que grau os fatores abaixo influenciam a adoção de um software livre do ponto de vista mercadológico?"
data[, 31] <- factor(data[, 31], levels=c("A1","A2","A3","A4"),labels=c("nenhuma influência","pouca influência","influência considerável","muita influência"))
names(data)[31] <- "G4_Q0001_1"

data[, 32] <- as.character(data[, 32])
attributes(data)$variable.labels[32] <- "[Condições de mercado de uma organização (fôlego financeiro, tamanho das equipes, distribuição geográfica, dentre outros)] 
Na sua opinião, em que grau os fatores abaixo influenciam a adoção de um software livre do ponto de vista mercadológico?"
data[, 32] <- factor(data[, 32], levels=c("A1","A2","A3","A4"),labels=c("nenhuma influência","pouca influência","influência considerável","muita influência"))
names(data)[32] <- "G4_Q0001_5"

data[, 33] <- as.character(data[, 33])
attributes(data)$variable.labels[33] <- "[Incentivo do governo para uso de software livre] 
Na sua opinião, em que grau os fatores abaixo influenciam a adoção de um software livre do ponto de vista mercadológico?"
data[, 33] <- factor(data[, 33], levels=c("A1","A2","A3","A4"),labels=c("nenhuma influência","pouca influência","influência considerável","muita influência"))
names(data)[33] <- "G4_Q0001_2"

data[, 34] <- as.character(data[, 34])
attributes(data)$variable.labels[34] <- "[Marketing negativo por parte dos vendedores de software proprietário] 
Na sua opinião, em que grau os fatores abaixo influenciam a adoção de um software livre do ponto de vista mercadológico?"
data[, 34] <- factor(data[, 34], levels=c("A1","A2","A3","A4"),labels=c("nenhuma influência","pouca influência","influência considerável","muita influência"))
names(data)[34] <- "G4_Q0001_6"

data[, 35] <- as.character(data[, 35])
attributes(data)$variable.labels[35] <- "[Disponibilidade de especialistas e serviços de suporte externos à organização] 
Na sua opinião, em que grau os fatores abaixo influenciam a adoção de um software livre do ponto de vista mercadológico?"
data[, 35] <- factor(data[, 35], levels=c("A1","A2","A3","A4"),labels=c("nenhuma influência","pouca influência","influência considerável","muita influência"))
names(data)[35] <- "G4_Q0001_3"

data[, 36] <- as.character(data[, 36])
attributes(data)$variable.labels[36] <- "[Existência de um caso de sucesso no mercado] 
Na sua opinião, em que grau os fatores abaixo influenciam a adoção de um software livre do ponto de vista mercadológico?"
data[, 36] <- factor(data[, 36], levels=c("A1","A2","A3","A4"),labels=c("nenhuma influência","pouca influência","influência considerável","muita influência"))
names(data)[36] <- "G4_Q0001_4"

data[, 37] <- as.character(data[, 37])
attributes(data)$variable.labels[37] <- "Que outros fatores você considera mercadologicamente importantes na adoção de software livre?"
names(data)[37] <- "G4_Q0002"

data[, 38] <- as.character(data[, 38])
attributes(data)$variable.labels[38] <- "[Perfil para pesquisa de soluções em software livre] 
Na sua opinião, em que grau estes fatores influenciam a adoção de software livre, do ponto de vista de um indivíduo qualquer?"
data[, 38] <- factor(data[, 38], levels=c("A1","A2","A3","A4"),labels=c("nenhuma influência","pouca influência","influência considerável","muita influência"))
names(data)[38] <- "G5_Q0001_1"

data[, 39] <- as.character(data[, 39])
attributes(data)$variable.labels[39] <- "[Certeza na escolha de uma solução de software livre como a mais adequada para o problema em questão] 
Na sua opinião, em que grau estes fatores influenciam a adoção de software livre, do ponto de vista de um indivíduo qualquer?"
data[, 39] <- factor(data[, 39], levels=c("A1","A2","A3","A4"),labels=c("nenhuma influência","pouca influência","influência considerável","muita influência"))
names(data)[39] <- "G5_Q0001_2"

data[, 40] <- as.character(data[, 40])
attributes(data)$variable.labels[40] <- "[Adoção prévia de um software livre com sucesso] 
Na sua opinião, em que grau estes fatores influenciam a adoção de software livre, do ponto de vista de um indivíduo qualquer?"
data[, 40] <- factor(data[, 40], levels=c("A1","A2","A3","A4"),labels=c("nenhuma influência","pouca influência","influência considerável","muita influência"))
names(data)[40] <- "G5_Q0001_3"

data[, 41] <- as.character(data[, 41])
attributes(data)$variable.labels[41] <- "[Existência de algum caso de sucesso entre pessoas do círculo de contatos] 
Na sua opinião, em que grau estes fatores influenciam a adoção de software livre, do ponto de vista de um indivíduo qualquer?"
data[, 41] <- factor(data[, 41], levels=c("A1","A2","A3","A4"),labels=c("nenhuma influência","pouca influência","influência considerável","muita influência"))
names(data)[41] <- "G5_Q0001_4"

data[, 42] <- as.character(data[, 42])
attributes(data)$variable.labels[42] <- "[Aspectos políticos e/ou ideológicos] 
Na sua opinião, em que grau estes fatores influenciam a adoção de software livre, do ponto de vista de um indivíduo qualquer?"
data[, 42] <- factor(data[, 42], levels=c("A1","A2","A3","A4"),labels=c("nenhuma influência","pouca influência","influência considerável","muita influência"))
names(data)[42] <- "G5_Q0001_5"

data[, 43] <- as.character(data[, 43])
attributes(data)$variable.labels[43] <- "Que outros fatores você considera como relevantes para a adoção de software livre do ponto de vista individual?"
names(data)[43] <- "G5_Q0002"

data[, 44] <- as.character(data[, 44])
attributes(data)$variable.labels[44] <- "Qual o seu cargo atual?"
names(data)[44] <- "G6_Q0001"

data[, 45] <- as.character(data[, 45])
attributes(data)$variable.labels[45] <- "Quantos anos de experiência você possui neste cargo?"
data[, 45] <- factor(data[, 45], levels=c("A1","A2","A3","A4"),labels=c("Menos de um ano de experiência","Entre um e três anos de experiência","Entre três e cinco anos de experiência","Entre cinco e dez anos de experiência"))
names(data)[45] <- "G6_Q0002"

data[, 46] <- as.character(data[, 46])
attributes(data)$variable.labels[46] <- "[Outros] Quantos anos de experiência você possui neste cargo?"
names(data)[46] <- "G6_Q0002_other"

data[, 47] <- as.numeric(data[, 47])
attributes(data)$variable.labels[47] <- "[Desenvolvimento de Software] Em que setor a sua organização atua?"
data[, 47] <- factor(data[, 47], levels=c(1,0),labels=c("Yes","Not Selected"))
names(data)[47] <- "G6_Q0003_SQ001"

data[, 48] <- as.numeric(data[, 48])
attributes(data)$variable.labels[48] <- "[Infraestrutura de TI] Em que setor a sua organização atua?"
data[, 48] <- factor(data[, 48], levels=c(1,0),labels=c("Yes","Not Selected"))
names(data)[48] <- "G6_Q0003_SQ010"

data[, 49] <- as.numeric(data[, 49])
attributes(data)$variable.labels[49] <- "[Finanças] Em que setor a sua organização atua?"
data[, 49] <- factor(data[, 49], levels=c(1,0),labels=c("Yes","Not Selected"))
names(data)[49] <- "G6_Q0003_SQ002"

data[, 50] <- as.numeric(data[, 50])
attributes(data)$variable.labels[50] <- "[Energia] Em que setor a sua organização atua?"
data[, 50] <- factor(data[, 50], levels=c(1,0),labels=c("Yes","Not Selected"))
names(data)[50] <- "G6_Q0003_SQ003"

data[, 51] <- as.numeric(data[, 51])
attributes(data)$variable.labels[51] <- "[Automobilístico] Em que setor a sua organização atua?"
data[, 51] <- factor(data[, 51], levels=c(1,0),labels=c("Yes","Not Selected"))
names(data)[51] <- "G6_Q0003_SQ004"

data[, 52] <- as.numeric(data[, 52])
attributes(data)$variable.labels[52] <- "[Engenharia] Em que setor a sua organização atua?"
data[, 52] <- factor(data[, 52], levels=c(1,0),labels=c("Yes","Not Selected"))
names(data)[52] <- "G6_Q0003_SQ005"

data[, 53] <- as.numeric(data[, 53])
attributes(data)$variable.labels[53] <- "[Químico] Em que setor a sua organização atua?"
data[, 53] <- factor(data[, 53], levels=c(1,0),labels=c("Yes","Not Selected"))
names(data)[53] <- "G6_Q0003_SQ006"

data[, 54] <- as.numeric(data[, 54])
attributes(data)$variable.labels[54] <- "[Saúde] Em que setor a sua organização atua?"
data[, 54] <- factor(data[, 54], levels=c(1,0),labels=c("Yes","Not Selected"))
names(data)[54] <- "G6_Q0003_SQ007"

data[, 55] <- as.numeric(data[, 55])
attributes(data)$variable.labels[55] <- "[Educacional] Em que setor a sua organização atua?"
data[, 55] <- factor(data[, 55], levels=c(1,0),labels=c("Yes","Not Selected"))
names(data)[55] <- "G6_Q0003_SQ008"

data[, 56] <- as.numeric(data[, 56])
attributes(data)$variable.labels[56] <- "[Telecomunicações] Em que setor a sua organização atua?"
data[, 56] <- factor(data[, 56], levels=c(1,0),labels=c("Yes","Not Selected"))
names(data)[56] <- "G6_Q0003_SQ009"

data[, 57] <- as.character(data[, 57])
attributes(data)$variable.labels[57] <- "[Outros] Em que setor a sua organização atua?"
names(data)[57] <- "G6_Q0003_other"

data[, 58] <- as.numeric(data[, 58])
attributes(data)$variable.labels[58] <- "[Desenvolvimento de Software] 
O produto que você ou sua organização desenvolve apóia qual setor da economia?(por exemplo, desenvolvimento de software, finanças, energia, automóvel, etc)?"
data[, 58] <- factor(data[, 58], levels=c(1,0),labels=c("Yes","Not Selected"))
names(data)[58] <- "G6_Q0004_1"

data[, 59] <- as.numeric(data[, 59])
attributes(data)$variable.labels[59] <- "[Infraestrutura de TI] 
O produto que você ou sua organização desenvolve apóia qual setor da economia?(por exemplo, desenvolvimento de software, finanças, energia, automóvel, etc)?"
data[, 59] <- factor(data[, 59], levels=c(1,0),labels=c("Yes","Not Selected"))
names(data)[59] <- "G6_Q0004_2"

data[, 60] <- as.numeric(data[, 60])
attributes(data)$variable.labels[60] <- "[Finanças] 
O produto que você ou sua organização desenvolve apóia qual setor da economia?(por exemplo, desenvolvimento de software, finanças, energia, automóvel, etc)?"
data[, 60] <- factor(data[, 60], levels=c(1,0),labels=c("Yes","Not Selected"))
names(data)[60] <- "G6_Q0004_3"

data[, 61] <- as.numeric(data[, 61])
attributes(data)$variable.labels[61] <- "[Energia] 
O produto que você ou sua organização desenvolve apóia qual setor da economia?(por exemplo, desenvolvimento de software, finanças, energia, automóvel, etc)?"
data[, 61] <- factor(data[, 61], levels=c(1,0),labels=c("Yes","Not Selected"))
names(data)[61] <- "G6_Q0004_4"

data[, 62] <- as.numeric(data[, 62])
attributes(data)$variable.labels[62] <- "[Automobilístico] 
O produto que você ou sua organização desenvolve apóia qual setor da economia?(por exemplo, desenvolvimento de software, finanças, energia, automóvel, etc)?"
data[, 62] <- factor(data[, 62], levels=c(1,0),labels=c("Yes","Not Selected"))
names(data)[62] <- "G6_Q0004_5"

data[, 63] <- as.numeric(data[, 63])
attributes(data)$variable.labels[63] <- "[Engenharia] 
O produto que você ou sua organização desenvolve apóia qual setor da economia?(por exemplo, desenvolvimento de software, finanças, energia, automóvel, etc)?"
data[, 63] <- factor(data[, 63], levels=c(1,0),labels=c("Yes","Not Selected"))
names(data)[63] <- "G6_Q0004_6"

data[, 64] <- as.numeric(data[, 64])
attributes(data)$variable.labels[64] <- "[Químico] 
O produto que você ou sua organização desenvolve apóia qual setor da economia?(por exemplo, desenvolvimento de software, finanças, energia, automóvel, etc)?"
data[, 64] <- factor(data[, 64], levels=c(1,0),labels=c("Yes","Not Selected"))
names(data)[64] <- "G6_Q0004_7"

data[, 65] <- as.numeric(data[, 65])
attributes(data)$variable.labels[65] <- "[Saúde] 
O produto que você ou sua organização desenvolve apóia qual setor da economia?(por exemplo, desenvolvimento de software, finanças, energia, automóvel, etc)?"
data[, 65] <- factor(data[, 65], levels=c(1,0),labels=c("Yes","Not Selected"))
names(data)[65] <- "G6_Q0004_8"

data[, 66] <- as.numeric(data[, 66])
attributes(data)$variable.labels[66] <- "[Educacional] 
O produto que você ou sua organização desenvolve apóia qual setor da economia?(por exemplo, desenvolvimento de software, finanças, energia, automóvel, etc)?"
data[, 66] <- factor(data[, 66], levels=c(1,0),labels=c("Yes","Not Selected"))
names(data)[66] <- "G6_Q0004_9"

data[, 67] <- as.numeric(data[, 67])
attributes(data)$variable.labels[67] <- "[Telecomunicações] 
O produto que você ou sua organização desenvolve apóia qual setor da economia?(por exemplo, desenvolvimento de software, finanças, energia, automóvel, etc)?"
data[, 67] <- factor(data[, 67], levels=c(1,0),labels=c("Yes","Not Selected"))
names(data)[67] <- "G6_Q0004_10"

data[, 68] <- as.character(data[, 68])
attributes(data)$variable.labels[68] <- "[Outros] 
O produto que você ou sua organização desenvolve apóia qual setor da economia?(por exemplo, desenvolvimento de software, finanças, energia, automóvel, etc)?"
names(data)[68] <- "G6_Q0004_other"

data[, 69] <- as.character(data[, 69])
attributes(data)$variable.labels[69] <- "Em qual cidade você atua?"
names(data)[69] <- "G6_Q0005"

data[, 70] <- as.numeric(data[, 70])
attributes(data)$variable.labels[70] <- "Em qual estado você atua?"
data[, 70] <- factor(data[, 70], levels=c(1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27),labels=c("Acre","Alagoas","Amapá","Amazonas","Bahia","Ceará","Distrito Federal","Espírito Santo","Goiás","Maranhão","Mato Grosso","Mato Grosso do Sul","Minas Gerais","Pará","Paraíba","Paraná","Pernambuco","Piauí","Rio de Janeiro","Rio Grande do Norte","Rio Grande do Sul","Rondônia","Santa Catarina","Roraima","São Paulo","Sergipe","Tocantins"))
names(data)[70] <- "G6_Q0006"

data[, 71] <- as.character(data[, 71])
attributes(data)$variable.labels[71] <- "[Outros] Em qual estado você atua?"
names(data)[71] <- "G6_Q0006_other"

data[, 72] <- as.numeric(data[, 72])
attributes(data)$variable.labels[72] <- "Em qual país você atua?"
data[, 72] <- factor(data[, 72], levels=c(1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73,74,75,76,77,78,79,80,81,82,83,84,85,86,87,88,89,90,91,92,93,94,95,96,97,98,99,100,101,102,103,104,105,106,107,108,109,110,111,112,113,114,115,116,117,118,119,120,121,122,123,124,125,126,127,128,129,130,131,132,133,134,135,136,137,138,139,140,141,142,143,144,145,146,147,148,149,150,151,152,153,154,155,156,157,158,159,160,161,162,163,164,165,166,167,168,169,170,171,172,173,174,175,176,177,178,179,180,181,182,183,184,185,186,187,188,189,190,191),labels=c("Afghanestan","Shqiperia","Al Jaza'ir","Andorra","Angola","Antigua and Barbuda","Argentina","Hayastan","Australia","Oesterreich","Azarbaycan Respublikasi","The Bahamas","Al Bahrayn","Bangladesh","Barbados","Byelarus","Belgique (French) or Belgie (Flemish)","Belice","Benin","Drukyul","Bolivia","Bosna i Hercegovina","Botswana","Brasil","Brunei","Republika Bulgariya","Burkina Faso","Burundi","Kampuchea","Cameroon or Cameroun (French)","Canada","Cabo Verde","Republique Centrafricaine","Tchad","Chile","Zhong Guo","Colombia","Comores","Republique du Congo","Republique Democratique du Congo","Costa Rica","Cote d'Ivoire","Hrvatska","Cuba","Kypros (Greek) or Kibris (Turkish)","Ceska Republika","Danmark","Djibouti","Dominica","Republica Dominicana","Ecuador","Misr","El Salvador","Guinea Ecuatorial","Ertra","Eesti","YeItyop'iya","Fiji","Suomi","France or Republique Francaise","Gabon","The Gambia","Sak'art'velo","Deutschland","Ghana","Ellas","Grenada","Guatemala","Guinee","Guine-Bissau","Guyana","Haiti","Honduras","Magyarorszag","Island","India, Bharat","Indonesia","Iran, Persia","Al Iraq","Ireland or Eire","Yisra'el","Italia","Jamaica","Nippon","Al Urdun","Qazaqstan","Kenya","Kiribati","Choson or Choson-minjujuui-inmin-konghwaguk","Taehan-min'guk","Al Kuwayt","Kyrgyz Respublikasy","Sathalanalat Paxathipatai Paxaxon Lao","Latvija","Lubnan","Lesotho","Liberia","Libya","Liechtenstein","Lietuva","Luxembourg","Makedonija","Madagascar","Malawi","Malaysia","Dhivehi Raajje","Mali","Malta","Marshall Islands","Muritaniyah","Mauritius","Mexico","Federated States of Micronesia","Moldova","Monaco","Mongol Uls","Al Maghrib","Mocambique","Myanma Naingngandaw","Namibia","Nauru","Nepal","Nederland","New Zealand","Nicaragua","Niger","Nigeria","Norge","Uman","Pakistan","Belau","Panama","Papua New Guinea","Paraguay","Peru","Pilipinas","Polska","Portugal","Qatar","Romania","Rossiya","Rwanda","Saint Kitts and Nevis","Saint Lucia","Samoa","San Marino","Sao Tome e Principe","Al Arabiyah as Suudiyah","Senegal","Srbija-Crna Gora","Seychelles","Sierra Leone","Singapore","Slovensko","Slovenija","Solomon Islands","Somalia","South Africa","Espana","Sri Lanka","As-Sudan","Suriname","Swaziland","Sverige","Schweiz (German), Suisse (French), Svizzera (Italian)","Suriyah","T'ai-wan","Jumhurii Tojikistan","Tanzania","Muang Thai","Togo","Tonga","Trinidad and Tobago","Tunis","Turkiye","Turkmenistan","Tuvalu","Uganda","Ukrayina","Al Imarat al Arabiyah al Muttahidah","United Kingdom","United States","Uruguay","Uzbekiston Respublikasi","Vanuatu","Santa Sede (Citta del Vaticano)","Venezuela","Viet Nam","Al Yaman","Zambia","Zimbabwe"))
names(data)[72] <- "G6_Q0007"

