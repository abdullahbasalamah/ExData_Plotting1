download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",destfile="week1_4.zip",method="curl")
unzip("week1_4.zip")

fulldata<-read.table("household_power_consumption.txt",sep=";",head=TRUE,stringsAsFactors=FALSE, dec=".")
fulldata$datetime<-as.POSIXlt(strptime(paste(fulldata$Date,fulldata$Time),"%d/%m/%Y %H:%M:%S"))
fulldata$Date<-as.Date(strptime(fulldata$Date,"%d/%m/%Y"))
datause<-fulldata[fulldata$Date>=as.Date(strptime("1/2/2007","%d/%m/%Y")) & fulldata$Date<=as.Date(strptime("2/2/2007","%d/%m/%Y")),]

datause$Global_active_power<-as.numeric(datause$Global_active_power)

datause$Global_reactive_power<-as.numeric(datause$Global_reactive_power)
datause$Voltage<-as.numeric(datause$Voltage)
datause$Global_intensity<-as.numeric(datause$Global_intensity)

datause$Sub_metering_1<-as.numeric(datause$Sub_metering_1)
datause$Sub_metering_2<-as.numeric(datause$Sub_metering_2)

png(filename="plot4.png",width=480,height=480)
par(mfrow=c(2,2))
with(datause,{plot(datetime,Global_active_power,type="l",xlab="",ylab="Golbal Active Power")
  plot(datetime,Voltage,type="l",xlab="datetime",ylab="Voltage")
  })
with(datause,{plot(datetime,Sub_metering_1,type="l",xlab="",ylab="Energy Sub Metering")
  lines(datetime,Sub_metering_2,type="l",col="red")
  lines(datetime,Sub_metering_3,type="l",col="blue")
})
legend("topright",col=c("black","red","blue"),legend=c("sub_metering_1","sub_metering_2","sub_metering_3"),lty=1,lwd=2)

with(datause,plot(datetime,Global_reactive_power,type="l",xlab="datetime",ylab="Golbal Reactive Power"))

dev.off()
