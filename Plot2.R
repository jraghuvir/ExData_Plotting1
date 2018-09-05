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
##png(filename="Plot2.png", height = 480, width = 480)

## D. Create the histogram and close the device
with(data2days, plot(DT2, Global_active_power, type="l", main="Global Active Power", ylab="Global Active Power (kilowatts)", xlab=NA))
##dev.off(dev.cur())