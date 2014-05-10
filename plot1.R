# Place the data file "household_power_consumption.txt" in the working directory
file <- "household_power_consumption.txt"
data <- read.table(file, sep = ";", na.strings = "?", colClasses = c(rep("character", 2), rep("numeric", 7)), nrows = 2880, skip = 66637)
dataH <- read.table(file, sep = ";", header = TRUE, nrows = 1)
names(data) <- names(dataH)

# Output the plot
png(filename = "plot1.png", width = 480, height = 480, bg = "transparent")
hist(data$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.off()