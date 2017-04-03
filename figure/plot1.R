## Getting complete dataset the downloaded txt file (in Ubuntu 16.04 System)
dataComplete <- read.csv("/home/saisreekk/household_power_consumption.txt", header=T, sep=';', na.strings="?", 
                      nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
dataComplete$Date <- as.Date(dataComplete$Date, format="%d/%m/%Y")

## Subsetting the dataComplete
subsetData <- subset(dataComplete, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))

## Converting the dates in subsetData
dateTime <- paste(as.Date(subsetData$Date), subsetData$Time)
subsetData$Datetime <- as.POSIXct(dateTime)

## Plot 1 - histogram
hist(subsetData$Global_active_power, main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

## Saving Plot 1 to png
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()

## removing dataComplete 
rm(dataComplete)