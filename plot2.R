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

plot2 <- function() {
    data <- read_data()
    png("plot2.png", width=480, height=480)
    plot(data$Time, data$Global_active_power, type = "l", ylab = "Global Active Power (kilowatts)", xlab = "")
    dev.off()
}