#' Title Regressão Linear
#'
#' @param Y
#' @param X
#' @param db
#'
#' @return Lista com os coeficientes, os valores preditos,
#'
#' @export
#'
#' @examples
regressao <- function(Y, X, db){

  variaveis_numericas<-(sapply(db[c(X,Y)], is.numeric))
  if (all(variaveis_numericas) == FALSE) {
    false <- names(variaveis_numericas[!variaveis_numericas])
    stop(paste("Erro: As seguintes variáveis preditoras não são numéricas:",
               paste(false, collapse = ", ")))
  } else{
    db <- tidyr::drop_na(db)

    Y <- as.matrix(db[Y])
    X <- as.matrix(db[X])
    matX <- cbind(1, X)

    betas <- solve(t(matX) %*% matX) %*% (t(matX) %*% Y)

    preditos <- matX %*% betas

    residuos <- Y - preditos

    dataf <- as.data.frame(cbind(Y, preditos))
    colnames(dataf) <- c("Observados", "Preditos")

    grafico <- ggplot(dataf, aes(x = Preditos, y = Observados)) +
      geom_point(color = "blue", size = 2) +
      geom_abline(slope = 1, intercept = 0, color = "red", linetype = "dashed") +
      labs(title = "Valores Preditos vs Observados",
           x = "Valores Preditos",
           y = "Valores Observados") +
      theme_bw()

  }
  return(list(Betas = betas,
              Valores_preditos = preditos,
              Residuos = residuos,
              Grafico = grafico))
}



