# clear workspace
rm(list=ls())

# download dataset:
download.file(
  url = "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",
  destfile = "raw data (zip)",
  mode='wb', cacheOK=FALSE
)

# unzip file:
unzip("raw data (zip)")

# read data
consumption <- fread("household_power_consumption.txt",
                     na.strings="?")

# convert data to class 'Date'
consumption$Date <- as.Date(consumption$Date, format="%d/%m/%Y")

fromDate <- as.Date("2007-02-01"); toDate   <- as.Date("2007-02-02")

# subset dataset to target dates February 1 and 2, 2007
consumption<-consumption[(consumption$Date >= fromDate & consumption$Date <= toDate),]

# open graphics device
png("plot1.png")

# plot histogram of Global Active Power
hist(as.numeric(consumption$Global_active_power), 
     col = "red",
     xlab = "Global Active Power (kilowatts)",
     main = "Global Active Power")

# close graphics device
dev.off()
