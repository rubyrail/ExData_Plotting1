# Place the data file "household_power_consumption.txt" in the working directory
file <- "household_power_consumption.txt"
data <- read.table(file, sep = ";", na.strings = "?", skip = 66637, nrows = 2880, colClasses = c(rep("character", 2), rep("numeric", 7)))
dataH <- read.table(file, sep = ";", na.strings = "?", header = TRUE, nrows = 1)
names(data) <- names(dataH)

# Add a variable for formatted Date and Time
data$datetime <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")

# Output plot
lc <- Sys.getlocale("LC_TIME")
Sys.setlocale("LC_TIME", "English")
png(filename = "plot2.png", width = 480, height = 480, bg = "transparent")
plot(data$datetime, data$Global_active_power, type = "l", ylab = "Global Active Power (kilowatts)", xlab = "")
dev.off()
Sys.setlocale("LC_TIME", lc)