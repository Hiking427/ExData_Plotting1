power_consm <- read.table("household_power_consumption.txt",sep=";",header=T)

power_consm$Date <- as.POSIXct( power_consm$Date, format="%d/%m/%Y" )

power_part <- subset(power_consm,Date>='2007-02-01' & Date<='2007-02-02')

x <- strptime(paste(power_part$Date,power_part$Time),"%Y-%m-%d %H:%M:%S")

power_part <- cbind(power_part,x)

power_part$Sub_metering_1 <- as.numeric(power_part$Sub_metering_1)
power_part$Sub_metering_2 <- as.numeric(power_part$Sub_metering_2)
power_part$Sub_metering_3 <- as.numeric(power_part$Sub_metering_3)

with(power_part,plot(x, Sub_metering_1, main = "",xlab='',ylab='Energy Submetering', type = "n"))
with(power_part,points(x,Sub_metering_1,type = "l"))
with(power_part,points(x,Sub_metering_2,type = "l",col='red'))
with(power_part,points(x,Sub_metering_3,type = "l",col='blue'))

legend("topright",lwd=3,lty=1, col = c("black", "red","blue"), legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"))

dev.copy(png, file = "plot3.png")
dev.off()