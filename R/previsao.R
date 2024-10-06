#' @title Predição de novos valores
#' @rdname predicao
#'
#' @param X_novo Vetor com novos valores
#' @param modelo Objeto que contém o resultado da função de regressão do pacote `regressao`
#'
#' @return Vetor com os valores preditos pela função de regressão
#'
#' @examples
#'
#' predicao(0.6, modelo)
#'
#' @export
predicao <- function(X_novo, modelo){

  b <- modelo$Betas[-1,]

  predicao <- modelo$Betas[1,] + X_novo %*% b

  return(predicao)
}








