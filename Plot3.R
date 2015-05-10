# This script plots the Global Active Kilowatts quantity used 
#                     against frequency

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

## Making Plot 3
with(seldata, plot(DateTime,Sub_metering_1,main="",xlab="",
        ylab="Energy sub metering", col="black",type="l"))
with(seldata, lines(DateTime,Sub_metering_2,col="red"))
with(seldata, lines(DateTime,Sub_metering_3,col="blue"))
legend("topright", col = c("black","red", "blue"), lwd=1, 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       x.intersp=0.5, y.intersp=0.3, cex=0.6)
    
## Saving to plot as a png file
dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()


