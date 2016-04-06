# plot3
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
plot3 <- subset(data_temp, Date %in% c("1/2/2007","2/2/2007"))
# day is combined date and time as x-axis
plot3 <- mutate(plot3, day = parse_date_time(paste(Date,Time), "dmyHMS"))
## create plot
png("plot3.png", width=480, height=480)
with(plot3, plot(day, as.numeric(Sub_metering_1), type="l", ylab="Energy Submetering", xlab=""))
with(plot3, lines(day, as.numeric(Sub_metering_2), type="l", col="red"))
with(plot3, lines(day, as.numeric(plot3$Sub_metering_3), type="l", col="blue"))
## add legend
legend("topright", lwd = 2.5, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()  ## Don't forget to close the PNG device!
