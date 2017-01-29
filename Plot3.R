library(data.table)

#Data Preparation
ds<-read.csv("C:\\Users\\GJacoel\\Desktop/Coursera/Exploratory Analysis/household_power_consumption.txt",sep = ";")
setwd("C:\\Users\\GJacoel\\Desktop/Coursera/Exploratory Analysis")
ds$Time<-strptime(paste(ds$Date, ds$Time, sep=" "),"%d/%m/%Y %H:%M:%S")
ds$Date<-as.Date(ds$Date,format="%d/%m/%Y")
ds_s<-ds[ds$Date>="2007-02-01" & ds$Date<="2007-02-02",]
ds_s$Sub_metering_1<-as.numeric(as.character(ds_s$Sub_metering_1))
ds_s$Sub_metering_2<-as.numeric(as.character(ds_s$Sub_metering_2))
ds_s$Sub_metering_3<-as.numeric(as.character(ds_s$Sub_metering_3))

#drawing plot3
png(filename = "plot3.png",width = 480,height = 480)
plot(ds_s$Time,ds_s$Sub_metering_1,type = "l",xlab = "",ylab = "Energy sub metering")
lines(ds_s$Time,ds_s$Sub_metering_2, col="red")
lines(ds_s$Time,ds_s$Sub_metering_3, col="blue")
legend("topright", legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col=c("black","red","blue"), lty="solid")
dev.off()