# plot2
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
plot2 <- subset(data_temp, Date %in% c("1/2/2007","2/2/2007"))
#str(plot2)
# add day column - combined datetime
plot2 <- mutate(plot2, day = parse_date_time(paste(Date,Time), "dmyHMS"))
str(plot2)        
## create plot
png("plot2.png", width=480, height=480)
#plot(day, gap, type="l", xlab="", ylab="Global Active Power (kilowatts)")
with(plot2, plot(day, as.numeric(Global_active_power), type="l", xlab="", ylab="Global Active Power (kilowatts)"))
dev.off()  ## Don't forget to close the PNG device!
