## source the data loading file if it hasn't been sourced already
if(!exists("readHousePowerConsumptionData", mode="function")) {
    source("ReadData.R")
}

## create plot1 and create png file.
createPlot1File <- function () {
    filename <- "plot1.png"
    png(filename = filename, bg = "transparent")
    generatePlot1()
    dev.off()
    message(paste("plot1 created -", filename))

}

## generate plot 1 on the current device
generatePlot1 <- function() {
    houseData <- readHousePowerConsumptionData()
    hist(houseData$Global_active_power, col = "red", main = "Global Active Power",
         xlab = "Global Active Power (kilowatts)")

}
