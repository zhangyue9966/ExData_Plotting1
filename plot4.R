setwd("~/Desktop")
data <- read.csv("household_power_consumption.txt",sep=";",header = TRUE)

data$Date <- as.Date(data$Date,"%d/%m/%Y")
data$Weekday <- weekdays(data$Date)
data$Sub_metering_1 <- as.numeric(data$Sub_metering_1)
data$Sub_metering_2 <- as.numeric(data$Sub_metering_2)
data$Sub_metering_3 <- as.numeric(data$Sub_metering_3)
data$Global_active_power <- as.numeric(data$Global_active_power)
data$Global_reactive_power <- as.numeric(data$Global_reactive_power)


thu <- which(data$Weekday == "Thursday")[1]
fri <- which(data$Weekday == "Friday")[1]
sat <- which(data$Weekday == "Saturday")[1]
locations = c(thu,fri,sat)

x <- seq(1,nrow(data))
y1 <- data$Sub_metering_1
y2 <- data$Sub_metering_2
y3 <- data$Sub_metering_3

par(mfrow = c(2,2))

#=== plot1 ===========#
plot(x,data$Global_active_power,type ="l",xaxt="n",ylab = "Global Active Power",xlab="")
axis(side = 1, at = locations, labels= c("Thu","Fri","Sat"))

#=== plot2 ===========#
plot(x,data$Voltage,type ="l",xaxt="n",ylab = "Voltage",xlab="datetime")
axis(side = 1, at = locations, labels= c("Thu","Fri","Sat"))

#=== plot3 ===========#
plot(x,y1,type ="l",xaxt="n",ylab = "Energy sub metering",xlab="",col = "black")
lines(x,y2,type ="l",xaxt="n",ylab = "Energy sub metering",xlab="",col = "red")
lines(x,y3,type ="l",xaxt="n",ylab = "Energy sub metering",xlab="",col = "blue")
axis(side = 1, at = locations, labels= c("Thu","Fri","Sat"))

legend("topright",
       lty=c(1,1,1),
       legend=c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"),
       col=c("black","red", "blue"))


#=== plot4 ===========#
plot(x,data$Global_reactive_power,type ="l",xaxt="n",ylab = "Global Reactive Power",xlab="datetime")
axis(side = 1, at = locations, labels= c("Thu","Fri","Sat"))

