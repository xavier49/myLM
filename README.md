 <!-- badges: start -->
  [![R-CMD-check](https://github.com/xavier49/myLM/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/xavier49/myLM/actions/workflows/R-CMD-check.yaml)
  <!-- badges: end -->

myLM3 is a package containing the function "linearmodel" which is supposed to model the "lm" function in R. It can run a simple or multiple linear regression main effects model used to identify relationships between variables. The function returns a list object with identical coefficient tables as the lm function as well as numerically equivalent values for R-squared, adjusted R-squared, residuals, fitted values, and F statistics.


## Installation and Usage

```R
# Install the myLM3 package from GitHub
devtools::install_github("xavier49/myLM", build_vignettes = TRUE)

# Load the package
library(myLM3)

# Start using the package
# Example: Fit a linear model to the mtcars dataset
result <- linearmodel(Y = "mpg", X = c("wt", "hp"), data = mtcars)
print(result$Coefficients)
