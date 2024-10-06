test_that("Matriz sem posto completo", {
  devtools::load_all()
  dados <- data.frame(Y = c(2, 4, 6, 8), X = c(1, 2, 3, 4))

  expect_error(regressao("Y", "X", dados), "singular")
})
