## -----------------------------------------------------------------------------
#| include: false
ggplot2::theme_set(bayesplot::theme_default(base_family = "sans"))
options(priorsense.plot_help_text = FALSE)


## -----------------------------------------------------------------------------
#| message: false
#| warning: false
library(posterior)
library(priorsense)
library(brms)


## -----------------------------------------------------------------------------
#| echo: false
#| message: false
#| warning: false
fit <- readRDS(system.file("extdata", "univariate_normal_brms.RDS", package = "priorsense"))



## -----------------------------------------------------------------------------
#| message: false
#| warning: false
#| results: false
#| eval: false
# normal_model <- example_powerscale_model(model = "univariate_normal")
# 
# priors <- c(
#   prior(coef = "Intercept", normal(0, 1), tag = "intercept"),
#   prior(class = "sigma", normal(0, 2.5), tag = "sigma")
# )
# 
# fit <- brm(
#   bf(y ~ 1, center = FALSE),
#   data = data.frame(y = normal_model$data$y),
#   prior = priors
# )
# 


## -----------------------------------------------------------------------------
powerscale_sensitivity(fit)


## -----------------------------------------------------------------------------
powerscale_sensitivity(fit, prior_selection = "sigma")


## -----------------------------------------------------------------------------
powerscale_sensitivity(fit, prior_selection = "intercept")


## -----------------------------------------------------------------------------
#| message: false
#| warning: false
#| fig-width: 6
#| fig-height: 4
powerscale_plot_dens(fit)

