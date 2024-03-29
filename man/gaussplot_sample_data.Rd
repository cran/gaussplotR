% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/gaussplot_sample_data.R
\docType{data}
\name{gaussplot_sample_data}
\alias{gaussplot_sample_data}
\title{Sample data set}
\format{
A data frame with 36 rows and 11 variables:
\describe{
\item{X_values}{vector of numeric values for the x-axis}
\item{Y_values}{vector of numeric values for the y-axis}
\item{response}{vector of numeric values for the response variable}
\item{norm_g_resp}{normalized values from the 2D-Gaussian fit}
\item{g_resp}{values from the 2D-Gaussian fit}
\item{A}{amplitude of 2D-Gaussian (repeated)}
\item{X_peak}{location of peak x-axis value (repeated)}
\item{X_var}{variance in x (repeated)}
\item{Q}{orientation parameter of the gaussian (repeated)}
\item{Y_peak}{location of peak y-axis value (repeated)}
\item{Y_var}{variance in y (repeated)}
}
}
\usage{
gaussplot_sample_data
}
\description{
A \code{data.frame} of raw data and fitted 2D-Gaussian parameters; intended
for use with \code{predict_gaussian_2D()}
}
\keyword{datasets}
