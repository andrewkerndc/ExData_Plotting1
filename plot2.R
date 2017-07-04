if("dplyr" %in% rownames(installed.packages()) == FALSE) {
  install.packages("dplyr")
} 
library(dplyr)
power <- read.table("household_power_consumption.txt",
                    na.strings = "?", sep = ";", header = TRUE)
power$Date <- as.Date(power$Date, format = "%d/%m/%Y")
power <- filter(power, Date == "2007-02-01" | Date == "2007-02-02")
power$Time <- as.POSIXct(paste(power$Date, power$Time))
plot(power$Time, power$Global_active_power, type = "l", 
     ylab = "Global Active Power (Kilowatts)", xlab = "")
dev.copy(png, file = "plot2.png")
dev.off()