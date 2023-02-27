#loading the dataset into R
power_consm <- read.table("household_power_consumption.txt",sep=";",header=T)

#convert the Date variable
power_consm$Date <- as.POSIXct( power_consm$Date, format="%d/%m/%Y" )

# using data from the dates 2007-02-01 and 2007-02-02.
power_part <- subset(power_consm,Date>='2007-02-01' & Date<='2007-02-02')

power_part$Global_active_power <- as.numeric(power_part$Global_active_power)

#Construct the plot
hist(power_part$Global_active_power,col='red',main='Global Active Power',xlab='Global Active Power (kilowatts)')

#Create the PNG file
dev.copy(png, file = "plot1.png")
dev.off()