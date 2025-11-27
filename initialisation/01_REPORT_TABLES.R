print("Reading and formatting the report tables...")

# Capacity building ####

capacity_building_summary = data.table(read.xlsx("../data/CB_activities_2025.xlsx", sep.names = " ", sheet = "CB_summ"))

CB_summary = 
  flextable(capacity_building_summary) %>%
  #bg(part = "header", bg = "grey", i=1) %>%
  # bg(j ="Year_sub", part = "body", bg = "darkblue", source = "Year_sub") %>%
  #bg(i= NULL, part = "body", bg = c("lightblue")) %>%
  fontsize(size = 7, part = "header") %>%
  fontsize(size = 8, part = "body") %>%
  border_inner() %>%
  border_outer(border = fp_border(width = 2)) %>%
  merge_v(j= "Category") %>%
  valign(j = "Category", part = "body", valign = "top") %>%
  colformat_double(j = NULL, digits = 0 )%>%
  colformat_date(j = "Dates", i = c(9, 10, 13), fmt_date = "%d/%m/%y") %>%
  width(j = "Dates", width = 1) %>%
  width(j = "Country / CPC", width = 3) %>%
  width(j = "Category", width = 2)

# CB table
capacity_building_table = data.table(read.xlsx("../data/CB_activities_2025.xlsx", sep.names = " ", sheet = "CB_tab"))

ACTIVITY_TABLE_FT = 
  flextable(capacity_building_table) %>%
  fontsize(size = 7, part = "header")%>%
  fontsize(size = 8, part = "body")%>%
  border_inner() %>%
  border_outer(border = fp_border(width = 2)) %>%
  merge_v(j= "Category") %>%
  valign(j = "Category", part = "body", valign = "top") %>%
  colformat_double(j = NULL, digits = 0 ) %>%
  set_table_properties(layout = "autofit", width = 1) %>%
  bg(part = "header", bg = "grey", i = 1)
  # bg(j ="Year_sub", part = "body", bg = "darkblue", source = "Year_sub")%>%
  #bg(i= NULL, part = "body", bg = c("lightblue"))

# Data Requests ####
data_requests = data.table(read.xlsx("../data/data_request summ2025.xlsx", sep.names = " "))

DATA_REQUESTS_FT = 
  flextable(data_requests) %>%
  fontsize(size = 7, part = "header") %>%
  fontsize(size = 8, part = "body") %>%
  border_inner() %>%
  border_outer(border = fp_border(width = 2)) %>%
  merge_v(j= "Meeting") %>%
  valign(j = "Meeting", part = "body", valign = "top") %>%
  colformat_double(j = NULL, digits = 0) %>%
  set_table_properties(layout = "autofit", width = 1) #%>%
  #bg(part = "header", bg = "grey", i=1)
  # bg(j ="Year_sub", part = "body", bg = "darkblue", source = "Year_sub")%>%
  #bg(i= NULL, part = "body", bg = c("lightgreen"))

DR_summ_para = data_requests[, .(Para = .N), keyby = .(Meeting)]

DR_num_para = 
  flextable(DR_summ_para) %>%
  fontsize(size = 7, part = "header") %>%
  fontsize(size = 8, part = "body") %>%
  border_inner() %>%
  border_outer(border = fp_border(width = 2)) %>%
  colformat_double(j = NULL, digits = 0) %>%
  set_table_properties(layout = "autofit", width = 1) %>%
  #bg(part = "header", bg = "grey", i = 1) %>%
  set_header_labels(Para = "Number of requests", Meeting = "Scientific Meetings") %>%
  autofit()

# Progress ####
WPDCS_progress_recomm = data.table(read.xlsx("../Data/Progress25.xlsx", sep.names = " "))

WPDCS_REC_PROGRESS_FT = 
  flextable(WPDCS_progress_recomm) %>%
  fontsize(size = 7, part = "header") %>%
  fontsize(size = 8, part = "body") %>%
  border_inner() %>%
  border_outer(border = fp_border(width = 2)) %>%
  merge_v(j= "Type")%>%
  valign(j = "Type", part = "body", valign = "top") %>%
  colformat_double(j = NULL, digits = 0 ) %>%
  set_table_properties(layout = "autofit", width= 1)

# PR_summ_prog = WPDCS_progress_recomm[, .(WPDCS19 = .N), keyby = .(Type_recomm)]
# 
# PR_num_prog = 
#   flextable(WPDCS_progress_recomm, col_keys = c("Type_recomm", "Main_topic", "Progress")) %>%
#   fontsize(size = 7, part = "header")%>%
#   fontsize(size = 8, part = "body")%>%
#   border_inner() %>%
#   border_outer(border = fp_border(width = 2)) %>%
#   colformat_double(j = NULL, digits = 0 )%>%
#   set_table_properties(layout = "autofit", width= 1)%>%
#   bg(part = "header", bg = "grey", i=1)%>%
#   set_header_labels(Main_topic= "Recommendation Topics", Type_recomm = "Type of Recommendations")

print("Report tables loaded!")
