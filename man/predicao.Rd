% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/previsao.R
\name{predicao}
\alias{predicao}
\title{Predição de novos valores}
\usage{
predicao(X_novo, modelo)
}
\arguments{
\item{X_novo}{Vetor com novos valores}

\item{modelo}{Objeto que contém o resultado da função de regressão do pacote \code{regressao}}
}
\value{
Vetor com os valores preditos pela função de regressão
}
\description{
Predição de novos valores
}
\examples{

predicao(0.6, modelo)

}
