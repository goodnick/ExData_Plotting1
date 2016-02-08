if(!exists("readHousePowerConsumptionData", mode="function")) {
    source("ReadData.R")
}

createPlot1File <- function () {
    filename <- "plot1.png"
    png(filename = filename, bg = "transparent")
    generatePlot1()
    dev.off()
    message(paste("plot1 created -", filename))

}

generatePlot1 <- function() {
    houseData <- readHousePowerConsumptionData()
    hist(houseData$Global_active_power, col = "red", main = "Global Active Power",
         xlab = "Global Active Power (kilowatts)")

}
