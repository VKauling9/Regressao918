test_that("Coluna constante na variável preditora", {


  X <- c(1, 1, 1, 1)
  Y <- c(2, 4, 6, 8)

  dados <- as.data.frame(cbind(Y, X))
  colnames(dados) <- c("Y", "X")

  #expect_true(!is.null(resultado$betas))
  #expect_true(all(!is.na(resultado$betas)))

  expect_error(regressao("Y", "X", dados))
})



test_that("Coluna constante na variável preditora", {

  X <- c(1, 4, 7, 6)
  Y <- c(2, 4, 6, 8)

  dados <- as.data.frame(cbind(Y, X))
  colnames(dados) <- c("Y", "X")

  resultados <- regressao("Y", "X", dados)

  lm <- lm(Y ~ X, dados)
  #expect_true(!is.null(resultado$betas))
  #expect_true(all(!is.na(resultado$betas)))

  expect_equal(resultados$betas, lm$coefficients)
})
