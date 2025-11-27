FlexouilleLaTableMonDalon = function(DataSet){ 
  
  FT = 
    DataSet %>% 
    flextable::flextable() %>% 
    flextable::font(part = "all", fontname = "Calibri") %>% 
    flextable::fontsize(part = "all", size = 9) %>% 
    flextable::align(part = "header", align = "center") %>% 
    flextable::bold(part = "header") %>% 
    flextable::bg(part = "header", bg = "gray") %>% 
    flextable::border_inner(border = fp_border()) %>%
    flextable::border_outer(border = fp_border(width = 2)) %>% 
    flextable::autofit()
  
  return(FT)
}