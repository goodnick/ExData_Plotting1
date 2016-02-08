## Methods to download, unzip and scrub data
## It caches files locally to ensure quicker reading

readHousePowerConsumptionData <- function() {
    location <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
    fileName <- downloadDataFile(location)
    subsetData <- getSubsetData(fileName)

    ## Transform columns to be dates
    subsetData[,2] <- as.character(paste(subsetData[,1], subsetData[,2]))
    subsetData[,1] <- as.Date(subsetData[,1], "%d/%m/%Y")
    subsetData[,2] <- as.POSIXct(strptime(subsetData[,2], "%d/%m/%Y %H:%M:%S"))
    subsetData
}

## reduces data set to 2 days - 1st & 2nd of Feb 2007.
## It then caches this to disk so we don't need to read the dataset
getSubsetData <- function(fileName) {
    dates <- c("1/2/2007", "2/2/2007")
    subsetFilePath <- file.path(".", "data", "subset.csv")
    if(!file.exists(subsetFilePath)) {
        fullData <- read.csv2(fileName)
        subsetData <- subset(fullData, fullData$Date %in% dates)
        write.csv(subsetData, file = subsetFilePath, row.names = FALSE)
    }

    read.csv(subsetFilePath)
}

## Downlaod the datafile and store locally.
## Only downloads and unzips if the files don't exist locally
downloadDataFile <- function(urlLocation) {

    path <- file.path(".", "data")
    if (!dir.exists(path)) {
        dir.create(path)
    }

    zipFileName <- file.path(path, "HousePowerConsumption.zip")
    if(!file.exists(zipFileName)) {
        message("Downloading Data")
        download.file(urlLocation, zipFileName, "curl")
    }

    expandedFileName <- file.path(path, "household_power_consumption.txt")
    if(!file.exists(expandedFileName)) {
        message("Unzipping Data")
        unzip(zipFileName, exdir = path)
    }
    expandedFileName

}