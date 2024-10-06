test_that("Matriz sem posto completo", {
  dados <- data.frame(Y = c(2, 4, 5, 7), X = c(4, 8, 10, 14))

  modelo <- regressao918("Y", "X", dados)

  expect_equal(modelo$Betas[1,], 0)
})
