regressao <- function(Y, X, db){
  X <- as.matrix(db[X])

  variaveis_numericas<-(sapply(db[c(X,Y)], is.numeric))
  if (!all(variaveis_numericas)) {
    false <- names(variaveis_numericas[!variaveis_numericas])
    stop(paste("Erro: As seguintes variáveis preditoras não são numéricas:",
               paste(false, collapse = ", ")))
  } else{
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
  return()
}
matX <- cbind(1, c(8, 4, 0, -4, -8))
matY <- matrix(c(7.8, 9, 10.2, 11, 11.7), ncol = 1)


for (i in 1:length(matX)) {
  if (is.numeric(matX[i]) == FALSE) {
    false <-  names(matX)
    stop(paste("Erro: As seguintes variáveis preditoras não são numéricas:",
               paste(false, collapse = ", ")))
  } else{
    betas <- solve(t(matX) %*% matX) %*% (t(matX) %*% matY)

    preditos <- matX %*% betas

    residuos <- matY - preditos
  }

}
matX[]
