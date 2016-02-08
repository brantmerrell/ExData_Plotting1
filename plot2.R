# clear workspace
rm(list=ls())

# read data
consumption <- read.csv2("household_power_consumption.txt",
                         na.strings = "?")

# convert data to YYYY-MM-DD format
consumption$Date <- strptime(consumption$Date, format="%d/%m/%Y")

# subset dataset to target dates February 1 and 2, 2007
consumption<-consumption[consumption$Date %in% c("2007-02-01","2007-02-02"),]

# select a color
sampleColors <- sample(colors(),1)

# inspect color
plot(length(sampleColors):1,
     col = sampleColors)
legend("right",
       legend = sampleColors, 
       fill = sampleColors)
# if undesirable, resample

# open graphics device
png("plot2.png")

# plot global active power:
plot(x=as.ts(consumption$Global_active_power), # works best as time series
     ylab = "Global Active Power (kilowatts)", # label
     xaxt = 'n', # remove automated x axis labels
     col = sampleColors) # color

# label Thursday, Friday, Saturday
axis(1, at = seq(1,nrow(consumption),length.out = 3), labels = c("Thu","Fri","Sat"))

# close graphics device
dev.off()
