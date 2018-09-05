## A. Read file. Command commented out to prevent repeated read execution for large file.
## data <- read.csv("household_power_consumption.txt", header=TRUE, sep=";", na.strings = '?' )

## B. Subset required data
data2days <- subset(data, Date=="1/2/2007"|Date=="2/2/2007")

## C. Create a png file with desired dimentions 
png(filename="Plot1.png", height = 480, width = 480)

## D. Create the histogram and close the device
hist(data2days$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency")
dev.off(dev.cur())