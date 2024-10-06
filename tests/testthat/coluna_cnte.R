test_that("Coluna constante na variável preditora", {
  dados <- data.frame(Y = c(2, 4, 6, 8), X = c(1, 1, 1, 1))

  #expect_true(!is.null(resultado$betas))
  #expect_true(all(!is.na(resultado$betas)))

  expect_error(regressao("Y", "X", dados))
})


