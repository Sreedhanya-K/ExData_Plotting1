## Getting complete dataset the downloaded txt file (in Ubuntu 16.04 System)
dataComplete <- read.csv("/home/saisreekk/household_power_consumption.txt", header=T, sep=';', na.strings="?", 
                         nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
dataComplete$Date <- as.Date(dataComplete$Date, format="%d/%m/%Y")

## Subsetting the dataComplete
subsetData <- subset(dataComplete, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))

## Converting the dates in subsetData
dateTime <- paste(as.Date(subsetData$Date), subsetData$Time)
subsetData$Datetime <- as.POSIXct(dateTime)

## Plot 2 
plot(subsetData$Global_active_power~subsetData$Datetime, type="l",
     ylab="Global Active Power (kilowatts)", xlab="")

## Saving Plot 2 to png
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()

## removing dataComplete 
rm(dataComplete)