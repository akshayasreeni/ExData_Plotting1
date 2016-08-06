library(lubridate)

powerdata<-read.table("household_power_consumption.txt",sep=";",stringsAsFactors = FALSE,skip=1,col.names = c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3"))
subsetdata<-powerdata[grep("^[1,2]/2/2007",powerdata$Date),]
Global_active_power<-as.numeric(subsetdata$Global_active_power)

Sub_metering_1<-as.numeric(subsetdata$Sub_metering_1)
Sub_metering_2<-as.numeric(subsetdata$Sub_metering_2)
Sub_metering_3<-as.numeric(subsetdata$Sub_metering_3)


subsetdata$Timestamp <- strptime(paste(subsetdata$Date, subsetdata$Time), "%d/%m/%Y %H:%M:%S") 

dev.copy(png,file="plot3.png",width=480,height=480)
par(mar=c(4,4,2,0),oma=c(0,0,5,0))

plot(subsetdata$Timestamp, Sub_metering_1, type = "l", xlab = "", ylab = "Energy Sub Metering")
lines(subsetdata$Timestamp,Sub_metering_2, type = "l",col="red")
lines(subsetdata$Timestamp,Sub_metering_3, type = "l",col="blue")
legend("topright",lty = 1,col=c("Black", "red", "blue"),legend = c( "Sub_metering_1", "Sub_metering_2", "Sub_metering_3") )

dev.off()