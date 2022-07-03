library(here)
library(dataMeta)
library (tidyverse)

CollectedData=read_csv(here("RawData", "CollectedDataFinal.csv"))
head(CollectedData)

CollectedData$period<-as.character(CollectedData$period)
glimpse(CollectedData)
getwd()

glimpse(CollectedData) 

variable_description <- c("The index column that allows us to link the data collected to the original ae_attendances data in the 'RawData' folder.",
                          "The month that this activity relates to, stored as a date (1st of each month).",
                          "The number of attendances for this department type at this organisation for this month.", 
                          "The number of attendances that breached the four-hour target.", 
                          "The Organisation data service (ODS) code for the organisation. If you want to know the organisation associated with a particular ODS code, you can look it up from the following address: https://odsportal.digital.nhs.uk/Organisation/Search.", 
                          "The consent from the end-user to process and share the data collected with the data capture tool.")
print(variable_description)

variable_type <- c(0, 1, 0, 0, 1, 1)

print(variable_type)
linker<-build_linker(CollectedData, variable_description, variable_type)
print(linker)


Dictionary <- build_dict(my.data = CollectedData, linker = linker, prompt_varopts= FALSE, option_description = NULL)

glimpse(Dictionary)

