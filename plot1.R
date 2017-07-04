if("dplyr" %in% rownames(installed.packages()) == FALSE) {
  install.packages("dplyr")
} 
library(dplyr)
power <- read.table("household_power_consumption.txt",
  na.strings = "?", sep = ";", header = TRUE)
power$Date <- as.Date(power$Date, format = "%d/%m/%Y")
power$Time <- strptime(power$Time, format = "%H:%M:%S", tz = "")
power$Time <- format(power$Time, "%H:%M:%S")
power <- filter(power, Date == "2007-02-01" | Date == "2007-02-02")
hist(power$Global_active_power, xlab = "Global Active Power (Kilowatts)", 
     col = "red", main = "Global Active Power", freq = TRUE)
dev.copy(png, file = "plot1.png")
dev.off()