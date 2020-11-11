
full_data <- read.table("household_power_consumption.txt", sep = ";", header = TRUE)

full_data$Date <- as.Date(full_data$Date, "%d/%m/%Y")
full_data$Global_active_power <- as.numeric(full_data$Global_active_power)

main_data <- full_data[(full_data$Date >= "2007/02/01" & full_data$Date < "2007/02/03"),]

png(filename = "plot1.png", width=500, height=500, bg = "white")
hist(main_data$Global_active_power, 
     main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)",
     ylab = "Frequency",
     col = "Red"
     )
dev.off()

