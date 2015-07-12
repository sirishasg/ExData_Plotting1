#
# plot1.R 
#1)loads household_power_consumption.txt
#2)Creates a subset of the dataset for dates 1/2/2007 and 2/2/2007
#3)creates a plot1.png file
#4)plot a histogram for GLOBAL_active_power and save to plot1.png
#

household_power_consumption <- read.csv("C:/Users/sunsi01/MYCOURSER/household_power_consumption.txt", sep=";")
#powersub - subset of the household_power_consumption data for dates feb1/2007 and feb2/2007
powersub <- subset(household_power_consumption, Date == "1/2/2007" | Date == "2/2/2007")
powersub[, "Date"] <- as.Date(strptime(powersub[, "Date"], format='%d/%m/%Y'))
#plot1.png
png(file="plot1.png",width=480,height=480)
hist(as.numeric(powersub$Global_active_power),main="Global Active Power",
     xlab="Global Active Power(kilowatts)",col="Red")

dev.off()
