% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/example_powerscale_model.R
\name{example_powerscale_model}
\alias{example_powerscale_model}
\title{Example Stan model for power-scaling}
\usage{
example_powerscale_model(model = "univariate_normal")
}
\arguments{
\item{model}{Character specifying which model code to
return. Currently "univariate_normal" and "eight_schools" are
implemented.}
}
\value{
List containing model code and corresponding data.
}
\description{
Provides example models (with data) that are ready for use with
power-scaling.
}
\examples{
ex_normal <- example_powerscale_model(model = "univariate_normal")

ex_eightschools <- example_powerscale_model(model = "eight_schools")
}
