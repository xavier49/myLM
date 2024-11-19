mylm <-  linearmodel(Y = "Sepal.Length", X = c("Sepal.Width", "Petal.Length"), data = iris)
lmlm <- lm(Sepal.Length~Sepal.Width + Petal.Length, iris)
lmcoefs <- round(t(t(unname(lmlm$coefficients))),4)
lmres <- matrix(lmlm$residuals, ncol = 1)

test_that("linearmodel coefficients work", {
  expect_equal(mylm$Coefficients, lmcoefs)
})

test_that("linearmodel residuals work", {
  expect_equal(mylm$Residuals, lmres)
})
