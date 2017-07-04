if("dplyr" %in% rownames(installed.packages()) == FALSE) {
  install.packages("dplyr")
} 
library(dplyr)
power <- read.table("household_power_consumption.txt",
                    na.strings = "?", sep = ";", header = TRUE)
power$Date <- as.Date(power$Date, format = "%d/%m/%Y")
power <- filter(power, Date == "2007-02-01" | Date == "2007-02-02")
power$Time <- as.POSIXct(paste(power$Date, power$Time))
with(power, plot(Time, Sub_metering_1, type = "l", ylab = "", xlab = ""))
with(power, lines(Time, Sub_metering_2, col = "red", ylab = "", xlab = ""))
with(power, lines(Time, Sub_metering_3, col = "blue", ylab = "", xlab = ""))
legend("topright", lty = 1, col = c("Black", "Blue", "Red"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
title(ylab = "Energy sub metering", xlab = "")
dev.copy(png, file = "plot3.png")
dev.off()