#
# plot2.R 
#1)loads household_power_consumption.txt
#2)Creates a subset of the dataset for dates 1/2/2007 and 2/2/2007
#3)creates a plot2.png file
#4)plot Datetime and  GLOBAL_active_power and save to plot2.png
#

household_power_consumption <- read.csv("C:/Users/sunsi01/MYCOURSER/household_power_consumption.txt", sep=";")
powersub <- subset(household_power_consumption, Date == "1/2/2007" | Date == "2/2/2007")
Datetime <- strptime(paste(powersub$Date, powersub$Time, sep = " "),"%d/%m/%Y %H:%M:%S")
png(file="plot2.png",width=480,height=480)
plot(Datetime,as.numeric(powersub$Global_active_power),main="Global Active Power",xlab="",
     ylab="Global Active Power(kilowatts)",type="l")

dev.off()
