# Create a Nice Logo for my Website in GGplot.
# Thelonious Goerz 
# 5/18/21

# 01 Load Packages 
library(ggplot2)
library(tidyverse)
library(magrittr)

# 02 Set Seed 
set.seed(2)

# 03 Generate data 

X = rnorm(n = 1000, mean = 15, sd = 30)
Z = rnorm(n = 1000, mean = 40, sd = 30)
W = rnorm(n = 1000, mean = 60, sd = 30)
Y = rnorm(n = 1000, mean = 100, sd = 30)

Mat = data.frame(cbind(X,Z,W,Y))

Mat %<>% 
  pivot_longer(cols = c(X,Z,W,Y),
               names_to = "Density",values_to = "Var")

plot <- ggplot(Mat,aes(log(Var), col = Density)) + 
  geom_density(size = 1.2,
               adjust =10) + 
  theme_minimal() + 
  theme(panel.grid.major = element_blank()
       , 
       panel.grid.minor = element_blank()
        , legend.position = "none",
       axis.title.x=element_blank(),
       axis.title.y=element_blank(),
       axis.line=element_blank(),
       axis.text.x=element_blank(),
       axis.text.y=element_blank(),
       axis.ticks=element_blank()) + 
  scale_color_brewer(palette="Set4")
  
ggsave(plot, filename = "/Users/theloniousgoerz/Academic/Professional/website/theloniousgoerz.github.io/images/logo.jpeg",
       width = 16, height = 16)
ggsave(plot, filename = "/Users/theloniousgoerz/Academic/Professional/logo_screen.jpeg",
       width = 2560, height = 1600,units = "px")
