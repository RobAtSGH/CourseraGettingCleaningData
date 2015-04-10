# Test for directory presence, create recursively if not.
existData <- function(dir){
    if (!file.exists(dir)) {
        dir.create(dir, recursive=TRUE)
    }
}

# wrapper for download.file()
getFile <- function(url, file, dir = ".", method = "auto", filemode = "w") {
    existData(dir)
    download.file(url,file.path(dir,file),method,mode=filemode)
    date()
}

# Sample Data - Baltimore Fixed Speed Cameras
# https://data.baltimorecity.gov/api/views/dz54-2aru/rows.csv?accessType=DOWNLOAD
# See README.md

# read.csv("filepath") to read comma-delimited with header is builtin to base

# reading from Excel requires a different library, and we load the first 
# spreadsheet tab by default.
readExcel <- function (..., index = 1) {
    library(xlsx)
    read.xlsx(..., sheetIndex = index)
}
