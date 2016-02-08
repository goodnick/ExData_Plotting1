if(!exists("readHousePowerConsumptionData", mode="function")) {
    source("ReadData.R")
}

createPlot2File <- function() {
    filename <- "plot2.png"
    png(filename = filename, bg = "transparent")
    generatePlot2()

    dev.off()
    message(paste("plot2 created -", filename))

}

generatePlot2 <- function () {
    houseData <- readHousePowerConsumptionData()
    plot(houseData$Time, houseData$Global_active_power, type="l",
         xlab = "", ylab = "Global Active Power (kilowatts)")

}