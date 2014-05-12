data <- read.table('household_power_consumption.txt',header = T,sep=';',stringsAsFactor = F)
sub <- data[data$Date %in% c('1/2/2007','2/2/2007'),]

Sys.setlocale("LC_TIME", "C")

sub$Global_active_power <- as.numeric(sub$Global_active_power)
sub$date.time <- strptime(paste(sub$Date, sub$Time), format='%d/%m/%Y %H:%M:%S')

plot(sub$date.time, sub$Global_active_power, type='l', ylab='Global Active Power(kilowatts)', xlab='')

dev.copy(png, file = "plot2.png")
dev.off()
