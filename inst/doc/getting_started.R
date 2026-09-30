## -----------------------------------------------------------------------------
#| include: false
library(priorsense)
ggplot2::theme_set(bayesplot::theme_default(base_family = "sans"))
options(priorsense.plot_help_text = FALSE)


## -----------------------------------------------------------------------------
normal_model <- example_powerscale_model("univariate_normal")

fit <- normal_model$draws


## -----------------------------------------------------------------------------
powerscale_sensitivity(fit)


## -----------------------------------------------------------------------------
#| message: false
#| warning: false
#| fig-width: 6
#| fig-height: 4
powerscale_plot_dens(fit, variable = "mu")


## -----------------------------------------------------------------------------
#| message: false
#| warning: false
#| fig-width: 6
#| fig-height: 4
powerscale_plot_ecdf(fit, variable = "mu")


## -----------------------------------------------------------------------------
#| message: false
#| warning: false
#| fig-width: 12
#| fig-height: 4
powerscale_plot_quantities(fit, variable = "mu")


## -----------------------------------------------------------------------------
mean(normal_model$data$y)
sd(normal_model$data$y)

