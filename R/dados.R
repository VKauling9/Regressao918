set.seed(123)  # For reproducibility
sim_X <- matrix(rnorm(100), ncol=2)  # 50 samples with 2 predictors
sim_Y <- 1 + 2*sim_X[,1] + 3*sim_X[,2] + rnorm(50)

sim_dados <- as.data.frame(cbind(sim_X, sim_Y))
colnames(sim_dados) <- c("sim_X", "sim_Y")

usethis::use_data(sim_dados)
