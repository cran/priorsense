## -----------------------------------------------------------------------------
#| include: false
ggplot2::theme_set(bayesplot::theme_default(base_family = "sans"))

options(priorsense.plot_help_text = FALSE)


## -----------------------------------------------------------------------------
#| message: false
#| warning: false
#| eval: false
# library(nimble)
# library(priorsense)


## -----------------------------------------------------------------------------
#| message: false
#| warnings: false
#| echo: false
library(priorsense)


## -----------------------------------------------------------------------------
model <- example_powerscale_model(language = "nimble")


## -----------------------------------------------------------------------------
#| echo: false
#| results: asis
cat("```\n")
model$model_code
cat("```")


## -----------------------------------------------------------------------------
#| message: false
#| warning: false
#| results: false
#| eval: false

# inits <- list(
#   mu = 0,
#   sigma = 1
# )
# 
# model <- nimbleModel(
#   model$model_code, # the nimble model code
#   data = model$data,
#   inits = inits,
#   constants = list(N = model$data$N)
# )
# 
# cmodel <- compileNimble(model)
# 
# mcmc <- buildMCMC(
#   cmodel,
#   monitors = c(
#     "mu",
#     "sigma",
#     "lprior",
#     "lprior_mu",
#     "lprior_sigma",
#     "log_lik"
#   )
# )
# 
# cmcmc <- compileNimble(mcmc, project = cmodel)


## -----------------------------------------------------------------------------
#| echo: false
#| message: false
#| warning: false
fit <- readRDS(system.file("extdata", "univariate_normal_nimble.RDS", package = "priorsense"))



## -----------------------------------------------------------------------------
#| message: false
#| warning: false
#| results: false
#| eval: false

# fit <- runMCMC(
#   cmcmc,
#   niter = 20000,
#   nburnin = 5000,
#   nchains = 4,
#   thin = 15,
#   setSeed = c(123, 456, 789, 101112),
#   samplesAsCodaMCMC = TRUE # alternatively, coerce the output using `posterior::as_draws_df`
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

