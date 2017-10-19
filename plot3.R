data1  <- read.table('household_power_consumption.txt',header=T,sep=';',na.strings='?',dec='.')

data1$Date  <- as.Date(data1$Date,format='%d/%m/%Y')

# subsetting required data
subset_data <- subset(data1,subset=(Date >='2007-02-01'& Date <= "2007-02-02"))

Global_active_power <- as.numeric(subset_data$Global_active_power)


#converting dates

date_time  <- paste(as.Date(subset_data$Date),subset_data$Time)
day_date_time <- as.POSIXct(date_time)



#plot

plot(day_date_time,subset_data$Sub_metering_1,type='l',xlab='',
                     ylab='Energy Sub Metering')
lines(day_date_time,subset_data$Sub_metering_2,type='l',col='red')
lines(day_date_time,subset_data$Sub_metering_3,type='l',col='blue')
legend("topright",c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black", "red", "blue"), lty=1, lwd=1)
 
#Save as png
dev.copy(png,file='plot3.png',height=480,width=480)
dev.off()
