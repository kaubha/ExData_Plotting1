#Read file from working directory
dataAll <- read.csv2("./household_power_consumption.txt", header = TRUE, dec = ".", stringsAsFactors = FALSE)

#Subset
data <- subset(dataAll, Date == "1/2/2007" | Date == "2/2/2007")

#Plot
hist(as.numeric(data$Global_active_power), col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.copy(png, file = "plot1.png", width=480, height=480)
dev.off()
