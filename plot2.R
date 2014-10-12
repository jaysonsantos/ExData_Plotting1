data <- read.csv2('household_power_consumption.txt', stringsAsFactor=F)
# Transforming data to measure
data$Date = as.Date(strptime(data$Date, '%d/%m/%Y'))
data$Global_active_power <- as.numeric(data$Global_active_power)

# Just two days in february
february = subset(data, Date >= as.Date('2007-02-01') & Date <= as.Date('2007-02-02'))

# Open graphic device
png('plot2.png', width=480, height=480)

# Plot it
plot(february$Global_active_power, type = 'l', axes = FALSE, ylab = 'Global Active Power (kilowatts)', xlab = '')
# Add axix
axis(1, labels=c('Thu', 'Fri', 'Sat'), at=c(1, 1500, 2800))
axis(2, at=c(0, 2, 4, 6))
# Add a box
box()
# Close the device
dev.off()
