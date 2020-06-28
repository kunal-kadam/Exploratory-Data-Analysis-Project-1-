house <- read.table("household_power_consumption.txt", header = T, sep = ";", na.strings = "?")
# convert the date variable to Date class
house$Date <- as.Date(house$Date, format = "%d/%m/%Y")

# Subset the data
house <- subset(house, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))

# Convert dates and times
house$datetime <- strptime(paste(house$Date, house$Time), "%Y-%m-%d %H:%M:%S")

# Plot 2
house$datetime <- as.POSIXct(house$datetime)
attach(house)
plot(Global_active_power ~ datetime, type = "l",
     ylab = "Global Active Power (kilowatts)", xlab = "")
dev.copy(png, file = "plot2.png", height = 480, width = 480)
dev.off()
detach(house)
