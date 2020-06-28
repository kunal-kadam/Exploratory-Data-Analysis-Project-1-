house <- read.table("household_power_consumption.txt", header = T, sep = ";", na.strings = "?")
# convert the date variable to Date class
house$Date <- as.Date(house$Date, format = "%d/%m/%Y")

# Subset the data
house <- subset(house, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))

# Convert dates and times
house$datetime <- strptime(paste(house$Date, house$Time), "%Y-%m-%d %H:%M:%S")

#Plot 4
house$datetime <- as.POSIXct(house$datetime)
par(mfrow = c(2, 2))
attach(house)
plot(Global_active_power ~ datetime, type = "l", ylab = "Global Active Power", 
     xlab = "")
plot(Voltage ~ datetime, type = "l")
plot(Sub_metering_1 ~ datetime, type = "l", ylab = "Energy sub metering", 
     xlab = "")
lines(Sub_metering_2 ~ datetime, col = "Red")
lines(Sub_metering_3 ~ datetime, col = "Blue")
legend("topright", lty = 1, col = c("black", "red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),bty = "n")

plot(Global_reactive_power ~ datetime, type = "l")

dev.copy(png, file = "plot4.png", height = 480, width = 480)
dev.off()
detach(house)

