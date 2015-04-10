# Test for directory presence, create recursively if not.
existData <- function(dir){
    if (!file.exists(dir)) {
        dir.create(dir, recursive=TRUE)
    }
}

# wrapper for download.file()
getFile <- function(url, file, dir = ".", method = "auto") {
    existData(dir)
    download.file(url,file.path(dir,file),method)
}

# Sample Data - Baltimore Fixed Speed Cameras
# https://data.baltimorecity.gov/api/views/dz54-2aru/rows.csv?accessType=DOWNLOAD