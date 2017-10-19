data1  <- read.table('household_power_consumption.txt',header=T,sep=';',na.strings='?',dec='.')

data1$Date  <- as.Date(data1$Date,format='%d/%m/%Y')

# subsetting required data
subset_data <- subset(data1,subset=(Date >='2007-02-01'& Date <= "2007-02-02"))

Global_active_power <- as.numeric(subset_data$Global_active_power)


#converting dates

date_time  <- paste(as.Date(subset_data$Date),subset_data$Time)
day_date_time <- as.POSIXct(date_time)



#plot
par(mfrow=c(2,2),mar=c(4,4,2,1),oma=(c(0,0,2,0)))

plot(day_date_time,Global_active_power,type='l',xlab='',
     ylab='Global Active Power')
plot(day_date_time,subset_data$Voltage,type='l',xlab = 'datetime',
     ylab='Voltage(volt)')
plot(day_date_time,subset_data$Sub_metering_1,type='l',xlab='',
     ylab='Energy Sub Metering')
lines(day_date_time,subset_data$Sub_metering_2,col='red')
lines(day_date_time,subset_data$Sub_metering_3,col='blue')
legend("topright", col=c("black", "red", "blue"), lty=1,lwd=2.5,pt.cex=1.5,cex=0.50,
  legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

plot(day_date_time,subset_data$Global_reactive_power,type='l',xlab='',
     ylab='Global_reative_Power')
#Save as png
dev.copy(png,file='plot4.png',height=480,width=480)
dev.off()
