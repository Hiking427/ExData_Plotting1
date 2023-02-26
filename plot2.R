power_consm <- read.table("household_power_consumption.txt",sep=";",header=T)

power_consm$Date <- as.POSIXct( power_consm$Date, format="%d/%m/%Y" )

power_part <- subset(power_consm,Date>='2007-02-01' & Date<='2007-02-02')

power_part$Global_active_power <- as.numeric(power_part$Global_active_power)

hist(power_part$Global_active_power,col='red',main='Global Active Power',xlab='Global Active Power (kilowatts)')

dev.copy(png, file = "plot2.png")
dev.off()