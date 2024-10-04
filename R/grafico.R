grafico <- function(Y, preditos){
  ggplot(aes(x = preditos, y = Y)) +
    geom_point(color = "blue", size = 2) +
    geom_vline(xintercept = predic_linear, linetype = "dashed", color = "red", linewidth = 1) +
    labs(title = "Valores Preditos vs Observados",
         x = "Valores Preditos",
         y = "Valores Observados") +
    theme_bw()

}
