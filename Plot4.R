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

## Making Plot 4
par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))
with(seldata, {
    plot(seldata$DateTime,seldata$Global_active_power, type="l", 
        col="black", ylab="Global Active Power (kilowatts)", 
        xlab="")
    plot(seldata$DateTime,seldata$Voltage, type="l", 
         col="black", ylab="Voltage", 
         xlab="datetime")
    plot(DateTime,Sub_metering_1,main="",xlab="",
         ylab="Energy sub metering", col="black",type="l")
    lines(DateTime,Sub_metering_2,col="red")
    lines(DateTime,Sub_metering_3,col="blue")
    legend("topright", col = c("black","red", "blue"), lwd=1, 
           legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
           x.intersp=0.5, y.intersp=0.2, cex=0.5, bty="n")
    plot(seldata$DateTime,seldata$Global_reactive_power, type="l",
         xlab="datetime", ylab="Global_reactive_power", main="",
         col="black")
    })
     
## Saving to plot as a png file
dev.copy(png, file="plot4.png", height=480, width=480)
dev.off()


