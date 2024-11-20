 <!-- badges: start -->
  [![R-CMD-check](https://github.com/xavier49/myLM/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/xavier49/myLM/actions/workflows/R-CMD-check.yaml)
  <!-- badges: end -->

myLM3 is a package containing the function "linearmodel" which is supposed to model the "lm" function in R. It can run a simple or multiple linear regression main effects model used to identify relationships between variables. The function returns a list object with identical coefficient tables as the lm function as well as numerically equivalent values for R-squared, adjusted R-squared, residuals, fitted values, and F statistics.

To install the package run the following line of code:
devtools::install_github("xavier49/myLM", build_vignettes = T)
