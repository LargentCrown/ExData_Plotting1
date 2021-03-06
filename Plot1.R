data <- fread("household_power_consumption.txt", na.strings="?",
stringsAsFactors = FALSE)
head(data)
hpc <- filter(data, grep("^[1,2]/2/2007", Date))
head(hpc)
tail(hpc)

hpc$Global_active_power <- as.numeric(as.character(hpc$Global_active_power))
hpc$Global_reactive_power <- as.numeric(as.character(hpc$Global_reactive_power))
hpc$Sub_metering_1 <- as.numeric(as.character(hpc$Sub_metering_1))
hpc$Sub_metering_2 <- as.numeric(as.character(hpc$Sub_metering_2))
hpc$Sub_metering_3 <- as.numeric(as.character(hpc$Sub_metering_3))
hpc$Voltage <- as.numeric(as.character(hpc$Voltage))
hpc$dateTime <- paste(hpc$Date, hpc$Time)

#Plot1
hist(hpc$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.copy(png, file="Plot1.png", height=480, width=480)
dev.off()