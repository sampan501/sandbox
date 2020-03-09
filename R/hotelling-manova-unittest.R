require(mgc)
require(Hotelling)

deg2rad <- function(deg) {(deg * pi) / (180)}

data <- mgc.sims.linear(1000, 1, eps = 0)
data <- cbind(data$X, data$Y)

angle <- deg2rad(90)
rot_mat <- matrix(data = c(cos(angle), sin(angle), -sin(angle), cos(angle)), nrow=2, ncol=2)
new_data <- t(rot_mat %*% t(data))
stat <- hotelling.test(data, new_data)
print(paste("Statistic: ", stat$stats$statistic))
print(paste("P-value: ", stat$pval))