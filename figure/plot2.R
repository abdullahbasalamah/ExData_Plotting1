download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",destfile="week1_4.zip",method="curl")
unzip("week1_4.zip")

fulldata<-read.table("household_power_consumption.txt",sep=";",head=TRUE,stringsAsFactors=FALSE, dec=".")
fulldata$datetime<-as.POSIXlt(strptime(paste(fulldata$Date,fulldata$Time),"%d/%m/%Y %H:%M:%S"))
fulldata$Date<-as.Date(strptime(fulldata$Date,"%d/%m/%Y"))
datause<-fulldata[fulldata$Date>=as.Date(strptime("1/2/2007","%d/%m/%Y")) & fulldata$Date<=as.Date(strptime("2/2/2007","%d/%m/%Y")),]

datause$Global_active_power<-as.numeric(datause$Global_active_power)

png(filename="plot2.png",width=480,height=480)
with(datause,plot(datetime,Global_active_power,type="l",xlab="",ylab="Global Active Power (kilowatts)"))
dev.off()
