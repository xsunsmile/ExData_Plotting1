if(!require("sqldf")) {
  install.packages("sqldf")
}
library(sqldf)
png("plot3.png", width = 480, height = 480)

par(mar = c(5,5,4,4))
filePath <- path.expand("~/Documents/DataMining/LearnR/household_power_consumption.txt")
target <- read.csv2.sql(filePath, "select * from file where Date in ('1/2/2007','2/2/2007')")
target$DateTime <- strptime(paste(target$Date, target$Time, sep = ' '), format = "%d/%m/%Y %H:%M:%S")

plot(target$DateTime, target$Sub_metering_1, type = 'l', ylab = 'Energy sub metering', xlab = '')
points(target$DateTime, target$Sub_metering_2, type = 'l', col = 'red')
points(target$DateTime, target$Sub_metering_3, type = 'l', col= 'blue')
legend('topright', legend = c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'), col = c('black', 'red', 'blue'), lty = c(1, 1, 1))

dev.off()