if("dplyr" %in% rownames(installed.packages()) == FALSE) {
  install.packages("dplyr")
} 
library(dplyr)
power <- read.table("household_power_consumption.txt",
                    na.strings = "?", sep = ";", header = TRUE)
power$Date <- as.Date(power$Date, format = "%d/%m/%Y")
power <- filter(power, Date == "2007-02-01" | Date == "2007-02-02")
power$Time <- as.POSIXct(paste(power$Date, power$Time))
par(mfrow = c(2,2), mar = c(4, 4, 2, 1), oma = c(0, 0, 2, 0))
with(power, {
  plot(power$Time, power$Global_active_power, type = "l", 
       ylab = "Global Active Power (Kilowatts)", xlab = "")
  plot(power$Time, power$Voltage, type = "l", xlab = "datetime", ylab = "Voltage")
  with(power, plot(Time, Sub_metering_1, type = "l", ylab = "", xlab = ""))
  with(power, lines(Time, Sub_metering_2, col = "red", ylab = "", xlab = ""))
  with(power, lines(Time, Sub_metering_3, col = "blue", ylab = "", xlab = ""))
  legend("topright", lty = 1, bty = "n", cex = 0.7, col = c("Black", "Blue", "Red"),
         y.intersp = 0.7,
         legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  title(ylab = "Energy sub metering", xlab = "")
  plot(power$Time, power$Global_reactive_power, type = "l", xlab = "datetime",
       ylab = "Global_reactive_power")
})
dev.copy(png, file = "plot4.png")
dev.off()