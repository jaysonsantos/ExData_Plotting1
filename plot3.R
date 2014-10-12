data <- read.csv2('household_power_consumption.txt', stringsAsFactor=F)
# Transforming data to measure
data$Date = as.Date(strptime(data$Date, '%d/%m/%Y'))
data$Sub_metering_1 = as.numeric(data$Sub_metering_1)
data$Sub_metering_2 = as.numeric(data$Sub_metering_2)
data$Sub_metering_3 = as.numeric(data$Sub_metering_3)

# February data
february = subset(data, Date >= as.Date('2007-02-01') & Date <= as.Date('2007-02-02'))

# Open graphic device
png('plot3.png', width=480, height=480)

# Plot it
plot(february$Sub_metering_1, type='l', ylab = 'Energy sub metering',
     xlab = '', axes = FALSE)

# Add lines
lines(february$Sub_metering_2, col='red')
lines(february$Sub_metering_3, col='blue')

# Add axis
axis(1, labels=c('Thu', 'Fri', 'Sat'), at=c(1, 1500, 2800))
axis(2, at=c(0, 10, 20, 30))

# Add box
box()

# Create the legend
legend('topright', c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black", "red", "blue"), lty=1)

# Closes the graphic device
dev.off()