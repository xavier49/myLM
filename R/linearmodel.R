#' Linear Model Fitting
#'
#' Fits a linear model to the given data and computes regression coefficients,
#' their standard errors, t-values, p-values, and model statistics including
#' R-squared, adjusted R-squared, and F-statistic.
#'
#' @param Y Character string specifying the response variable (column name in the data).
#' @param X Character vector of predictor variable names (column names in the data).
#' @param data A data frame containing the response and predictor variables.
#'
#' @return A list containing the following elements:
#' \describe{
#'   \item{Coefficients}{A data frame with regression coefficients, their standard errors, t-values, and p-values.}
#'   \item{r.squared}{R-squared value indicating the proportion of variance explained by the model.}
#'   \item{adj.r.squared}{Adjusted R-squared value accounting for the number of predictors.}
#'   \item{fstatistic}{The F-statistic of the model.}
#'   \item{F_statistic_P_Value}{The p-value associated with the F-statistic.}
#'   \item{Fitted_Values}{The predicted values of the response variable.}
#'   \item{Residuals}{The residuals (differences between observed and predicted values).}
#'   \item{call}{The matched call for the function.}
#' }
#'
#' @examples
#' # Example usage:
#' data <- data.frame(
#'   Y = c(1, 2, 3, 4, 5),
#'   X1 = c(1, 0, 1, 0, 1),
#'   X2 = c(5, 4, 3, 2, 1)
#' )
#' linearmodel(Y = "Y", X = c("X1", "X2"), data = data)
#'
#'@importFrom stats pt pf
#' @export
linearmodel <- function(Y, X, data) {
  # Function body here
}

linearmodel <- function(Y, X, data) {
  Y <- data[[Y]]
  n <- length(Y)
  p <- length(X) + 1
  design <- c()
  for (i in 1:length(X)) {
    design <- cbind(design, data[[X[i]]])
  }

  design <- cbind(rep(1, length(Y)), design)
  H <- design %*% solve(t(design) %*% design) %*% t(design)
  predicted <- H %*% Y
  Betas <- round(solve(t(design) %*% design) %*% t(design) %*% Y, 4)
  mse <- (1 / (length(Y) - length(X) - 1)) * sum((Y - predicted)^2)

  # Covariance matrix and SE of the Betas
  beta_cov_matrix <- mse * solve(t(design) %*% design)
  beta_cov <- round(sqrt(diag(beta_cov_matrix)), 4)

  # Calculate t-values and p-values for each coefficient
  t <- numeric(length = p)
  pval <- numeric(length = p)
  for (i in 1:p) {
    t[i] <- round(Betas[i] / beta_cov[i], 4)
    pval[i] <- round(2 * pt(-abs(t[i]), df = n - p), 4)
  }

  X <- c("Intercept", X)
  # Coefficients
  summary <- data.frame(
    Estimate = Betas,
    Std_Error = beta_cov,
    t_value = t,
    p = pval
  )

  colnames(summary) <- c("Estimate", "Std. Error", "t value", "Pr(>|t|)")

  # R and adjusted R squared
  SSR <- sum((predicted - mean(Y))^2)
  SSY <- sum((Y - mean(Y))^2)
  R_squared <- SSR / SSY
  adjusted_R_squared <- 1 - ((sum((Y - predicted)^2) / (n - p)) / (SSY / (n - 1)))

  # F
  F_numerator <- SSR / (p - 1)
  F_denominator <- sum((Y - predicted)^2) / (n - p)
  F_statistic <- F_numerator / F_denominator
  F_pvalue <- pf(F_statistic, p - 1, n - p, lower.tail = FALSE)

  # Return a list with the coefficient table, R-squared, and model p-value
  results <- list(
    Coefficients = Betas,
    table = summary,
    r.squared = R_squared,
    adj.r.squared = adjusted_R_squared,
    fstatistic = F_statistic,
    F_statistic_P_Value = F_pvalue,
    Fitted_Values = predicted,
    Residuals = Y - predicted,
    call = match.call()
  )

  return(results)
}
