<<<<<<< HEAD
jpeg(filename="C:/users/josh/documents/exdata_plotting1/ExData_plotting1/histogram.jpeg")
jpeg(filename="C:/users/josh/documents/exdata_plotting1/ExData_plotting1/globalactivepower.jpeg")
jpeg(filename="C:/users/josh/documents/exdata_plotting1/ExData_plotting1/energysubmetering.jpeg")
jpeg(filename="C:/users/josh/documents/exdata_plotting1/ExData_plotting1/mfrow2x2.jpeg")

=======
>>>>>>> b1349fed160c88aaa4cfd3b85f0341a7eb845553
data<-read.csv2("C:/users/josh/downloads/exdata-data-household_power_consumption/household_power_consumption.txt",
                colClasses="character",
                col.names=c("Date","Time","Global_Active_Power","Global_Reactive_Power",
                            "Voltage","Global_Intensity",
                            "Sub_metering_1","Sub_metering_2","Sub_metering_3"),
                nrows=as.integer(2075259*0.05))
<<<<<<< HEAD
=======
data$DateTime <- as.POSIXct(paste(data$Date, data$Time), format="%d/%m/%Y %H:%M:%S") 
>>>>>>> b1349fed160c88aaa4cfd3b85f0341a7eb845553
data$Date<-strptime(data$Date, format="%d/%m/%Y")
data<-data[data$Date=="2007-02-01" | 
             data$Date=="2007-02-02",]
data$Time<-strptime(data$Time, format="%H:%M:%S")
<<<<<<< HEAD
data$DateTime <- strptime(paste(data$Date, data$Time), format="%Y-%m-%d %H:%M:%S")
=======
>>>>>>> b1349fed160c88aaa4cfd3b85f0341a7eb845553
data$Global_Active_Power<-as.numeric(data$Global_Active_Power)
data$Global_Reactive_Power<-as.numeric(data$Global_Reactive_Power)
data$Voltage<-as.numeric(data$Voltage)
data$Global_Intensity<-as.numeric(data$Global_Intensity)
data$Sub_metering_1<-as.numeric(data$Sub_metering_1)
data$Sub_metering_2<-as.numeric(data$Sub_metering_2)
data$Sub_metering_3<-as.numeric(data$Sub_metering_3)

if(nrow(data)!=2880){warning("Data does not show (2days x 24hours x 60 minutes) 2880 observations")}

par(mar=c(2,2,2,2), mfrow=c(1,1))
with(data, hist(Global_Active_Power,
                main="Global Active Power",
                xlab="Global Active Power (kilowatts)",
                ylab="Frequency",
                col="red"))
<<<<<<< HEAD
par(mar=c(2,4,2,4), oma=c(1,1,1,1), mfrow=c(1,1))
with(data,plot(DateTime, Global_Active_Power, 
               type="l",
               ylab="Global Active Power (kilowatts)",
               xlab=""),
     axis(1,at=c("2007-02-01 CST","2007-02-02 CST","2007-02-03 CST"), labels=c("Thu","Fri","Sat")))
par(mar=c(2,4,2,4), oma=c(1,1,1,1), mfrow=c(1,1))
with(data, plot(DateTime, Sub_metering_1, type="l", xlab="Date/Time",ylab="Energy sub metering"))
with(data, lines(DateTime, Sub_metering_2, col = "red"))
with(data, lines(DateTime, Sub_metering_3, "s", col = "blue"))



par(mar=c(1,1,1,1), mfrow=c(2,2))
with(data, hist(Global_Active_Power,
                main="Global Active Power",
                xlab="Global Active Power (kilowatts)",
                ylab="Frequency",
                col="red"))
with(data, plot(DateTime, Voltage, "l"))
with(data, plot(DateTime, Sub_metering_1, "l"))
with(data, lines(DateTime, Sub_metering_2, col = "red"))
with(data, lines(DateTime, Sub_metering_3, col = "blue"))
with(data, plot(DateTime, Global_Active_Power, "l"))
dev.off()
=======

>>>>>>> b1349fed160c88aaa4cfd3b85f0341a7eb845553
