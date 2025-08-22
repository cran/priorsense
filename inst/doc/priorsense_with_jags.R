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


## -----------------------------------------------------------------------------
model_string <- "
model {
  for(n in 1:N) {
    y[n] ~ dnorm(mu, tau)
    log_lik[n] <- likelihood_alpha * logdensity.norm(y[n], mu, tau)
  }
  mu ~ dnorm(0, 1)
  sigma ~ dnorm(0, 1 / 2.5^2) T(0,)
  tau <- 1 / sigma^2
  lprior <- prior_alpha * logdensity.norm(mu, 0, 1) + logdensity.norm(sigma, 0, 1 / 2.5^2)
}
"


## -----------------------------------------------------------------------------
#| message: false
#| warning: false
model_con <- textConnection(model_string)
data <- example_powerscale_model()$data

set.seed(123)

# monitor parameters of interest along with log-likelihood and log-prior
variables <- c("mu", "sigma", "log_lik", "lprior")

jags_fit <- jags(
  data,
  model.file = model_con,
  parameters.to.save = variables,
  n.chains = 4,
  DIC = FALSE,
  quiet = TRUE,
  progress.bar = "none"
  )


## -----------------------------------------------------------------------------
powerscale_sensitivity(jags_fit)


## -----------------------------------------------------------------------------
#| message: false
#| warning: false
#| fig-width: 6
#| fig-height: 4
powerscale_plot_dens(jags_fit)

