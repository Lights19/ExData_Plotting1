data1  <- read.table('household_power_consumption.txt',header=T,sep=';',na.strings='?',dec='.')

data1$Date  <- as.Date(data1$Date,format='%d/%m/%Y')

# subsetting required data
subset_data <- subset(data1,subset=(Date >='2007-02-01'& Date <= "2007-02-02"))

Global_active_power <- as.numeric(subset_data$Global_active_power)


#converting dates

date_time  <- paste(as.Date(subset_data$Date),subset_data$Time)
day_date_time <- as.POSIXct(date_time)



#plot

plot(Global_active_power~day_date_time,type='l',xlab='',ylab='Global Active Power(Kilowatts)')

#Save as png
dev.copy(png,file='plot2.png',height=480,width=480)
dev.off()
