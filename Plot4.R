library(data.table)
#Data Preparation
ds<-read.csv("C:\\Users\\GJacoel\\Desktop/Coursera/Exploratory Analysis/household_power_consumption.txt",sep = ";")
setwd("C:\\Users\\GJacoel\\Desktop/Coursera/Exploratory Analysis")
ds$Time<-strptime(paste(ds$Date, ds$Time, sep=" "),"%d/%m/%Y %H:%M:%S")
ds$Date<-as.Date(ds$Date,format="%d/%m/%Y")
ds_s<-ds[ds$Date>="2007-02-01" & ds$Date<="2007-02-02",]
ds_s$Global_active_power<-as.character(ds_s$Global_active_power)
ds_s$Global_active_power<-as.double(ds_s$Global_active_power)
ds_s$Voltage<-as.numeric(as.character(ds_s$Voltage))
ds_s$Global_reactive_power<-as.numeric(as.character(ds_s$Global_reactive_power))

png(filename = "plot4.png",width = 480,height = 480)
par(mfrow=c(2,2))
     plot(ds_s$Time, ds_s$Global_active_power, type="l", col="black", xlab="", ylab="Global Active Power (kilowatts)")
     plot(ds_s$Time, ds_s$Voltage, type="l", col="black", xlab="datetime", ylab="Voltage")
      
     plot(ds_s$Time,ds_s$Sub_metering_1,type = "l",xlab = "",ylab = "Energy sub metering")
     lines(ds_s$Time,ds_s$Sub_metering_2, col="red")
     lines(ds_s$Time,ds_s$Sub_metering_3, col="blue")
     legend("topright",lty=1, col=c("black", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
     
     plot(ds_s$Time, ds_s$Global_reactive_power, type="l", col="black", xlab="datetime", ylab="Global_reactive_power")
dev.off()