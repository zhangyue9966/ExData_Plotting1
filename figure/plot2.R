setwd("~/Desktop")
data <- read.csv("household_power_consumption.txt",sep=";",header = TRUE)

data$Date <- as.Date(data$Date,"%d/%m/%Y")
data$Weekday <- weekdays(data$Date)
data$Global_active_power <- as.numeric(data$Global_active_power)
data$Global_reactive_power <- as.numeric(data$Global_reactive_power)

thu <- which(data$Weekday == "Thursday")[1]
fri <- which(data$Weekday == "Friday")[1]
sat <- which(data$Weekday == "Saturday")[1]
locations = c(thu,fri,sat)

plot(seq(1,nrow(data)),data$Global_active_power,type ="l",xaxt="n",ylab = "Global active power (kilowatts)",xlab="")
axis(side = 1, at = locations, labels= c("Thu","Fri","Sat"))