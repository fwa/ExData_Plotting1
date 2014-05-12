data <- read.table('household_power_consumption.txt',header = T,sep=';',stringsAsFactor = F)
sub <- data[data$Date %in% c('1/2/2007','2/2/2007'),]

Sys.setlocale("LC_TIME", "C")
sub$date.time <- strptime(paste(sub$Date, sub$Time), format='%d/%m/%Y %H:%M:%S')
sub$Global_active_power <- as.numeric(sub$Global_active_power)
sub$Voltage <- as.numeric(sub$Voltage)
sub$Sub_metering_1 <- as.numeric(sub$Sub_metering_1)
sub$Sub_metering_2 <- as.numeric(sub$Sub_metering_2)

par(mfrow = c(2, 2))

plot(sub$date.time, sub$Global_active_power, type='l', ylab='Global Active Power(kilowatts)', xlab='')

plot(sub$date.time, sub$Voltage, type='l', ylab='Voltage', xlab='datetime')

plot(sub$date.time, sub$Sub_metering_1, type='l', col = 'black',ylab='Energy sub metering', xlab='')
lines(sub$date.time, sub$Sub_metering_2, col = 'red')
lines(sub$date.time, sub$Sub_metering_3, col = 'blue')
legend("topright", lty = 1, cex = 0.1,col = c("black", "red","blue"), legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"))

plot(sub$date.time, sub$Global_reactive_power, type='l', ylab='Global reactive power', xlab='datetime')

dev.copy(png, file = "plot4.png")
dev.off()
