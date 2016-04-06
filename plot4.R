# plot4
library(lubridate)
library(dplyr)
## download data file
URL <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(URL, destfile="./Dataset.zip")
## Unzip files to working folder
unzip(zipfile="./Dataset.zip")
## read txt file into table 
data_temp <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, stringsAsFactors = FALSE, na.strings = "?", dec = ".")
## subset to only include 2/1/2007 and 2/2/2007
plot4 <- subset(data_temp, Date %in% c("1/2/2007","2/2/2007"))
# day is combined date and time as x-axis
plot4 <- mutate(plot4, day = parse_date_time(paste(Date,Time), "dmyHMS"))
## create plot
png("plot4.png", width=480, height=480)
## set up grid
## top left(1), bottom left(2), top right(3), bottom right(4)
par(mfcol = c(2,2))
##(1)
with(plot4, plot(day, as.numeric(Global_active_power), type="l", xlab="", ylab="Global Active Power"))
##(2)
with(plot4, plot(day, as.numeric(Sub_metering_1), type="l", ylab="Energy sub metering", xlab=""))
with(plot4, lines(day, as.numeric(Sub_metering_2), type="l", col="red"))
with(plot4, lines(day, as.numeric(Sub_metering_3), type="l", col="blue"))
legend("topright", bty ="n", lwd = 2, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
##(3)
with(plot4, plot(day, as.numeric(Voltage), type="l", xlab="datetime", ylab="Voltage"))
##(4)
with(plot4, plot(day, as.numeric(Global_reactive_power), type="l", xlab="datetime", ylab="Global_reactive_power"))
#axis(side = 2, at = seq(0.0, 0.5, 0.1))
dev.off()  ## Don't forget to close the PNG device!
