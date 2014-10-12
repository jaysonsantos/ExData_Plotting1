data <- read.csv2('household_power_consumption.txt', stringsAsFactor=F)
# Transforming data to measure
data$Date = as.Date(strptime(data$Date, '%d/%m/%Y'))
data$Global_active_power <- as.numeric(data$Global_active_power)

# Just two days in february
february = subset(data, Date >= as.Date('2007-02-01') & Date <= as.Date('2007-02-02'))

# Open graphic device
png('plot1.png', width=480, height=480)
# Plot it
hist(february$Global_active_power, xlab = 'Global Active Power (killowats)', ylab = 'Frequency', main = 'Global Active Power', col = "red")
# Closes the device
dev.off()