test_that("Regression handles perfect prediction", {
  X <- matrix(c(1, 2, 3, 4, 5, 6), ncol = 2)
  beta <- c(1, 2, 3)
  Y <- X %*% beta

  result <- my_regression(X, Y)

  expect_equal(result$residuals, rep(0, length(Y)), tolerance = 1e-10)  # Residuals should be all zero
})
