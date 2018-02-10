
fulldata<-read.table("household_power_consumption.txt",sep=";",head=TRUE,stringsAsFactors=FALSE, dec=".")
fulldata$datetime<-as.POSIXlt(strptime(paste(fulldata$Date,fulldata$Time),"%d/%m/%Y %H:%M:%S"))
fulldata$Date<-as.Date(strptime(fulldata$Date,"%d/%m/%Y"))
datause<-fulldata[fulldata$Date>=as.Date(strptime("1/2/2007","%d/%m/%Y")) & fulldata$Date<=as.Date(strptime("2/2/2007","%d/%m/%Y")),]

datause$Global_active_power<-as.numeric(datause$Global_active_power)

png(filename="plot1.png",width=480,height=480)
with(datause,hist(Global_active_power,main="Global Active Power",col="red",xlab="Global Active Power (kilowatts)"))
dev.off()
