disk_draw <- function(m)
{
  rad <- runif(m, 0, 1)
  ang <- runif(m, 0, 2*pi)
  x <- sqrt(rad) * cos(ang)
  y <- sqrt(rad) * sin(ang)
  rdisk <- cbind(x, y)
  return(rdisk)
}

theta_MLE <- function(A)
{
  x <- A[, 1]
  y <- A[, 2]
  mle <- sqrt(max(x^2 + y^2))
  return(mle)
}

theta_MOM <- function(x)
{
  nobs <- length(x)
  mom <- 2 * sqrt(1/nobs * sum(x^2))
  return(mom)
}

main <- function(k, m)
{
  mle <- matrix(0, k, 1)
  momx <- matrix(0, k, 1)
  momy <- matrix(0, k, 1)
  for (i in 1:k) {
    data <- disk_draw(m)
    mle[i] <- theta_MLE(data)
    momx[i] <- theta_MOM(data[, 1])
    momy[i] <- theta_MOM(data[, 2])
  }
  W <- cbind(mle, momx, momy)
  return(W)
}

W <- main(10000, 10)