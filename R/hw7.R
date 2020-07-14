REPS = 10000
N_OBS = 10
theta_mle = c()
theta_momx = c()
theta_momy = c()

for (i in seq(REPS)) {
  x <- runif(N_OBS)
  y <- runif(N_OBS)
  theta_mle[i] <- sqrt(max(x^2 + y^2))
  theta_momx[i] <- 2 * sqrt(1/N_OBS * sum(x^2))
  theta_momy[i] <- 2 * sqrt(1/N_OBS * sum(y^2))
}

bias_mle = mean(theta_mle) - 1
bias_momx = mean(theta_momx) - 1
bias_momy = mean(theta_momy) - 1

var_mle = var(theta_mle)
var_momx = var(theta_momx)
var_momy = var(theta_momy)

mse_mle = var_mle + bias_mle^2
mse_momx = var_momx + bias_momx^2
mse_momy = var_momy + bias_momy^2

corr_momxy = cor(theta_momx, theta_momy)
var_momxy = var((theta_momx + theta_momy) / 2)