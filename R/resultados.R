#' Title
#'
#' @param Y
#' @param X
#' @param db
#'
#' @return
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
      db <- drop_na(db)

      Y <- as.matrix(db[Y])
      X <- as.matrix(db[X])
      matX <- cbind(1, X)

      betas <- solve(t(matX) %*% matX) %*% (t(matX) %*% Y)

      preditos <- matX %*% betas

      residuos <- Y - preditos


      modelo <- list(Betas = as.vector(betas),
                     Valores_preditos = as.vector(preditos),
                     Residuos = as.vector(residuos))

    }
    return(modelo)
  }
