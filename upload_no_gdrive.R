# Como upar planilhas automaticamente no Google Drive

library(googledrive)

#fazendo uma planilha de teste para upar no drive:

teste_gdrive <- c("a, b", "1,2")
teste_gdrive_df <- read.csv(text = teste_gdrive, strip.white = TRUE)
View(teste_gdrive_df)


#autenticação no google drive:

drive_find(n_max=10)  


#Salve a planilha em csv:

setwd("C:\\Users\\jvoig\\OneDrive\\Documentos\\Colab\\COLAB\\templates")


#Salvar com os seguintes parâmetros para que não dê erro para a exportação para spreadsheet:

write.table(teste_gdrive_df , file="teste_gdrive_df.csv", 
            sep=",", row.names=F, na="", quote = T)


#agora, ele vai buscar no diretório já setado o arquivo para upload:

teste_gdrive_df_sheet <- drive_upload(
  "teste_gdrive_df.csv",
  path="~/TB/2018/",
  name = "teste2",
  type = "spreadsheet")


#path é o caminho onde o arquivo será guardado, o ~ é o "meu drive" e dai você especifica o 
#caminho ;)
