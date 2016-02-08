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
consumption <- read.csv2("household_power_consumption.txt",
                         na.strings = "?")

# convert data to YYYY-MM-DD format
consumption$Date <- strptime(consumption$Date, format="%d/%m/%Y")

# subset dataset to target dates February 1 and 2, 2007
consumption<-consumption[consumption$Date %in% c("2007-02-01","2007-02-02"),]

# sample 6 colors, ensuring the "energy sub metering" colors are distinct from each other
sampleColors <- rep("",6)
sampleColors[1] <- sample(colors(),1)
sampleColors[2] <- sample(colors(),1)
sampleColors[3] <- sample(colors()[grepl("dark",colors())],1)
sampleColors[4] <- sample(colors[grepl("red",colors)],1)
sampleColors[5] <- sample(colors[grepl("blue",colors)],1)
sampleColors[6] <- sample(colors,1)

# inspect colors
plot(length(sampleColors):1, 
     col = sampleColors, 
     xlim = c(1,length(sampleColors)*1.5))
legend("right",
       legend = sampleColors,
       fill = sampleColors) 
# for undesirable colors, re-run corresponding line

# open graphics device
png("plot4.png")

# specify two rows & two columns for the plot
par(mfrow = c(2,2))

# for the topleft plot, repeat plot2
# sampleColors <- sample(colors(distinct = T),1) # select a color
plot(x=as.ts(consumption$Global_active_power),
     ylab = "Global Active Power (kilowatts)",
     xaxt = 'n', # remove automated x axis labels
     col = sampleColors[1])
axis(1, at = seq(1,nrow(consumption),length.out = 3), labels = c("Thu","Fri","Sat"))

# for the topright, plot voltage
# sampleColors <- sample(colors(distinct = T),1) # select a color
plot(x = as.ts(consumption$Voltage),
     ylab = "Voltage",
     xaxt = 'n',
     col = sampleColors[2],
     xlab = "datetime")

# for the bottomleft, repeat plot3
# sampleColors <- sample(colors(distinct = T),1) # select a color
plot(as.numeric(consumption$Sub_metering_1),
     col = sampleColors[3],
     ylab = "Energy sub metering",
     xaxt = 'n',
     xlab = "",
     type = 'l',
     ylim = c(0,40))

# label Thursday, Friday, Saturday
axis(1, at = seq(1,nrow(consumption),length.out = 3), labels = c("Thu","Fri","Sat"))

# add Sub_metering 2 and 3
lines(as.numeric(consumption$Sub_metering_2),
      col = sampleColors[4])
lines(as.numeric(consumption$Sub_metering_3),
      col = sampleColors[5])
legend("topright",
       legend = paste("Sub_metering",1:3,sep = "_"),
       fill = sampleColors[3:5])

# for the bottomright, plot global reactive power
# sampleColors <- sample(colors(distinct = T),1) # select a color
plot(x = as.ts(consumption$Global_reactive_power),
     ylab = "Global_reactive_power",
     xaxt = 'n',
     xlab = "datetime",
     col = sampleColors[6])

# close graphics device
dev.off()
