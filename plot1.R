data <- read.table('household_power_consumption.txt',header = T,sep=';',stringsAsFactor = F)
sub <- data[data$Date %in% c('1/2/2007','2/2/2007'),]

sub$Global_active_power <- as.numeric(sub$Global_active_power)

hist(sub$Global_active_power,col='red', main = 'Global Active Power', xlab='Global Active Power(kilowatts)')

dev.copy(png, file = "plot1.png") ## Copy my plot to a PNG file
dev.off() ## close the PNG device
