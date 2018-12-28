setwd("~/Desktop")
data <- read.csv("household_power_consumption.txt",sep=";",header = TRUE)
hist(as.numeric(data$Global_active_power),col = "red",main = "Global Active Power",xlab = "Global active power (kilowatts)")
