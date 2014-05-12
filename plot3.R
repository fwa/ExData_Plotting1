data <- read.table('household_power_consumption.txt',header = T,sep=';',stringsAsFactor = F)
sub <- data[data$Date %in% c('1/2/2007','2/2/2007'),]

Sys.setlocale("LC_TIME", "C")

sub$date.time <- strptime(paste(sub$Date, sub$Time), format='%d/%m/%Y %H:%M:%S')
sub$Sub_metering_1 <- as.numeric(sub$Sub_metering_1)
sub$Sub_metering_2 <- as.numeric(sub$Sub_metering_2)

plot(sub$date.time, sub$Sub_metering_1, type='l', col = 'black',ylab='Energy sub metering', xlab='')
lines(sub$date.time, sub$Sub_metering_2, col = 'red')
lines(sub$date.time, sub$Sub_metering_3, col = 'blue')
legend("topright", cex = 0.5, lty = 1, col = c("black", "red","blue"), legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"))

dev.copy(png, file = "plot3.png")
dev.off()
