## Load data into R from the wokring directory
data_File <- "./Ex_Data/household_power_consumption.txt"
data <- read.table(data_File, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

## Subsetting from the dates 2007-02-01 and 2007-02-02
Subdata <- subset(data, data$Date %in% c("1/2/2007","2,2,2007"))

## Loading Numeric Values and excluing missing values marked with ?
Power <- as.numeric(Subdata$Global_active_power)

## Open external Graphic Device
png("plot1.png", width=480, height=480)

## Plot the histogram with appropriate labels
hist(Power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")

dev.off()