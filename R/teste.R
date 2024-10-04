regressao <- function(Y, X, db){

  variaveis_numericas<-(sapply(db[c(X,Y)], is.numeric))
  if (all(variaveis_numericas) == FALSE) {
    false <- names(variaveis_numericas[!variaveis_numericas])
    stop(paste("Erro: As seguintes variáveis preditoras não são numéricas:",
               paste(false, collapse = ", ")))
  } else{
    db <- drop_na(db)
    X <- as.matrix(db[X])
    Y <- as.matrix(db[Y])
    matX <- cbind(1, db[X])
    matY <- cbind(db[Y], ncol = 1)

    betas <- solve(t(X) %*% X) %*% (t(X) %*% Y)

    preditos <- X %*% betas

    residuos <- Y - preditos

    modelo <- list(Betas = betas, Valores_preditos = preditos,
                   Residuos = residuos)

    ggplot(aes(x = preditos, y = Y)) +
      geom_point(color = "blue", size = 2) +
      geom_vline(xintercept = predic_linear, linetype = "dashed", color = "red", linewidth = 1) +
      labs(title = "Valores Preditos vs Observados",
           x = "Valores Preditos",
           y = "Valores Observados") +
      theme_bw()

  }
return(modelo)
}
matX <- cbind(1, c(8, 4, 0, -4, -8))
matY <- matrix(c(7.8, 9, 10.2, 11, 11.7), ncol = 1)


regressao("quality", "alcohol", db)

as.matrix(db["pH"])
as.matrix(db["alcohol"])
