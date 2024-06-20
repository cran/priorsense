## ----include = FALSE----------------------------------------------------------

ggplot2::theme_set(bayesplot::theme_default(base_family = "sans"))

knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----message = FALSE----------------------------------------------------------
library(priorsense)
library(rstan)

## -----------------------------------------------------------------------------
normal_model <- example_powerscale_model("univariate_normal")

fit <- stan(
  model_code = normal_model$model_code,
  data = normal_model$data,
  refresh = FALSE,
  seed = 123
)


## -----------------------------------------------------------------------------
powerscale_sensitivity(fit, variable = c("mu", "sigma"))

## -----------------------------------------------------------------------------
powerscale_plot_dens(fit, variable = "mu")

## -----------------------------------------------------------------------------
powerscale_plot_ecdf(fit, variable = "mu")

## ----fig.width = 12, fig.height = 4-------------------------------------------
powerscale_plot_quantities(fit, variable = "mu")

## -----------------------------------------------------------------------------
mean(normal_model$data$y)
sd(normal_model$data$y)

