## ---- include = FALSE---------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----setup--------------------------------------------------------------------
library(gaussplotR)

## We'll also use lattice, ggplot2 and metR
library(lattice); library(ggplot2); library(metR)

## Load the sample data set
data(gaussplot_sample_data)

## The raw data we'd like to use are in columns 1:3
samp_dat <-
  gaussplot_sample_data[,1:3]

## ----raw_data_contour---------------------------------------------------------
lattice::levelplot(
  response ~ X_values * Y_values,
  data = samp_dat,
  col.regions = colorRampPalette(
    c("white", "blue")
    )(100),
  xlim = c(-5, 0),
  ylim = c(-1, 4), 
  asp = 1
)


## ----u_e----------------------------------------------------------------------
gauss_fit_ue <-
    fit_gaussian_2D(samp_dat)

gauss_fit_ue
attributes(gauss_fit_ue)

## ----predict_and_plot_ue------------------------------------------------------
## Generate a grid of x- and y- values on which to predict
grid <-
  expand.grid(X_values = seq(from = -5, to = 0, by = 0.1),
              Y_values = seq(from = -1, to = 4, by = 0.1))

## Predict the values using predict_gaussian_2D
gauss_data_ue <-
  predict_gaussian_2D(
    fit_object = gauss_fit_ue,
    X_values = grid$X_values,
    Y_values = grid$Y_values,
  )

## Plot via ggplot2 and metR
ggplot_gaussian_2D(gauss_data_ue)

## ----c_e----------------------------------------------------------------------
gauss_fit_ce <-
    fit_gaussian_2D(samp_dat, 
                    constrain_orientation = 0)

gauss_fit_ce

## ----predict_and_plot_ce------------------------------------------------------
## Predict the values using predict_gaussian_2D
gauss_data_ce <-
  predict_gaussian_2D(
    fit_object = gauss_fit_ce,
    X_values = grid$X_values,
    Y_values = grid$Y_values,
  )

## Plot via ggplot2 and metR
ggplot_gaussian_2D(gauss_data_ce)

## ----uel----------------------------------------------------------------------
gauss_fit_uel <-
    fit_gaussian_2D(samp_dat, 
                    method = "elliptical_log")

gauss_fit_uel

## Predict the values using predict_gaussian_2D
gauss_data_uel <-
  predict_gaussian_2D(
    fit_object = gauss_fit_uel,
    X_values = grid$X_values,
    Y_values = grid$Y_values,
  )

## Plot via ggplot2 and metR
ggplot_gaussian_2D(gauss_data_uel)

## ----cel----------------------------------------------------------------------
gauss_fit_cel <-
    fit_gaussian_2D(
      samp_dat,
      method = "elliptical_log",
      constrain_orientation = -0.66
    )

gauss_fit_cel

## Predict the values using predict_gaussian_2D
gauss_data_cel <-
  predict_gaussian_2D(
    fit_object = gauss_fit_cel,
    X_values = grid$X_values,
    Y_values = grid$Y_values,
  )

## Plot via ggplot2 and metR
ggplot_gaussian_2D(gauss_data_cel)

## ----cir----------------------------------------------------------------------
gauss_fit_cir <-
    fit_gaussian_2D(samp_dat, 
                    method = "circular")

gauss_fit_cir

## Predict the values using predict_gaussian_2D
gauss_data_cir <-
  predict_gaussian_2D(
    fit_object = gauss_fit_cir,
    X_values = grid$X_values,
    Y_values = grid$Y_values,
  )

## Plot via ggplot2 and metR
ggplot_gaussian_2D(gauss_data_cir)

