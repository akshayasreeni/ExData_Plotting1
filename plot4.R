library(lubridate)

powerdata<-read.table("household_power_consumption.txt",sep=";",stringsAsFactors = FALSE,skip=1,col.names = c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3"))

subsetdata<-powerdata[grep("^[1,2]/2/2007",powerdata$Date),]
Global_active_power<-as.numeric(subsetdata$Global_active_power)
Global_reactive_power<-as.numeric(subsetdata$Global_reactive_power)
Voltage<-as.numeric(subsetdata$Voltage)

Sub_metering_1<-as.numeric(subsetdata$Sub_metering_1)
Sub_metering_2<-as.numeric(subsetdata$Sub_metering_2)
Sub_metering_3<-as.numeric(subsetdata$Sub_metering_3)


subsetdata$Timestamp <- strptime(paste(subsetdata$Date, subsetdata$Time), "%d/%m/%Y %H:%M:%S") 

dev.copy(png,file="p.png")

par(mfrow=c(2,2))
par(mar=c(6, 4, 3, 0))

plot(subsetdata$Timestamp, Global_active_power, type = "l", xlab = "", ylab = "Global Active Power")

plot(subsetdata$Timestamp, Voltage, type = "l", xlab = "datetime", ylab = "Voltage")

par(mar=c(4, 4, 0, 0))
plot(subsetdata$Timestamp, Sub_metering_1, type = "l", xlab = "", ylab = "Energy Sub Metering")
lines(subsetdata$Timestamp,Sub_metering_2, type = "l",col="red")
lines(subsetdata$Timestamp,Sub_metering_3, type = "l",col="blue")
legend("topright",lty = 1,col=c("Black", "red", "blue"),legend = c( "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

plot(subsetdata$Timestamp, Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power")


dev.off()
subsetdata<-powerdata[grep("^[1,2]/2/2007",powerdata$Date),]
Global_active_power<-as.numeric(subsetdata$Global_active_power)
Global_reactive_power<-as.numeric(subsetdata$Global_reactive_power)
Voltage<-as.numeric(subsetdata$Voltage)

Sub_metering_1<-as.numeric(subsetdata$Sub_metering_1)
Sub_metering_2<-as.numeric(subsetdata$Sub_metering_2)
Sub_metering_3<-as.numeric(subsetdata$Sub_metering_3)


subsetdata$Timestamp <- strptime(paste(subsetdata$Date, subsetdata$Time), "%d/%m/%Y %H:%M:%S") 

dev.copy(png,file="plot4.png",width=480,height=480)

par(mfrow=c(2,2))
par(mar=c(6, 4, 3, 2))

plot(subsetdata$Timestamp, Global_active_power, type = "l", xlab = "", ylab = "Global Active Power")

plot(subsetdata$Timestamp, Voltage, type = "l", xlab = "datetime", ylab = "Voltage")

par(mar=c(4, 4, 0, 2))
plot(subsetdata$Timestamp, Sub_metering_1, type = "l", xlab = "", ylab = "Energy Sub Metering")
lines(subsetdata$Timestamp,Sub_metering_2, type = "l",col="red")
lines(subsetdata$Timestamp,Sub_metering_3, type = "l",col="blue")
legend("topright",lty = 1,col=c("Black", "red", "blue"),legend = c( "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

plot(subsetdata$Timestamp, Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power")


dev.off()