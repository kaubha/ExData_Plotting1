#Read file from working directory
dataAll <- read.csv2("./household_power_consumption.txt", header = TRUE, dec = ".", stringsAsFactors = FALSE)

#Subset
data <- subset(dataAll, Date == "1/2/2007" | Date == "2/2/2007")

#Plot
datetime <- strptime(paste(data$Date, data$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
plot(datetime, as.numeric(data$Sub_metering_1), xlab = "", ylab = "Energy Submetering", type = "l")
lines(datetime, as.numeric(data$Sub_metering_2), type="l", col="red")
lines(datetime, as.numeric(data$Sub_metering_3), type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
dev.copy(png, file = "plot3.png", width=480, height=480)
dev.off()