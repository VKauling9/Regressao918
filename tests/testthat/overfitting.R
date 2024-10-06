test_that("Overfitting dos dados no modelo", {
  dados <- data.frame(Y = c(14, 17, 20), X = c(4, 5, 6))


   modelo <- regressao918("X", "Y", dados)


  expect_equal(as.vector(modelo$Residuos),
               rep(0, length(Y)), tolerance = 1e-10)

})

