setwd("~/Desktop")
data <- read.csv("household_power_consumption.txt",sep=";",header = TRUE)

data$Date <- as.Date(data$Date,"%d/%m/%Y")
data$Weekday <- weekdays(data$Date)
data$Sub_metering_1 <- as.numeric(data$Sub_metering_1)
data$Sub_metering_2 <- as.numeric(data$Sub_metering_2)
data$Sub_metering_3 <- as.numeric(data$Sub_metering_3)

thu <- which(data$Weekday == "Thursday")[1]
fri <- which(data$Weekday == "Friday")[1]
sat <- which(data$Weekday == "Saturday")[1]
locations = c(thu,fri,sat)

x <- seq(1,nrow(data))
y1 <- data$Sub_metering_1
y2 <- data$Sub_metering_2
y3 <- data$Sub_metering_3

plot(x,y1,type ="l",xaxt="n",ylab = "Energy sub metering",xlab="",col = "black")
lines(x,y2,type ="l",xaxt="n",ylab = "Energy sub metering",xlab="",col = "red")
lines(x,y3,type ="l",xaxt="n",ylab = "Energy sub metering",xlab="",col = "blue")
axis(side = 1, at = locations, labels= c("Thu","Fri","Sat"))

legend("topright",
       lty=c(1,1,1),
       legend=c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"),
       col=c("black","red", "blue"))

