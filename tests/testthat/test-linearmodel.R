mylm <-  linearmodel(Y = "Sepal.Length", X = c("Sepal.Width", "Petal.Length"), data = iris)
lmlm <- lm(Sepal.Length~Sepal.Width + Petal.Length, iris)

test_that("linearmodel coefficients work", {
  expect_equal(mylm$Coefficients, lmlm$coefficients)
})

test_that("linearmodel residuals work", {
  expect_equal(mylm$Residuals, lmlm$residuals)
})
