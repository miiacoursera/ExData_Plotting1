read_data <- function() {
    filename <- "household_power_consumption.txt"
    data <- read.csv(filename,
                     header=TRUE,
                     sep=";",
                     colClasses=c("character", "character", rep("numeric",7)),
                     na="?")
    
    data$Time <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")
    data$Date <- as.Date(data$Date, "%d/%m/%Y")
    dates <- as.Date(c("2007-02-01", "2007-02-02"), "%Y-%m-%d")
    d <- subset(data, Date %in% dates)
    d
}

plot3 <- function() {
    data <- read_data()
    png("plot3.png", width=480, height=480)
    plot(data$Time, data$Sub_metering_1, type = "l", ylab = "Energy sub metering", xlab = "")
    lines(data$Time, data$Sub_metering_2, type = "l", col = "red")
    lines(data$Time, data$Sub_metering_3, type = "l", col = "blue")
    legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
           col=c("black","red", "blue"), lty=1)
    dev.off()
}