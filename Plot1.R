library(data.table)
#Data Preparation
ds<-read.csv("C:\\Users\\GJacoel\\Desktop/Coursera/Exploratory Analysis/household_power_consumption.txt",sep = ";")
setwd("C:\\Users\\GJacoel\\Desktop/Coursera/Exploratory Analysis")
ds$Time<-strptime(paste(ds$Date, ds$Time, sep=" "),"%d/%m/%Y %H:%M:%S")
ds$Date<-as.Date(ds$Date,format="%d/%m/%Y")
ds_s<-ds[ds$Date>="2007-02-01" & ds$Date<="2007-02-02",]
ds_s$Global_active_power<-as.character(ds_s$Global_active_power)
ds_s$Global_active_power<-as.double(ds_s$Global_active_power)

#Drawing Plot
png(filename = "plot1.png",width = 480,height = 480)
hist(ds_s$Global_active_power,col="red",main="Global active power",xlab = "Global Active Power (kilowatts)",ylab = "Frequency")
dev.off()

