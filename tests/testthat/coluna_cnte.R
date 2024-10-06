test_that("Coluna constante na variável preditora", {
  dados <- data.frame(Y = c(2, 4, 6, 8), X1 = c(3, 3, 3, 3), X2 = c(3,6,10,13))

  expect_error(regressao("Y", c("X1", "X2"), dados))
})


