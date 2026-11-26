# libraries
require(officer)
require(officedown)
require(knitr)
require(rmarkdown)
library(this.path)

# Working folder
setwd(here())

# Function for formatting flextables
source("https://raw.githubusercontent.com/iotc-secretariat/iotc-secretariat-resources/refs/heads/main/r_functions/rmd_to_docx/format_flextables.R")

# Function to update header in docx report (post-processing)
source("https://raw.githubusercontent.com/iotc-secretariat/iotc-secretariat-resources/refs/heads/main/r_functions/rmd_to_docx/update_header_text.R")

# Function to convert docx to pdf
source("https://raw.githubusercontent.com/iotc-secretariat/iotc-secretariat-resources/refs/heads/main/r_functions/rmd_to_docx/convert_docx_to_pdf.R")

# File title
doc_number <- "IOTC-2026-WPDCS22-07_Rev3"
doc_title  <- "IOTC_data_section_activities"
document   <- paste0(doc_number, "-", doc_title, ".docx")

## DOCX
render("rmd/00_DOCX_HTML.Rmd", 
       output_dir = "./outputs/", 
       output_file = document
)

# Generic text header in template ("BTOR_HEADER")
header_text <- enc2utf8(doc_number)
replace_header(paste0("./outputs/", document), header_text)

# Generate PDF
docx_to_pdf(docx = paste0("./outputs/", document))


#-------------------------------------------
#-------------- Presentation ---------------
#-------------------------------------------
### PPTX
render("rmd/00_PPTX.Rmd", 
       output_format = powerpoint_presentation(reference_doc = "../templates/ppt_template.potx", slide_level = 2),
       output_dir    = "outputs/ppt/", 
       output_file   = paste0(doc_number, "-", doc_title, ".pptx")
       )





