data <- read.csv2('household_power_consumption.txt', stringsAsFactor=F)
# Transforming data to measure
data$Date <- as.Date(strptime(data$Date, '%d/%m/%Y'))
data$Global_active_power <- as.numeric(data$Global_active_power)
data$Global_reactive_power <- as.numeric(data$Global_reactive_power)
data$Voltage <- as.numeric(data$Voltage)
data$Sub_metering_1 <- as.numeric(data$Sub_metering_1)
data$Sub_metering_2 <- as.numeric(data$Sub_metering_2)
data$Sub_metering_3 <- as.numeric(data$Sub_metering_3)

# February data
february <- subset(data, Date >= as.Date('2007-02-01') & Date <= as.Date('2007-02-02'))

png('plot4.png', width=480, height=480)
# Change the configuration to show two graphs
par(mfrow = c(2, 2))

# Plot the first graph
plot(february$Global_active_power, type = 'l', axes = FALSE, ylab = 'Global Active Power (kilowatts)', xlab = '')
axis(1, labels=c('Thu', 'Fri', 'Sat'), at=c(1, 1500, 2800))
axis(2, at=seq(0, 6, by = 2))
box()

# Plot the second graph
plot(february$Voltage, type = 'l', axes = FALSE, ylab='Voltage', xlab='datetime')
axis(1, labels=c('Thu', 'Fri', 'Sat'), at=c(1, 1500, 2800))
axis(2, at=seq(234, 246, by=4))
box()

# Plot the third graph
plot(february$Sub_metering_1, type='l', ylab='Energy sub metering',
     xlab='', axes=FALSE)
lines(february$Sub_metering_2, col='red')
lines(february$Sub_metering_3, col='blue')

axis(1, labels=c('Thu', 'Fri', 'Sat'), at=c(1, 1500, 2800))
axis(2, at=c(0, 10, 20, 30))

box()

legend("topright", bty="n",
       c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black", "red", "blue"), lty=1)

# Plot the fourth graph
plot(february$Global_reactive_power, type='l', axes=FALSE, ylab='Global_reactive_power', xlab='datetime')
axis(1, labels=c('Thu', 'Fri', 'Sat'), at=c(1, 1500, 2800))
axis(2, at=seq(0.0, 0.5, by=0.1), las=2)
box()

#dev.copy(png, 'plot4.png', width=480, height=480)
dev.off()