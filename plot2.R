#reading in data and subsetting
data <- read.csv(file = "household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors = FALSE)
data$Date <- as.Date(data$Date, "%d/%m/%Y")
dataForPlot <- subset(data, data$Date=="2007-02-01" | data$Date=="2007-02-02")

#reformatting data
dataForPlot$Global_active_power <- as.numeric(dataForPlot$Global_active_power)
dateAndTime <- paste(dataForPlot$Date, dataForPlot$Time)
dataForPlot$dateAndTime <- as.POSIXct(dateAndTime)

#plotting
plot(dataForPlot$Global_active_power~dataForPlot$dateAndTime, type = "l", ylab="Global Active Power (kilowatts)", xlab = "")

#copy to png
dev.copy(png,'plot2.png', height=480, width=480)
dev.off()