# plot1
## download data file
URL <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(URL, destfile="./Dataset.zip")
## Unzip files to working folder
unzip(zipfile="./Dataset.zip")
## read txt file into table 
data_temp <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, stringsAsFactors = FALSE, dec = ".")

## subset to only include 2/1/2007 and 2/2/2007. Note, field is in day/month/year format.
plot1 <- subset(data_temp, Date %in% c("1/2/2007","2/2/2007"))
# create plot
png("plot1.png", width=480, height=480)
# histogram
with(plot1, hist(as.numeric(Global_active_power), col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)", ylab = "Frequency"))
dev.off()  ## Don't forget to close the PNG device!

