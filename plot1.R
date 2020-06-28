#Download the txt file in your working directory
house <- read.table("household_power_consumption.txt", sep = ";",header = TRUE, na.strings = "?")
#the text file is converted into tabel format in dataset of 'house'

house$Date <- as.Date(house$Date, format = "%Y-%m-%d") 
#convert the date variable into date format

house$Time <- strptime(house$Time, "%H:%M:%S")
#convert into dates and times

house <- subset(house, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))
# Subset the data

#plot 1

attach(house)
hist(Global_active_power,main = "Global Active Power", xlab = "Global Active Power(kilowatts)",col = "red")

#Save in the png form 
# Save file
dev.copy(png, file = "plot1.png", height = 480, width = 480)
dev.off()
detach(house)
