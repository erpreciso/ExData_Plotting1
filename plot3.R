# create plot3 graph
# read data
data <- read.table(unz("exdata_data_household_power_consumption.zip", "household_power_consumption.txt"), header = TRUE, sep = ";", stringsAsFactors = FALSE)
# convert date and time in timestamp
data$timestamp <- strptime(paste(data[,"Date"],data[, "Time"], " "), "%d/%m/%Y %H:%M:%S")
# set date limits for the subset
ub <- strptime("2007-02-02 23:59:59", "%Y-%m-%d %H:%M:%S")
lb <- strptime("2007-02-01 00:00:00", "%Y-%m-%d %H:%M:%S")
# subset data
ds <- data[data$timestamp > lb & data$timestamp < ub,]
ds <- ds[!ds$Global_active_power == "?",]
# select data to plot
sm1 <- as.numeric(ds$Sub_metering_1)
sm2 <- as.numeric(ds$Sub_metering_2)
sm3 <- as.numeric(ds$Sub_metering_3)
# create device
png(file = "plot3.png", bg = "transparent")
# create plot
plot(ds$timestamp, sm1, type = "n", ylab = "Energy sub metering", xlab = "")
lines(ds$timestamp, sm1, type = "l", col = "black")
lines(ds$timestamp, sm2, type = "l", col = "red")
lines(ds$timestamp, sm3, type = "l", col = "blue")
lcolors <- c("black", "red", "blue")
llabels <- c("Sub_metering_1","Sub_metering_2", "Sub_metering_3")
legend("topright", lwd = 1, col = lcolors, legend = llabels)
# close device
dev.off()