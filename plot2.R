
full_data <- read.table("household_power_consumption.txt", sep = ";", header = TRUE)

full_data$Date <- as.Date(full_data$Date, "%d/%m/%Y")
full_data$Global_active_power <- as.numeric(full_data$Global_active_power)

main_data <- full_data[(full_data$Date >= "2007/02/01" & full_data$Date < "2007/02/03"),]
main_data$dtime <- as.POSIXct(paste(as.character(main_data$Date, "%Y/%m/%d"), main_data$Time, sep = " "))

png(filename = "plot2.png", width=500, height=500, bg = "white")
plot(main_data$dtime,
     main_data$Global_active_power, 
     type = "l", 
     xlab = "", 
     ylab = "Global Active Power (kilowatts)"
    )
dev.off()
