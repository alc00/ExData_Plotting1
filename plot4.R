
full_data <- read.table("household_power_consumption.txt", sep = ";", header = TRUE)

full_data$Date <- as.Date(full_data$Date, "%d/%m/%Y")

full_data$Global_active_power <- as.numeric(full_data$Global_active_power)
full_data$Sub_metering_1 <- as.numeric(full_data$Sub_metering_1)
full_data$Sub_metering_2 <- as.numeric(full_data$Sub_metering_2)
full_data$Sub_metering_3 <- as.numeric(full_data$Sub_metering_3)
full_data$Voltage <- as.numeric(full_data$Voltage)
full_data$Global_reactive_power <- as.numeric(full_data$Global_reactive_power)

main_data <- full_data[(full_data$Date >= "2007/02/01" & full_data$Date < "2007/02/03"),]
main_data$dtime <- as.POSIXct(paste(as.character(main_data$Date, "%Y/%m/%d"), main_data$Time, sep = " "))
head(main_data)


png(filename = "plot4.png", width=500, height=500, bg = "white")

par(mfcol = c(2,2))

# Plot 1
plot(main_data$dtime,
     main_data$Global_active_power, 
     type = "l", 
     xlab = "", 
     ylab = "Global Active Power (kilowatts)"
)

# Plot 2
plot(main_data$dtime,
     main_data$Sub_metering_1, 
     type = "l", 
     xlab = "", 
     ylab = "Energy sub metering"
)
lines(main_data$dtime,
      main_data$Sub_metering_2,
      col = "red"
)
lines(main_data$dtime,
      main_data$Sub_metering_3,
      col = "blue"
)
legend(x="topright",
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       lty = 1,
       lwd = 1,
       col = c("black", "red", "blue")
)

# Plot 3
plot(main_data$dtime,
     main_data$Voltage, 
     type = "l", 
     xlab = "datetime", 
     ylab = "Voltage"
)

# Plot 4
plot(main_data$dtime,
     main_data$Global_reactive_power, 
     type = "l", 
     xlab = "datetime", 
     ylab = "Global_reactive_power"
)

dev.off()


