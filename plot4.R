## A. Read file. Command commented out to prevent repeated read execution for large file.
## data <- read.csv("household_power_consumption.txt", header=TRUE, sep=";", na.strings = '?' )

## B. Subset required data, convert date, time, weekday format
data2days <- subset(data, Date=="1/2/2007"|Date=="2/2/2007")
data2days$DT <- paste(data2days$Date, data2days$Time)
data2days$DT2 <- strptime(data2days$DT, "%d/%m/%Y %H:%M:%S")
## Alternatively
## data2days$DT2 <- strptime(paste(data2days$Date, data2days$Time), "%d/%m/%Y %H:%M:%S")
library(lubridate)
data2days$weekday <- wday(data2days$DT2, label=TRUE)

## C. Create a png file with desired dimentions 
png(filename="Plot4.png", height = 480, width = 480)

## D. Create the histogram, apply legend and close the device
par(mfrow = c(2, 2), mar = c(4, 4, 2, 1), oma = c(0, 0, 2, 0))
## Plot1
with(data2days, plot(DT2, Global_active_power, type="l", ylab="Global Active Power (kilowatts)", xlab=NA))
## Plot2
with(data2days, plot(DT2, Voltage, type="l", ylab="Voltage", xlab="datetime"))
## Plot3
with(data2days, plot(DT2,Sub_metering_1, type="l", ylab = "Energy sub metering", xlab=NA))
with(data2days, lines(DT2,Sub_metering_2, type="l", col="red"))
with(data2days, lines(DT2,Sub_metering_3, type="l", col="blue"))
legend("topright", cex=0.7, lwd=1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"))
## Plot4
with(data2days, plot(DT2, Global_reactive_power, type="l", ylab="Global_reactive_power", xlab="datetime"))

dev.off(dev.cur())