## Load data into R from the working directory
data_File <- "./Ex_Data/household_power_consumption.txt"
data <- read.table(data_File, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

## Subsetting from the dates 2007-02-01 and 2007-02-02
Subdata <- subset(data, data$Date %in% c("1/2/2007","2/2/2007"))

## Convert the Date and Time variables to Date/Time classes
datetime <- strptime(paste(Subdata$Date, Subdata$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

## Loading Numeric Values of different variables
ActivePower <- as.numeric(Subdata$Global_active_power)
ReactivePower <- as.numeric(Subdata$Global_reactive_power)
voltage <- as.numeric(Subdata$Voltage)
sub1 <- as.numeric(Subdata$Sub_metering_1)
sub2 <- as.numeric(Subdata$Sub_metering_2)
sub3 <- as.numeric(Subdata$Sub_metering_3)

## Open external Graphic Device
png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2)) 

## Plot multiple graphs with appropriate labels - Specify type ="l"
plot(datetime, ActivePower, type="l", xlab="", ylab="Global Active Power", cex=0.2)

plot(datetime, voltage, type="l", xlab="datetime", ylab="Voltage")

plot(datetime, sub1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, sub2, type="l", col="red")
lines(datetime, sub3, type="l", col="blue")

## Specify legend to describe the graph
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")

plot(datetime, ReactivePower, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()