getwd()
setwd("C:/Users/hml/Documents/R/JHU Exploratory Data Analysis/Week 1")
mydata <- read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
head(mydata)
subdata <- mydata[mydata$Date %in% c("1/2/2007","2/2/2007") ,]
head(subdata)

dt <- strptime(paste(subdata$Date, subdata$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
gap <- as.numeric(subdata$Global_active_power)
grp <- as.numeric(subdata$Global_reactive_power)
vol <- as.numeric(subdata$Voltage)
sm1 <- as.numeric(subdata$Sub_metering_1)
sm2 <- as.numeric(subdata$Sub_metering_2)
sm3 <- as.numeric(subdata$Sub_metering_3)


png("plot4.png", width=500, height=500)
par(mfrow = c(2, 2)) 

plot(dt, gap, type="l", xlab="", ylab="Global Active Power", cex=0.2)
plot(dt, vol, type="l", xlab="datetime", ylab="Voltage")
plot(dt, sm1, type="l", ylab="Energy sub metering", xlab="")
lines(dt, sm2, type="l", col="red")
lines(dt, sm3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"), bty="n")
plot(dt, grp, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()