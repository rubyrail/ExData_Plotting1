# Place the data file "household_power_consumption.txt" in working dirctory
file <- "household_power_consumption.txt"
data <- read.table(file, sep = ";", na.strings = "?", colClasses = c(rep("character", 2), rep("numeric", 7)), nrows = 2880, skip = 66637)
dataH <- read.table(file, sep = ";", na.strings = "?", header = TRUE, nrows = 1)
names(data) <- names(dataH)

# Add variable with date/time format
data$datetime <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")

# Output plot
lc <- Sys.getlocale("LC_TIME")
Sys.setlocale("LC_TIME", "English")
png(filename = "plot3.png", width = 480, height = 480, bg = "transparent")
x <- data$datetime
plot(x, data$Sub_metering_1, type = "l", ylab = "Energy sub metering", xlab = "")
lines(x, data$Sub_metering_2, col = "red")
lines(x, data$Sub_metering_3, col = "blue")
legend("topright", names(data)[7:9], lty = "solid", col = c("black", "red", "blue"))
dev.off()
Sys.setlocale("LC_TIME", lc)