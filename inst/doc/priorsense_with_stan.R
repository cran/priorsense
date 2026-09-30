## -----------------------------------------------------------------------------
#| include: false
ggplot2::theme_set(bayesplot::theme_default(base_family = "sans"))
options(priorsense.plot_help_text = FALSE)


## -----------------------------------------------------------------------------
#| message: false
#| warning: false
library(posterior)
library(priorsense)


## -----------------------------------------------------------------------------
model <- example_powerscale_model("univariate_normal")


## -----------------------------------------------------------------------------
#| echo: false
#| results: asis
cat("```stan\n")
cat(model$model_code)
cat("```")


## -----------------------------------------------------------------------------
#| echo: false
#| message: false
#| warning: false
fit <- readRDS(system.file("extdata", "univariate_normal_rstan.RDS", package = "priorsense"))



## -----------------------------------------------------------------------------
#| eval: false
#| message: false
#| warning: false
# fit <- rstan::stan(
#   model_code = model$model_code,
#   data = model$data,
#   refresh = FALSE,
#   seed = 123
# )


## -----------------------------------------------------------------------------
powerscale_sensitivity(fit)


## -----------------------------------------------------------------------------
powerscale_sensitivity(fit, prior_selection = "sigma")


## -----------------------------------------------------------------------------
powerscale_sensitivity(fit, prior_selection = "mu")


## -----------------------------------------------------------------------------
#| message: false
#| warning: false
#| fig-width: 6
#| fig-height: 4
powerscale_plot_dens(fit)

