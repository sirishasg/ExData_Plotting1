#
#plot4
#
household_power_consumption <- read.csv("C:/Users/sunsi01/MYCOURSER/household_power_consumption.txt", sep=";",
                                        stringsAsFactors=FALSE)
powersub <- subset(household_power_consumption, Date == "1/2/2007" | Date == "2/2/2007")
Datetime <- strptime(paste(powersub$Date, powersub$Time, sep = " "),"%d/%m/%Y %H:%M:%S")
#
### create file Plot4.png
#
png(file="plot4.png",width=480,height=480)
#
# 2 plots per row and 2 plots per column
#
par(mfrow=c(2,2))
#
#plot1
#
hist(as.numeric(powersub$Global_active_power),main="",
     xlab="Global Active Power(kilowatts)")
#
#plot2 x-axis = Datetime, y-axis=voltage
#
plot(Datetime,as.numeric(powersub$Voltage),
     ylab="Voltage",type="l")
#
#Plot3
#
plot(Datetime,as.numeric(powersub$Sub_metering_1),xlab="",
     ylab="Energy sub metering",type="l")
lines(Datetime,as.numeric(powersub$Sub_metering_2),col="red")
lines(Datetime,as.numeric(powersub$Sub_metering_3),col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
             lty=1,col=c("black", "red", "blue"),bty="o")
#
#plot4
#
plot(Datetime,as.numeric(powersub$Global_reactive_power),
     ylab="Global_reactive_Power",type="l")

dev.off()



