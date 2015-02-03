setwd("/home/erpreciso/Documents/school")
data <- read.table(unz("exdata_data_household_power_consumption.zip", "household_power_consumption.txt"), header = TRUE, sep = ";")
data$Date <- strptime(data$Date, "%d/%m/%Y")