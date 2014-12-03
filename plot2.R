png("plot2.png", width = 480, height = 480)
par(mar = c(5,5,4,4))
target <- household_power_consumption[household_power_consumption$Date == '1/2/2007' | household_power_consumption$Date == '2/2/2007',]
target <- transform(target, Global_active_power = as.numeric(as.character(Global_active_power)))
target$DateTime <- strptime(paste(target$Date, target$Time, sep = ' '), format = "%d/%m/%Y %H:%M:%S")
plot(target$DateTime, target$Global_active_power, type = 'l', ylab = 'Global Active Power (kilowatts)', xlab = '')
dev.off()