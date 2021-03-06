#Read file from working directory
dataAll <- read.csv2("./household_power_consumption.txt", header = TRUE, dec = ".", stringsAsFactors = FALSE)

#Subset
data <- subset(dataAll, Date == "1/2/2007" | Date == "2/2/2007")

#Plot
#Plot
datetime <- strptime(paste(data$Date, data$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
par(mfrow = c(2, 2)) 

plot(datetime, as.numeric(data$Global_active_power), type="l", xlab="", ylab="Global Active Power", cex=0.2)

plot(datetime, as.numeric(data$Voltage), type="l", xlab="datetime", ylab="Voltage")

plot(datetime, as.numeric(data$Sub_metering_1), xlab = "", ylab = "Energy Submetering", type = "l")
lines(datetime, as.numeric(data$Sub_metering_2), type="l", col="red")
lines(datetime, as.numeric(data$Sub_metering_3), type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")

plot(datetime, as.numeric(data$Global_reactive_power), type="l", xlab="datetime", ylab="Global_reactive_power")

dev.copy(png, file = "plot4.png", width=480, height=480)
dev.off()
