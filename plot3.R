#
# plot3.R 
#1)loads household_power_consumption.txt
#2)Creates a subset of the dataset for dates 1/2/2007 and 2/2/2007
#3)creates a plot3.png file
#4)plot Datetime and Sub_metering_1,Sub_metering_2,Sub_metering_3 ,add legend to the plot,save to plot3.png
#5)turn off device
#

household_power_consumption <- read.csv("C:/Users/sunsi01/MYCOURSER/household_power_consumption.txt", sep=";",
                                        stringsAsFactors=FALSE)
powersub <- subset(household_power_consumption, Date == "1/2/2007" | Date == "2/2/2007")
Datetime <- strptime(paste(powersub$Date, powersub$Time, sep = " "),"%d/%m/%Y %H:%M:%S")

png(file="plot3.png",width=480,height=480)

plot(Datetime,as.numeric(powersub$Sub_metering_1),xlab="",
     ylab="Energy sub metering",type="l")
lines(Datetime,as.numeric(powersub$Sub_metering_2),col="red")
lines(Datetime,as.numeric(powersub$Sub_metering_3),col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
             lty=1,col=c("black", "red", "blue"))

dev.off()

