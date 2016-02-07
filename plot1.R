if(!exists("readHousePowerConsumptionData", mode="function")) {
    source("ReadData.R")
}

createPlot1 <- function () {
    filename <- "plot1.png"
    png(filename = filename, bg = "transparent")

    houseData <- readHousePowerConsumptionData()
    hist(houseData$Global_active_power, col = "red", main = "Global Active Power",
         xlab = "Global Active Power (kilowatts")

    dev.off()
    message(paste("plot1 create -", filename))
}
