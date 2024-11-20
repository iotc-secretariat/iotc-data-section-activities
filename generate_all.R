# Sources the R scripts
setwd("initialisation")
source("00_CORE.R")
setwd("..")

# Configure file
#CPC   = "SUMMARY- EASTERN INDIAN OCEAN1"
#TITLE = paste0(CPC, "_FACTSHEET_", Sys.Date())

# DOCX
render("rmd/00_DOCX_HTML.Rmd",
       output_format = "rdocx_document", 
       output_dir    = "outputs/", 
       output_file   = paste0("IOTC-2024-WPDCS20-07 IOTC Data Section Activities and progress", ".docx")
)

# will update for PPT

render("rmd/00_PPTX.Rmd", 
       output_format = powerpoint_presentation(reference_doc = "../templates/ppt_template.potx", slide_level = 2),
       output_dir    = "outputs", 
       output_file   = paste0("SUMMARY- EASTERN INDIAN OCEAN", ".pptx"))
