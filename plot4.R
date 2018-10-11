dataFile <- "./household_power_consumption.txt"
data <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

## select only the data we need
data2007 <- subset(data,data$Date %in% c("1/2/2007","2/2/2007"))

## format data as needed
data2007$Global_active_power <- as.numeric(data2007$Global_active_power)
data2007$Date <- as.Date(data2007$Date,"%d/%m/%Y")
data2007<-cbind(data2007, "DateTime" = as.POSIXct(paste(data2007$Date, data2007$Time)))
data2007[,3:9] <- sapply(data2007[,3:9],as.numeric)

## open device
png("plot4.png", width=480, height=480)

par(mfrow=c(2,2),mar=c(4,4,1,1))

with(data2007, plot(Global_active_power ~ DateTime, type="l", xlab= "", ylab="Global Active Power"))
with(data2007, plot(Voltage ~ DateTime, type="l",ylab="Voltage",xlab="Datetime"))

with(data2007, {plot(Sub_metering_1 ~ DateTime, type="l", xlab= "", ylab="Energy Sub Metering")})
with(data2007, lines(Sub_metering_2 ~ DateTime, type="l",col= "red"))
with(data2007, lines(Sub_metering_3 ~ DateTime, type="l",col= "blue"))
legend("topright",lty=1, lwd =3,col=c("black","red","blue"),legend=c("Submetering1","Submetering2","Submetering3"))

with(data2007, plot(Global_reactive_power ~ DateTime, type="l", ylab="Global Reactive Power",xlab="Datetime"))

dev.off()


