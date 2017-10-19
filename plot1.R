data1  <- read.table('household_power_consumption.txt',header=T,sep=';',na.strings='?',dec='.')

data1$Date  <- as.Date(data1$Date,format='%d/%m/%Y')

# subsetting required data
subset_data <- subset(data1,subset=(Date >='2007-02-01'& Date <= "2007-02-02"))



Global_active_power <- as.numeric(subset_data$Global_active_power)

#plot
hist(Global_active_power,xlab='Global Active Power(KW)',
     ylab='Frequency',main = 'Global Active Power',col='red')

#Save as png
dev.copy(png,file='plot1.png',height=480,width=480)
dev.off()
