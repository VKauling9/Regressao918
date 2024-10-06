#' Title Predição de novos valores
#'
#' @param X_novo Vetor com novos valores
#' @param modelo Objeto que contém o resultado da função de regressão do pacote `regressao`
#'
#' @return Vetor com os valores preditos pela função de regressão
#' @export
predisao <- function(X_novo, modelo){

  b <- modelo$Betas[-1,]

  predisao <- modelo$Betas[1,] + X_novo %*% b

  return(predisao)
}
#' @examples







