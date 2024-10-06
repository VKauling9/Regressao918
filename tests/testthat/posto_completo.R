test_that("Regression handles non-full rank matrix", {
  X <- matrix(c(1, 2, 3, 4, 2, 4, 6, 8), ncol = 2)  # Second column is a multiple of the first
  Y <- c(2, 4, 6, 8)

  expect_error(my_regression(X, Y), "singular")  # Expect an error due to singular matrix
})
