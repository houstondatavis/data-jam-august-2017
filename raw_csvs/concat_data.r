library(data.table)

fread_file_id <- function(csv){
  file_id <- gsub(".csv$", "", csv)
  df <- fread(csv)
  df$SubjectID <- file_id
  df
}

csv_files <- list.files(pattern='.csv')
DT = rbindlist(lapply(csv_files, fread_file_id))

fwrite(DT, 'all_driver_data.csv')
