if(!exists("readHousePowerConsumptionData", mode="function")) {
    source("ReadData.R")
}

createPlot2 <- function () {
    filename <- "plot2.png"
    png(filename = filename, bg = "transparent")

    houseData <- readHousePowerConsumptionData()
    plot(houseData$Time, houseData$Global_active_power, type="l",
         xlab = "", ylab = "Global Active Power (kilowatts")

    dev.off()
    message(paste("plot2 created -", filename))
}