## source the data loading file if it hasn't been sourced already
if(!exists("readHousePowerConsumptionData", mode="function")) {
    source("ReadData.R")
}

## Create plot 2 and the png file
createPlot2File <- function() {
    filename <- "plot2.png"
    png(filename = filename, bg = "transparent")
    generatePlot2()

    dev.off()
    message(paste("plot2 created -", filename))

}

## Generate plot 2 on the current device
generatePlot2 <- function () {
    houseData <- readHousePowerConsumptionData()
    plot(houseData$Time, houseData$Global_active_power, type="l",
         xlab = "", ylab = "Global Active Power (kilowatts)")

}