if(!exists("readHousePowerConsumptionData", mode="function")) {
    source("ReadData.R")
}

createPlot4File <- function() {
    filename <- "plot4.png"
    png(filename = filename, bg = "transparent")
    generatePlot4()
    dev.off()
    message(paste("plot4 created -", filename))

}
generatePlot4 <- function () {
    par(mfcol = c(2,2))
    houseData <- readHousePowerConsumptionData()

    plot(houseData$Time, houseData$Global_active_power, type="l",
         xlab = "", ylab = "Global Active Power")

    plot(houseData$Time, houseData$Sub_metering_1, type = "l", xlab = "",
         ylab = "Energy sub metering")
    lines(houseData$Time, houseData$Sub_metering_2, col = "red")
    lines(houseData$Time, houseData$Sub_metering_3, col = "blue")

    legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
           col = c("black", "red", "blue"), lty = "solid", box.lwd = 0)

    plot(houseData$Time, houseData$Voltage, type="l",
         xlab = "datetime", ylab = "Voltage")

    plot(houseData$Time, houseData$Global_reactive_power, type="l",
         xlab = "datetime", ylab = "Global_reactive_power")
}