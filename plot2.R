library(lubridate)
powerdata<-read.table("household_power_consumption.txt",sep=";",stringsAsFactors = FALSE,skip=1,col.names = c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3"))

subsetdata<-powerdata[grep("^[1,2]/2/2007",powerdata$Date),]
Global_active_power<-as.numeric(subsetdata$Global_active_power)

subsetdata$Timestamp <- strptime(paste(subsetdata$Date, subsetdata$Time), "%d/%m/%Y %H:%M:%S") 

dev.copy(png,file="plot2.png",width=480,height=480)
par(mar=c(4,4,2,0),oma=c(0,0,5,0))

plot(subsetdata$Timestamp, Global_active_power, type = "l", xlab = "", ylab = "Global Active Power(kilowatts)")
dev.off()