# Activities ####

## Summary table ####
ACTIVITY_SUMMARY = data.table(read.xlsx("../data/Data_Section_Activities_2024.xlsx", sep.names = " ", sheet = "summary"))

ACTIVITY_SUMMARY_FT = 
  flextable(ACTIVITY_SUMMARY) %>% 
  fontsize(part = "header", size = 11) %>% 
  fontsize(part = "body", size = 9) %>% 
  flextable::font(part = "all", fontname = "calibri") %>% 
  border_inner() %>% 
  border_outer(border = fp_border(width = 2)) %>% 
  merge_v(j= "Category") %>% 
  valign(j = "Category", part = "body", valign = "top") %>% 
  colformat_double(j = NULL, digits = 0) %>% 
  bg(part = "header", bg = "grey", i=1) %>% 
 # width(j = "Dates", width = 1) %>% 
 # width(j = "Country / CPC", width = 3) %>% 
 # width(j = "Category", width = 2) %>% 
  width(width = c(2, 2.5, 1, 1.2))

## Detailed table ####
ACTIVITY_TABLE = data.table(read.xlsx("../data/Data_Section_Activities_2024.xlsx", sep.names = " ", sheet = "detail"))

ACTIVITY_TABLE_FT = 
  flextable(ACTIVITY_TABLE) %>% 
  fontsize(part = "header", size = 11) %>% 
  fontsize(part = "body", size  = 9) %>% 
  flextable::font(part = "all", fontname = "calibri") %>% 
  border_inner() %>% 
  border_outer(border = fp_border(width = 2)) %>% 
  merge_v(j= "Category") %>%
  valign(j = "Category", part = "body", valign = "top") %>% 
  colformat_double(j = NULL, digits = 0 ) %>%  
  set_table_properties(layout = "autofit", width= 1) %>% 
  bg(part = "header", bg = "grey", i=1)

# Data requests from Scientific meetings ####
DATA_REQUESTS = data.table(read.xlsx("../data/Requests_to_WPDCS.xlsx", sheet = "detail"))

DATA_REQUESTS_FT = 
  flextable(DATA_REQUESTS) %>% 
  fontsize(part = "header", size = 11) %>% 
  fontsize(part = "body", size  = 9) %>% 
  flextable::font(part = "all", fontname = "calibri") %>% 
  border_inner() %>% 
  border_outer(border = fp_border(width = 2)) %>% 
  merge_v(j= "Meeting") %>% 
  valign(j = "Meeting", part = "body", valign = "top") %>% 
  colformat_double(j = NULL, digits = 0) %>%  
  set_table_properties(layout = "autofit", width = 1) %>% 
  bg(part = "header", bg = "grey", i = 1)

DR_summ_para = DATA_REQUESTS[, .(Para = .N), keyby = .(Meeting)]

# Number of requests by meeting
DR_num_para = 
  flextable(DR_summ_para) %>% 
  fontsize(part = "header", size = 11) %>% 
  fontsize(part = "body", size  = 9) %>% 
  flextable::font(part = "all", fontname = "calibri") %>% 
  border_inner() %>% 
  border_outer(border = fp_border(width = 2)) %>% 
  colformat_double(j = NULL, digits = 0) %>% 
  set_table_properties(layout = "autofit", width= 1) %>% 
  bg(part = "header", bg = "grey", i = 1) %>% 
  set_header_labels(Para = "Number of requests", Meeting = "Scientific Meetings") %>%
  autofit()

# Progress made ###

## Progress on recommendations ####
WPDCS_REC_PROGRESS = data.table(read.xlsx("../data/Progress.xlsx", sheet = "REC progress", sep.names =  " "))

WPDCS_REC_PROGRESS_FT = 
  flextable(WPDCS_REC_PROGRESS[, -c("REC", "Progress")]) %>% 
  fontsize(part = "header", size = 11) %>% 
  fontsize(part = "body", size  = 9) %>% 
  flextable::font(part = "all", fontname = "calibri") %>% 
  border_inner() %>% 
  border_outer(border = fp_border(width = 2)) %>% 
  merge_v(j = "Section") %>% 
  valign(j = "Section", part = "body", valign = "top") %>% 
  set_table_properties(layout = "autofit", width= 1) %>% 
  bg(part = "header", bg = "grey", i = 1) %>% 
  bg(j = c("Section", "WPDCS", "Recommendation"), part = "body", bg = "#C7E9C0") %>% 
  bg(j = c("SC", "Scientific Committee follow-up"), part = "body", bg = "#9ECAE1") %>% 
  bg(j = c("COM", "Commission follow-up"), bg = c("#959CC3"))

# PR_summ_prog = WPDCS_progress_recomm[, .(WPDCS19 = .N), keyby = .(Type_recomm)]
# 
# PR_num_prog = 
#   flextable(WPDCS_REC_PROGRESS, col_keys = c("Section", "REC", "Progress")) %>% 
#   fontsize(part = "header", size = 11) %>% 
#   fontsize(part = "body", size  = 9) %>% 
#   flextable::font(part = "all", fontname = "calibri") %>% 
#   border_inner() %>% 
#   border_outer(border = fp_border(width = 2)) %>% 
#   colformat_double(j = NULL, digits = 0 ) %>% 
#   set_table_properties(layout = "autofit", width = 1) %>% 
#   bg(part = "header", bg = "grey", i = 1) %>% 
#   set_header_labels(Main_topic= "Recommendation Topics", Type_recomm = "Type of Recommendations")
