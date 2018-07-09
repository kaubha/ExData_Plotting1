#Read file from working directory
dataAll <- read.csv2("./household_power_consumption.txt", header = TRUE, dec = ".", stringsAsFactors = FALSE)

#Subset
data <- subset(dataAll, Date == "1/2/2007" | Date == "2/2/2007")

#Plot
datetime <- strptime(paste(data$Date, data$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
plot(datetime, as.numeric(data$Global_active_power), xlab = "", ylab = "Global Active Power (kilowatts)", type = "l")
dev.copy(png, file = "plot2.png", width=480, height=480)
dev.off()
