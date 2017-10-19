# Set working directory
setwd("/Users/odrilarra/Documents/APUNTEAK/Coursera/4.Exploratory Data Analysis/WEEK1/Assignment")

# Load required packages
library(dplyr)
library(data.table)

# Load data
house <- fread("household_power_consumption.txt",sep=";",h=T,na.strings = "?")

# Subset and prepare data
house <- mutate(house,Date=as.Date(Date,format="%d/%m/%Y"))
house.sub <- filter(house,Date>="2007-02-01" & Date<="2007-02-02")
house.sub <- mutate(house.sub,DateTime=paste(Date,Time," "))
house.sub <- transform(house.sub,DateTime=strptime(DateTime,format = "%Y-%m-%d %H:%M:%S"))

# Make the plot
png("plot3.png",width=480,height=480,units="px")
plot(house.sub$DateTime,house.sub$Sub_metering_1,type="l",xlab="",ylab="Energy sub metering")
lines(house.sub$DateTime,house.sub$Sub_metering_2,col="red")
lines(house.sub$DateTime,house.sub$Sub_metering_3,col="blue")
legend("topright",legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_1"),lty=c(1,1,1),col=c("black","red","blue"))
dev.off()

