if(!require("sqldf")) {
  install.packages("sqldf")
}
library(sqldf)
png("plot1.png", width = 480, height = 480)

par(mar = c(5,5,4,4))
filePath <- path.expand("~/Documents/DataMining/LearnR/household_power_consumption.txt")
target <- read.csv2.sql(filePath, "select * from file where Date in ('1/2/2007','2/2/2007')")

hist(target$Global_active_power, col = 'red', xlab = 'Global Active Power (kilowatts)', main = 'Global Active Power')

dev.off()
