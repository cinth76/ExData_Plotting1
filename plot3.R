dataFile <- "./household_power_consumption.txt"
data <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

##subSetData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

data2007 <- subset(data,data$Date %in% c("1/2/2007","2/2/2007"))
data2007$Global_active_power <- as.numeric(data2007$Global_active_power)

data2007$Date <- as.Date(data2007$Date,"%d/%m/%Y")
data2007<-cbind(data2007, "DateTime" = as.POSIXct(paste(data2007$Date, data2007$Time)))

data2007[,7:9] <- sapply(data2007[,7:9],as.numeric)

png("plot3.png", width=480, height=480)

with(data2007, {plot(Sub_metering_1 ~ DateTime, type="l", xlab= "", ylab="Energy Sub Metering")})
with(data2007, lines(Sub_metering_2 ~ DateTime, type="l",col= "red"))
with(data2007, lines(Sub_metering_3 ~ DateTime, type="l",col= "blue"))
legend("topright",lty=1, lwd =3,col=c("black","red","blue"),legend=c("Submetering1","Submetering2","Submetering3"))

dev.off()

legend("topright",lty=1, lwd =3,col=c("black","red","blue"),legend=c("Submetering1","Submetering2","Submetering3"))
