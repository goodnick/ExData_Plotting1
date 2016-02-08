## source the data loading file if it hasn't been sourced already
if(!exists("readHousePowerConsumptionData", mode="function")) {
    source("ReadData.R")
}

## Create plot 4 and png file
createPlot4File <- function() {
    filename <- "plot4.png"
    png(filename = filename, bg = "transparent")
    generatePlot4()
    dev.off()
    message(paste("plot4 created -", filename))

}

## Generate plot 4 on the current device
generatePlot4 <- function () {
    par(mfcol = c(2,2))
    houseData <- readHousePowerConsumptionData()

    ## first plot
    plot(houseData$Time, houseData$Global_active_power, type="l",
         xlab = "", ylab = "Global Active Power")

    ## Second plot
    plot(houseData$Time, houseData$Sub_metering_1, type = "l", xlab = "",
         ylab = "Energy sub metering")
    lines(houseData$Time, houseData$Sub_metering_2, col = "red")
    lines(houseData$Time, houseData$Sub_metering_3, col = "blue")

    legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
           col = c("black", "red", "blue"), lty = "solid", box.lwd = 0)

    ## Third plot
    plot(houseData$Time, houseData$Voltage, type="l",
         xlab = "datetime", ylab = "Voltage")

    ## Fourth plot
    plot(houseData$Time, houseData$Global_reactive_power, type="l",
         xlab = "datetime", ylab = "Global_reactive_power")
}