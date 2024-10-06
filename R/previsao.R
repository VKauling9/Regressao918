previsao <- function(X_novo, modelo){ #colocar na documentação que a pessoa precisa salvar o modelo em algum lugar e depois colocar o nome aqui para fazer previsão

  b <- modelo$Betas[-1,]

  previsao <- modelo$Betas[1,] + X_novo %*% b

  return(previsao)
}




