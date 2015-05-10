# This script plots the Global Active Kilowatts quantity used 
# against frequency

## Read all the data
housepc <- read.table("../household_power_consumption.txt", 
                 header=T, sep=';', na.strings="?")
housepc[,1] <- as.Date(housepc[,1], format="%d/%m/%Y")

## Selecting the data for analysis
seldata <- housepc[housepc[,1] >= "2007-02-01" & 
                   housepc[,1] <= "2007-02-02",]
rm(housepc)

## Converting dates and times
datetime <- strptime(paste(as.Date(seldata$Date), seldata$Time), 
    format="%Y-%m-%d %H:%M:%S")
seldata$DateTime <- as.POSIXct(datetime)

## Making Plot 2
plot(seldata$DateTime,seldata$Global_active_power, type="l", 
     col="black", ylab="Global Active Power (kilowatts)", 
     xlab="")
     
## Saving to plot as a png file
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()


