#reading in data and subsetting
data <- read.csv(file = "household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors = FALSE)
data$Date <- as.Date(data$Date, "%d/%m/%Y")
dataForPlot <- subset(data, data$Date=="2007-02-01" | data$Date=="2007-02-02")

#reformatting data
dataForPlot$Sub_metering_1 <- as.numeric(dataForPlot$Sub_metering_1)
dataForPlot$Sub_metering_2 <- as.numeric(dataForPlot$Sub_metering_2)
dataForPlot$Sub_metering_3 <- as.numeric(dataForPlot$Sub_metering_3)
dateAndTime <- paste(dataForPlot$Date, dataForPlot$Time)
dataForPlot$dateAndTime <- as.POSIXct(dateAndTime)

#plotting
png("plot3.png", width=480, height=480)
plot(dataForPlot$Sub_metering_1~dataForPlot$dateAndTime, type = "l", ylab="Energy sub metering", xlab = "")
lines(dataForPlot$Sub_metering_2~dataForPlot$dateAndTime, type = "l", col="red")
lines(dataForPlot$Sub_metering_3~dataForPlot$dateAndTime, type = "l", col="blue")
legend("topright", lty=1, lwd=2, c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black", "red", "blue"))
dev.off()