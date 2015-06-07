## Load data into R from the working directory
data_File <- "./Ex_Data/household_power_consumption.txt"
data <- read.table(data_File, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

## Subsetting from the dates 2007-02-01 and 2007-02-02
Subdata <- subset(data, data$Date %in% c("1/2/2007","2/2/2007"))

## Convert the Date and Time variables to Date/Time classes
datetime <- strptime(paste(Subdata$Date, Subdata$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

## Loading Numeric Values and excluing missing values marked with ?
Power <- as.numeric(Subdata$Global_active_power)

## Open external Graphic Device
png("plot2.png", width=480, height=480)

## Plot line graph with appropriate labels - Specify type ="l"
plot(datetime, Power, type="l", xlab="", ylab="Global Active Power (kilowatts)")

dev.off()
