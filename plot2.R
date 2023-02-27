#loading the dataset into R
power_consm <- read.table("household_power_consumption.txt",sep=";",header=T)

# using data from the dates 2007-02-01 and 2007-02-02.
power_consm$Date <- as.POSIXct( power_consm$Date, format="%d/%m/%Y" )
power_part <- subset(power_consm,Date>='2007-02-01' & Date<='2007-02-02')

#convert the Date and Time variables
x <- strptime(paste(power_part$Date,power_part$Time),"%Y-%m-%d %H:%M:%S")

power_part <- cbind(power_part,x)

power_part$Global_active_power <- as.numeric(power_part$Global_active_power)

#Construct the plot
with(power_part,plot(x,Global_active_power,type = "l",xlab='',ylab='Global Active Power (kilowatts)'))

#Create the PNG file
dev.copy(png, file = "plot2.png")
dev.off()