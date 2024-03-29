% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/predict_gaussian_2D.R
\name{predict_gaussian_2D}
\alias{predict_gaussian_2D}
\title{Predict values from a fitted 2D-Gaussian}
\usage{
predict_gaussian_2D(fit_object, X_values, Y_values, ...)
}
\arguments{
\item{fit_object}{Either the output of \code{gaussplotR::fit_gaussian_2D()}
or a list that contains coefficients and fit methods (see Details).}

\item{X_values}{vector of numeric values for the x-axis}

\item{Y_values}{vector of numeric values for the y-axis}

\item{...}{Additional arguments}
}
\value{
A data.frame with the supplied \code{X_values} and \code{Y_values}
along with the predicted values of the 2D-Gaussian
(\code{predicted_values})
}
\description{
Predict values from a fitted 2D-Gaussian
}
\details{
This function assumes Gaussian parameters have been fitted beforehand. No
fitting of parameters is done within this function; these can be
supplied via the object created by \code{gaussplotR::fit_gaussian_2D()}.

If \code{fit_object} is not an object created by
\code{gaussplotR::fit_gaussian_2D()}, \code{predict_gaussian_2D()} attempts
to parse \code{fit_object} as a list of two items. The coefficients of the
fit must be supplied as a one-row, named data.frame within
\code{fit_object$coefs}, and details of the methods for fitting the Gaussian
must be contained as a character vector in \code{fit_object$fit_method}. This
character vector in \code{fit_object$fit_method} must be a named vector that
provides information about the method, amplitude constraint choice, and
orientation constraint choice, using the names \code{method},
\code{amplitude}, and \code{orientation}. \code{method} must be one of:
\code{"elliptical"}, \code{"elliptical_log"}, or \code{"circular"}.
\code{amplitude} and \code{orientation} must each be either
\code{"unconstrained"} or \code{"constrained"}. For example, \code{c(method =
"elliptical", amplitude = "unconstrained", orientation = "unconstrained")}.
One exception to this is when \code{method = "circular"}, in which case
\code{orientation} must be \code{NA}, e.g.: \code{c(method = "circular",
amplitude = "unconstrained", orientation = NA)}.
}
\examples{
if (interactive()) {
  ## Load the sample data set
  data(gaussplot_sample_data)

  ## The raw data we'd like to use are in columns 1:3
  samp_dat <-
    gaussplot_sample_data[,1:3]


  #### Example 1: Unconstrained elliptical ####
  ## This fits an unconstrained elliptical by default
  gauss_fit <-
    fit_gaussian_2D(samp_dat)

  ## Generate a grid of x- and y- values on which to predict
  grid <-
    expand.grid(X_values = seq(from = -5, to = 0, by = 0.1),
                Y_values = seq(from = -1, to = 4, by = 0.1))

  ## Predict the values using predict_gaussian_2D
  gauss_data <-
    predict_gaussian_2D(
      fit_object = gauss_fit,
      X_values = grid$X_values,
      Y_values = grid$Y_values,
    )

  ## Plot via ggplot2 and metR
  library(ggplot2); library(metR)
  ggplot_gaussian_2D(gauss_data)

  ## Produce a 3D plot via rgl
  rgl_gaussian_2D(gauss_data)


  #### Example 2: Constrained elliptical_log ####
  ## This fits a constrained elliptical, as in Priebe et al. 2003
  gauss_fit <-
    fit_gaussian_2D(
      samp_dat,
      method = "elliptical_log",
      constrain_orientation = -1
    )

  ## Generate a grid of x- and y- values on which to predict
  grid <-
    expand.grid(X_values = seq(from = -5, to = 0, by = 0.1),
                Y_values = seq(from = -1, to = 4, by = 0.1))

  ## Predict the values using predict_gaussian_2D
  gauss_data <-
    predict_gaussian_2D(
      fit_object = gauss_fit,
      X_values = grid$X_values,
      Y_values = grid$Y_values,
    )

  ## Plot via ggplot2 and metR
  ggplot_gaussian_2D(gauss_data)

  ## Produce a 3D plot via rgl
  rgl_gaussian_2D(gauss_data)
}
}
\author{
Vikram B. Baliga
}
