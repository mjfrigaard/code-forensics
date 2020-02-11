#=====================================================================#
# This is code to create: outFile
# Authored by and feedback to: Martin Frigaard
# Email: mjfrigaard@gmail.com
# GPL (>= 2)
# Version: 0.1
#=====================================================================#


# this function creates an outfile for an R object that has a date/time 
# stamp and the file extension.
outFile <- function(file_path, file_name, file_extension) {
    
    require(stringr)
    
    # turn to lowercase
    title_file_name <- stringr::str_to_title(file_name)
    title_file_name <- base::paste0("-", title_file_name)
    
    lower_file_path <- stringr::str_to_lower(file_path)
    
    
    # create date/time for file
    date_stmp <- lubridate::today()
    
    # file extension (plus dot)
    dot_file_extension <- base::paste0(".", file_extension)
    dot_file_extension <- stringr::str_to_lower(dot_file_extension)
    
    # combine all to outFile
    outFile <- file.path(lower_file_path, 
                         paste0(date_stmp, 
                         title_file_name, 
                         dot_file_extension))
    
    # return the outFile
    return(outFile)
    
}

outFile(file_path = "data", file_name = "Data", file_extension = "CSV")
