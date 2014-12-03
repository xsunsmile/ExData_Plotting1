if(!require("sqldf")) {
  install.packages("sqldf")
}
library(sqldf)
png("plot4.png", width = 480, height = 480)

par(oma = c(0.5,0.5,0.1,0.5), mai = c(1, 0.8, 0.5, 0.1), mfrow = c(2,2))
target <- read.csv2.sql("/Users/hsun/Documents/DataMining/LearnR/household_power_consumption.txt", "select * from file where Date in ('1/2/2007','2/2/2007')")
target$DateTime <- strptime(paste(target$Date, target$Time, sep = ' '), format = "%d/%m/%Y %H:%M:%S")

plot(target$DateTime, target$Global_active_power, type = 'l', ylab = 'Global Active Power', xlab = '')
plot(target$DateTime, target$Voltage, type = 'l', ylab = 'Voltage', xlab = 'datetime')
plot(target$DateTime, target$Sub_metering_1, type = 'l', ylab = 'Energy sub metering', xlab = '')
points(target$DateTime, target$Sub_metering_2, type = 'l', col = 'red')
points(target$DateTime, target$Sub_metering_3, type = 'l', col= 'blue')
legend('topright', legend = c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'), col = c('black', 'red', 'blue'), lty = c(1, 1, 1), bty = "n")
plot(target$DateTime, target$Global_reactive_power, type = 'l', ylab = 'Global_reactive_power', xlab = 'datetime')

dev.off()