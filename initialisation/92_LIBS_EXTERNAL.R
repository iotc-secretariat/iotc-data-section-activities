# Install/load pacman
if(!require(pacman)){
  install.packages("pacman")
  suppressPackageStartupMessages(library(pacman,quietly = TRUE))
}

# Install/load libraries required for analysis
pacman::p_load("knitr", 
               "rmarkdown", 
               "officedown", 
               "bookdown", 
               "flextable", 
               "ggpubr", 
               "ggsci", 
               "knitr", 
               "lubridate", 
               "officer", 
               "openxlsx", 
               "tidyverse",
               "pivottabler",
               "basictabler", 
               "data.table"
)


# Set chart theme
ggplot2::theme_set(theme_bw())

print("External libraries fully initialized")