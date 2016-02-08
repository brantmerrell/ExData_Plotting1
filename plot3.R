# clear workspace
rm(list=ls())
# load data saved from 'refine dataset.R' 
load("consumption.RData")

# read data
consumption <- read.csv2("household_power_consumption.txt",
                         na.strings = "?")

# convert data to YYYY-MM-DD format
consumption$Date <- strptime(consumption$Date, format="%d/%m/%Y")

# subset dataset to target dates February 1 and 2, 2007
consumption<-consumption[consumption$Date %in% c("2007-02-01","2007-02-02"),]

# sample 3 distinct colors; start with a vector of length 3
sampleColors <- rep("",3)

# select first color from darks
sampleColors[1] <- sample(colors()[grepl("dark",colors())],1)

# select second color from reds
sampleColors[2] <- sample(colors()[grepl("red",colors())],1)

# select third color from blues
sampleColors[3] <- sample(colors()[grepl("blue",colors())],1)

# inspect colors
plot(length(sampleColors):1, 
     col = sampleColors, 
     xlim = c(1,length(sampleColors)*1.5))
legend("right",
       legend = sampleColors, 
       fill = sampleColors)
# for undesirable colors, re-run corresponding line

# open graphics device
png("plot3.png")

# plot Sub_metering_1
plot(as.numeric(consumption$Sub_metering_1),
     col = sampleColors[1],
     ylab = "Energy sub metering",
     xaxt = 'n', 
     xlab = "",
     type = 'l',
     ylim = c(0,40))

# label Thursday, Friday, Saturday
axis(1, at = seq(1,nrow(consumption),length.out = 3), labels = c("Thu","Fri","Sat"))

# add Sub_metering 2 and 3
lines(as.numeric(consumption$Sub_metering_2),
      col = sampleColors[2])
lines(as.numeric(consumption$Sub_metering_3),
      col = sampleColors[3])

# add legend
legend("topright",
       legend = paste("Sub_metering",1:3,sep = "_"),
       fill = sampleColors)

# close graphics device
dev.off()
