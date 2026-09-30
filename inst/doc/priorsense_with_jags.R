## -----------------------------------------------------------------------------
#| include: false
ggplot2::theme_set(bayesplot::theme_default(base_family = "sans"))

options(priorsense.plot_help_text = FALSE)


## -----------------------------------------------------------------------------
#| message: false
#| warning: false
library(R2jags)
library(posterior)
library(priorsense)

set.seed(123)


## -----------------------------------------------------------------------------
model <- example_powerscale_model("univariate_normal", language = "jags")


## -----------------------------------------------------------------------------
#| echo: false
#| results: asis
cat("```\n")
cat(model$model_code)
cat("```")


## -----------------------------------------------------------------------------
#| echo: false
#| message: false
#| warning: false
fit <- readRDS(system.file("extdata", "univariate_normal_jags.RDS", package = "priorsense"))


## -----------------------------------------------------------------------------
#| message: false
#| warning: false
#| eval: false
# model_con <- textConnection(model$model_code)
# data <- model$data
# 
# # monitor parameters of interest along with log-likelihood and log-prior
# variables <- c("mu", "sigma", "log_lik", "lprior", "lprior_mu", "lprior_sigma")
# 
# fit <- R2jags::jags(
#   data = data,
#   model.file = model_con,
#   parameters.to.save = variables,
#   n.chains = 4,
#   DIC = FALSE,
#   quiet = TRUE,
#   progress.bar = "none",
#   jags.seed = 123
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

