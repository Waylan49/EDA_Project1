setwd("C:/Users/Weilun_Chiu/Desktop/EDA_Project1")

if(!file.exists("data.zip")){
  url<-"https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
  download.file(url, "data.zip")
  unzip("data.zip")
}

data<-read.table("household_power_consumption.txt", header=TRUE, sep=";")

library(lubridate)
library(dplyr)
data<-data %>% mutate(Time=paste(Date, Time))
data$Date<-dmy(data$Date)


sub_data<-subset(data, Date == "2007-02-01" | Date=="2007-02-02")
sub_data$Time<-as.POSIXct(strptime(sub_data$Time, "%d/%m/%Y %H:%M:%S"))

#Start plotting
with(sub_data, plot(x=Time, y=Sub_metering_1, type="l"))
lines(sub_data$Time, sub_data$Sub_metering_2, col="red")
lines(sub_data$Time, sub_data$Sub_metering_3, col="blue")
legend("topright", col=c("black", "red", "blue"), lty=1, legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.copy(png, "plot3.png", width=480, height=480)
dev.off()


