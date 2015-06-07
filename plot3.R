## Load data into R from the working directory
data_File <- "./Ex_Data/household_power_consumption.txt"
data <- read.table(data_File, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

## Subsetting from the dates 2007-02-01 and 2007-02-02
Subdata <- subset(data, data$Date %in% c("1/2/2007","2/2/2007"))

## Convert the Date and Time variables to Date/Time classes
datetime <- strptime(paste(Subdata$Date, Subdata$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

## Loading Numeric Values and excluing missing values marked with ?
Power <- as.numeric(Subdata$Global_active_power)

## Defining Submetering variables corresponding to each data value
sub1 <- as.numeric(Subdata$Sub_metering_1)
sub2 <- as.numeric(Subdata$Sub_metering_2)
sub3 <- as.numeric(Subdata$Sub_metering_3)

## Open external Graphic Device
png("plot3.png", width=480, height=480)

## Plot multiple line graph with appropriate labels - Specify type ="l" 
plot(datetime, sub1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, sub2, type="l", col="red")
lines(datetime, sub3, type="l", col="blue")

## Specify legend to describe the graph
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))

dev.off()