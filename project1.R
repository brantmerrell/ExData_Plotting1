
File<-list.files(getwd(),"household_.+\\.txt$",full.names=T,recursive=T)
DF<-read.csv2(File,nrows=as.integer(2075259*0.05))
DF$DateTime <- as.POSIXct(paste(DF$Date, DF$Time), format="%d/%m/%Y %H:%M:%S") 
DF$Date<-strptime(DF$Date, format="%d/%m/%Y")
DF<-DF[DF$Date %in% c("2007-02-01","2007-02-02"),]
DF$Time<-strptime(DF$Time, format="%H:%M:%S")
head(DF$DateTime)
colnames(DF)
Global_Active_Power<-as.numeric(DF$Global_active_power)
Global_Reactive_Power<-as.numeric(DF$Global_reactive_power)
Voltage<-as.numeric(DF$Voltage)
Global_Intensity<-as.numeric(DF$Global_intensity)
Sub_metering_1<-as.numeric(DF$Sub_metering_1)
Sub_metering_2<-as.numeric(DF$Sub_metering_2)
Sub_metering_3<-as.numeric(DF$Sub_metering_3)

if(nrow(DF)!=2880){warning("DF does not show (2days x 24hours x 60 minutes) 2880 observations")}

png(filename="./exdata_plotting1/Plot 2.png")
par(mar=c(2,4,2,4), oma=c(1,1,1,1), mfrow=c(1,1))
with(DF,plot(DateTime, Global_Active_Power, 
             type="l",
             ylab="Global Active Power (kilowatts)",
             xlab=""),
     axis(1,at=c("2007-02-01 CST","2007-02-02 CST","2007-02-03 CST"), labels=c("Thu","Fri","Sat")))
dev.off()


par(mar=c(2,4,2,4), oma=c(1,1,1,1), mfrow=c(1,1))
with(DF, plot(DateTime, Sub_metering_1, type="l", xlab="Date/Time",ylab="Energy sub metering"))
with(DF, lines(DateTime, Sub_metering_2, col = "red"))
with(DF, lines(DateTime, Sub_metering_3, "s", col = "blue"))
dev.off()

?par
par(mar=c(1,1,1,1), mfrow=c(1,2))
with(DF, hist(Global_Active_Power,
              main="Global Active Power",
              xlab="Global Active Power (kilowatts)",
              ylab="Frequency",
              col="red"))
with(DF, plot(DateTime, Voltage, "l"))
png(filename="./exdata_plotting1/Plot 2.png")
with(DF, plot(DateTime, Sub_metering_1, "l"))
with(DF, lines(DateTime, Sub_metering_2, col = "red"))
with(DF, lines(DateTime, Sub_metering_3, col = "blue"))
with(DF, plot(DateTime, Global_Active_Power, "l"))
dev.off()
