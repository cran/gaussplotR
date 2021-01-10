## ---- include = FALSE---------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----setup--------------------------------------------------------------------
library(gaussplotR)

## Load the sample data set
data(gaussplot_sample_data)

## The raw data we'd like to use are in columns 1:3
samp_dat <-
  gaussplot_sample_data[,1:3]

## ----singular_gradient--------------------------------------------------------
## Un-comment this example if you'd like to see a singular gradient error
# gauss_fit_cir <-
#   fit_gaussian_2D(samp_dat,
#                   constrain_amplitude = TRUE,
#                   method = "circular")

## ----error_msg_1--------------------------------------------------------------
#> Error in stats::nls(response ~ Amp_init * exp(-((((X_values - X_peak)^2)/(2 *  : 
#>   singular gradient
#> Called from: stats::nls(response ~ Amp_init * exp(-((((X_values - X_peak)^2)/(2 * 
#>     X_sig^2) + ((Y_values - Y_peak)^2)/(2 * Y_sig^2)))), start = c(X_peak = #> _peak_init, >
#>     Y_peak = Y_peak_init, X_sig = X_sig_init, Y_sig = Y_sig_init), 
#>     data = data, trace = verbose, control = list(maxiter = maxiter, 
#>         ...))
#> Error during wrapup: unimplemented type (29) in 'eval'
#> 
#> Error: no more error handlers available (recursive errors?); invoking 'abort' restart
#> Error during wrapup: INTEGER() can only be applied to a 'integer', not a 'unknown type #> #29'
#> Error: no more error handlers available (recursive errors?); invoking 'abort' restart

## ----singular_gradient_print_params-------------------------------------------
## Un-comment this example if you'd like to see a singular gradient error
# gauss_fit_cir <-
#   fit_gaussian_2D(samp_dat,
#                   constrain_amplitude = TRUE,
#                   method = "circular",
#                   print_initial_params = TRUE)

## ----error_msg_2--------------------------------------------------------------
#> Initial parameters:
#>       Amp    X_peak    Y_peak     X_sig     Y_sig 
#> 25.725293 -2.000000  3.000000  2.482892  2.500000 
#> Error in stats::nls(response ~ Amp_init * exp(-((((X_values - X_peak)^2)/(2 *  : 
#>   singular gradient
#> Called from: stats::nls(response ~ Amp_init * exp(-((((X_values - X_peak)^2)/(2 * 
#>     X_sig^2) + ((Y_values - Y_peak)^2)/(2 * Y_sig^2)))), start = c(X_peak = #> _peak_init, >
#>     Y_peak = Y_peak_init, X_sig = X_sig_init, Y_sig = Y_sig_init), 
#>     data = data, trace = verbose, control = list(maxiter = maxiter, 
#>         ...))
#> Error during wrapup: unimplemented type (29) in 'eval'
#> 
#> Error: no more error handlers available (recursive errors?); invoking 'abort' restart
#> Error during wrapup: INTEGER() can only be applied to a 'integer', not a 'unknown type #> #29'
#> Error: no more error handlers available (recursive errors?); invoking 'abort' restart

## ----no_singular_user_init----------------------------------------------------
## This should run with no errors
gauss_fit_cir_user <-
  fit_gaussian_2D(samp_dat,
                  constrain_amplitude = TRUE,
                  method = "circular",
                  user_init = c(25.72529, -2.5, 1.7, 1.3, 1.6),
                  print_initial_params = TRUE)
gauss_fit_cir_user

## ----no_singular--------------------------------------------------------------
## This should run with no errors
gauss_fit_cir <-
  fit_gaussian_2D(samp_dat,
                  method = "circular")
gauss_fit_cir

