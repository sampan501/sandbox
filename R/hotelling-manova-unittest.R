require(mgc)
require(Hotelling)

# data <- mgc.sims.linear(1000, 1, eps = 0)
# data <- cbind(data$X, data$Y)
# 
# rot_mat <- matrix(data = c(0, 1, -1, 0), nrow=2, ncol=2)
# new_data <- t(rot_mat %*% t(data))
# stat <- hotelling.test(data, new_data)
# print(paste("Statistic: ", stat$stats$statistic))
# print(paste("P-value: ", stat$pval))


data <- matrix(seq(1000) - 1, nrow=500, ncol=2)
rot_mat <- matrix(data = c(0, 1, -1, 0), nrow=2, ncol=2)
new_data <- t(rot_mat %*% t(data))
stat <- hotelling.test(data, new_data)
print(paste("Statistic: ", stat$stats$statistic))
print(paste("P-value: ", stat$pval))