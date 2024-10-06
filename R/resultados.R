#' @title Regressão Linear
#'
#' @description
#'
#' Função que recebe um data frame e, pelo menos, o nome de duas colunas deste.
#' Aplica uma regressão linear entre as variáveis especificadas.
#'
#' @param Y Nome, entre aspas duplas, da variável resposta, identico ao nome da coluna do banco de dados utilizado
#' @param X Vetor de nomes, entre aspas duplas, das variáveis preditoras, identico aos nomes das colunas do banco de dados utilizado
#' @param db Nome do banco de dados
#'
#' @return Lista com os coeficientes estimados, os valores preditos, resíduos e gráfico (valores Observados vs. Valores Preditos)
#'
#' @examples
#'
#' regressao("sim_Y", "sim_X", sim_dados)
#'
#' @import ggplot2
#' @import dplyr
#' @import tidyr
#' @export
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




