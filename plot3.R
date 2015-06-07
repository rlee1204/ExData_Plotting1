getwd()
setwd("C:/Users/hml/Documents/R/JHU Exploratory Data Analysis/Week 1")
mydata <- read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
head(mydata)
subdata <- mydata[mydata$Date %in% c("1/2/2007","2/2/2007") ,]
head(subdata)

dt <- strptime(paste(subdata$Date, subdata$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
sm1 <- as.numeric(subdata$Sub_metering_1)
sm2 <- as.numeric(subdata$Sub_metering_2)
sm3 <- as.numeric(subdata$Sub_metering_3)

png("plot3.png", width=500, height=500)
plot(dt, sm1, type="l", ylab="Energy sub metering", xlab="")
lines(dt, sm2, type="l", col="red")
lines(dt, sm3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2, col=c("black", "red", "blue"))
dev.off()