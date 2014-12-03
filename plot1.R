if(!require("sqldf")) {
  install.packages("sqldf")
}
library(sqldf)
png("plot1.png", width = 480, height = 480)

par(mar = c(5,5,4,4))
target <- read.csv2.sql("/Users/hsun/Documents/DataMining/LearnR/household_power_consumption.txt", "select * from file where Date in ('1/2/2007','2/2/2007')")
hist(target$Global_active_power, col = 'red', xlab = 'Global Active Power (kilowatts)', main = 'Global Active Power')

dev.off()
