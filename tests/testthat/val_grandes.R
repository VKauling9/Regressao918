test_that("Valores grandes", {
  dados <- data.frame(Y = c(2^10, 3^10, 4^10), X = c(8^10, 10^10, 14^10))

  expect_error(regressao("Y", "X", dados))
})
