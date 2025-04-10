## ----include = FALSE----------------------------------------------------------

ggplot2::theme_set(bayesplot::theme_default(base_family = "sans"))


## -----------------------------------------------------------------------------
#| warning: false
library(priorsense)
library(rstan)


## -----------------------------------------------------------------------------
#| warning: false
#| eval: false
#| message: false
# normal_model <- example_powerscale_model("univariate_normal")
# 
# fit <- stan(
#   model_code = normal_model$model_code,
#   data = normal_model$data,
#   refresh = FALSE,
#   seed = 123
# )
# 


## -----------------------------------------------------------------------------
#| echo: false
#| warning: false
#| message: false
normal_model <- example_powerscale_model("univariate_normal")
fit <- normal_model$draws



## -----------------------------------------------------------------------------
#| message: false
#| warning: false
powerscale_sensitivity(fit, variable = c("mu", "sigma"))


## -----------------------------------------------------------------------------
#| message: false
#| warning: false
#| fig-width: 6
#| fig-height: 4
powerscale_plot_dens(fit, variable = "mu", facet_rows = "variable")


## -----------------------------------------------------------------------------
#| message: false
#| warning: false
#| fig-width: 6
#| fig-height: 4
powerscale_plot_ecdf(fit, variable = "mu", facet_rows = "variable")


## -----------------------------------------------------------------------------
#| message: false
#| warning: false
#| fig-width: 12
#| fig-height: 4
powerscale_plot_quantities(fit, variable = "mu")


## -----------------------------------------------------------------------------
mean(normal_model$data$y)
sd(normal_model$data$y)

