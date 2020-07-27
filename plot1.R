setwd("C:/Users/Weilun_Chiu/Desktop/EDA_Project1")

if(!file.exists("data.zip")){
url<-"https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(url, "data.zip")
unzip("data.zip")
}

data<-read.table("household_power_consumption.txt", header=TRUE, sep=";")

library(lubridate)
data$Date<-dmy(data$Date)


library(dplyr)
sub_data<-subset(data, Date == "2007-02-01" | Date=="2007-02-02")
sub_data$Time<-strptime(sub_data$Time, "%H:%M:%S")

#Start plotting
sub_data$Global_active_power<-as.numeric(sub_data$Global_active_power)
hist(sub_data$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.copy(png, "plot1.png", width=480, height=480)
dev.off()
