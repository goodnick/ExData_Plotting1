## source the data loading file if it hasn't been sourced already
if(!exists("readHousePowerConsumptionData", mode="function")) {
    source("ReadData.R")
}

## Create plot 3 and create png file
createPlot3File <- function() {
    filename <- "plot3.png"
    png(filename = filename, bg = "transparent")
    generatePlot3()
    dev.off()
    message(paste("plot3 created -", filename))

}

## Generate plot 3 on the current device.
generatePlot3 <- function () {
    houseData <- readHousePowerConsumptionData()
    plot(houseData$Time, houseData$Sub_metering_1, type = "l", xlab = "",
         ylab = "Energy sub metering")
    lines(houseData$Time, houseData$Sub_metering_2, col = "red")
    lines(houseData$Time, houseData$Sub_metering_3, col = "blue")

    legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
           col = c("black", "red", "blue"), lty = "solid")
}