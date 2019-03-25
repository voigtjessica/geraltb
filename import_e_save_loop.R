## Importando e salvando arquivos em loop
# É útil quando, por exemplo, eu tenho uma série de csvs que quero importar e depois salvar como arquivos R.Data separados.

library(dplyr)
library(data.table)

setwd("C:/Users/coliv/Documents/brazilian_funds_db/dbs/Repasses PNAE")

#listando os arquivos na pasta que eu setei como default
arq <- list.files()

#criando os nomes dos objetos que ficarão registrados no R. No meu caso, o nome dos próprios arquivos sem a extensão.
nome_arq <- gsub(".csv", "", arq)

#loop de import:
for(i in 1:length(arq)){
  
  x <- fread(arq[i])
  #atribua ao primeiro nome do vetor nome_arq o objeto x que eu importei
  assign(nome_arq[i], x)

}

#loop do save:
for(i in 1:length(nome_arq)){
  
  save(list = (nome_arq[i]), # aqui ele reconhece o nome dos objetos como objetos.
       file = paste(nome_arq[i],".RData", sep = "")) #aqui estou só salvando, como já fiz em outros loops. 
}
