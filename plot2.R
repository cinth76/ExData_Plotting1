

dataFile <- "./household_power_consumption.txt"
data <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

##subSetData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

data2007 <- subset(data,data$Date %in% c("1/2/2007","2/2/2007"))
data2007$Global_active_power <- as.numeric(data2007$Global_active_power)

data2007$Date <- as.Date(data2007$Date,"%d/%m/%Y")
data2007<-cbind(data2007, "DateTime" = as.POSIXct(paste(data2007$Date, data2007$Time)))

## Plot
png("plot2.png", width=480, height=480)
with(data2007, {
  plot(Global_active_power~DateTime, type="l",
       ylab="Global Active Power (kilowatts)", xlab="")
})
dev.off()