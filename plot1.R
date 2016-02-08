# clear workspace
rm(list=ls())

# read data
consumption <- read.csv2("household_power_consumption.txt",
                         na.strings = "?")

# convert data to YYYY-MM-DD format
consumption$Date <- strptime(consumption$Date, format="%d/%m/%Y")

# subset dataset to target dates February 1 and 2, 2007
consumption<-consumption[consumption$Date %in% c("2007-02-01","2007-02-02"),]

# select color
sampleColors <- sample(colors(),1)

# inspect
plot(length(sampleColors):1,
     col = sampleColors)
legend("right",
       legend = sampleColors, 
       fill = sampleColors)
# if undesirable, resample

# open graphics device
png("plot1.png")

# plot histogram of Global Active Power
hist(as.numeric(consumption$Global_active_power), 
     col = sampleColors,
     xlab = "Global Active Power (kilowatts)",
     main = "Global Active Power")

# close graphics device
dev.off()
