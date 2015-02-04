# create plot1 graph
# read data
data <- read.table(unz("exdata_data_household_power_consumption.zip", "household_power_consumption.txt"), header = TRUE, sep = ";", stringsAsFactors = FALSE)
# convert date and time in timestamp
data$timestamp <- strptime(paste(data[,"Date"],data[, "Time"], " "), "%d/%m/%Y %H:%M:%S")
# set date limits for the subset
ub <- strptime("2007-02-02 23:59:59", "%Y-%m-%d %H:%M:%S")
lb <- strptime("2007-02-01 00:00:00", "%Y-%m-%d %H:%M:%S")
# subset data
ds <- data[data$timestamp > lb & data$timestamp < ub,]
# select data to plot
ap <- as.numeric(ds$Global_active_power)
# create device
png(file = "plot1.png", bg = "transparent")
# create histogram
hist(ap, breaks = 20, col = "red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power")
# close device
dev.off()

