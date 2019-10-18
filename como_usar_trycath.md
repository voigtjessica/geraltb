## Tutorial como usar o tryCath em loops

O *tryCath* é uma estratégia para pular erros em loops. Vou colocar uns exemplos práticos aqui:

Primeiro, um loop que vai dar errado:

```r
teste <- c(-1:1)

for(i in 1:length(teste)){
  
  log(teste[i])
  
}
```

Deu erro.

O tryCath tem os seguintes parâmetros:

* expr = {  } - operação que deverá ser rodada e que pode dar erro (obrigatório)
* error = function(e){ } - O que escrever se der erro (opcional)
* warning = function(w){ } - O que escrever para antecipar um aviso (opcional)
* finally = { } - O que escrever quando a operação estiver terminada (opcional)

Agora o exemplo do tryCath em uma função:

```r
log_calculator <- function(x){
  tryCatch(
    expr = {
      message(log(x))
      message("Deu certo")
    },
    error = function(e){
      message('Deu ruim!')
      print(e)
    },
    warning = function(w){
      message('Eita!')
      print(w)
    },
    finally = {
      message('Terminado')
    }
  )    
}
```
Agora vamos ver isso na prática:

```r
log_calculator(-1)

log_calculator(1)
```

Agora vamos colocar isso em um loop mesmo:

```r
teste <- c(-1:2)
x <- data.frame()

for(i in 1:length(teste)){
  
  a <- tryCatch(
    expr = {
    log(teste[i])
  },
  error = function(e){
    message('Não encontrado')
    print(e)
  })
  
  x <- rbind(x, a)}
```

O *tryCath* tem que estar dentro da operação que pode dar erro. Se o meu loop tem mais de uma operação, isso significa que as outras operações têm que continuar fora do trycath.
