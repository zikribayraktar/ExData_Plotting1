
# Project 1, plot 4 code:
#
# Note that this script assumes that this script and the input file are in the same directory.
# Also, the code is written in Windows Operating System through RStudio hence windows()
# graphics device is utilized to plot the figures on screen.
#

# Step: Record date and R version:
(DownloadDate <- date())
(DownloadRversion <- R.version)

# load the data, partially:  
datain <- read.table("household_power_consumption.txt", nrows= 150000, sep=";", header=TRUE, na.string="?")

# Transform the date:
datain$DateTransformed <- as.Date(datain$Date, "%d/%m/%Y")

# Extract the data for the date of 2007-02-01:
DataForDate1 <- datain[datain$DateTransformed == "2007-02-01",]

# Extract the data for the date of 2007-02-02:
DataForDate2 <- datain[datain$DateTransformed == "2007-02-02",]

# Combine the extracted data sets into single data set:
DataExtracted <- rbind(DataForDate1, DataForDate2)

# Subset the Global_active_power column for the histogram:
GAP <- DataExtracted$Global_active_power

dates <- DataExtracted$Date
times <- DataExtracted$Time
x <- paste(dates,times)
xx <- strptime(x, format="%d/%m/%Y %H:%M:%S")

Voltage <- DataExtracted$Voltage
Global_reactive_power <- DataExtracted$Global_reactive_power

# Display the figure on the screen:
windows()
par(mfrow=c(2,2))
# part 1
plot(xx,GAP, type="l", xlab=" ", ylab="Global Active Power")
# part 2
plot(xx,Voltage, type="l", xlab="datetime")
# part 3
with(DataExtracted, plot(xx, Sub_metering_1, type="l", col="black", xlab=" ", ylab="Energy sub metering"))
with(DataExtracted, lines(xx, Sub_metering_2, type="l", col="red", xlab=" ", ylab="Energy sub metering"))
with(DataExtracted, lines(xx, Sub_metering_3, type="l", col="blue", xlab=" ", ylab="Energy sub metering"))
legend("topright", lty=1, bty="n", col=c("black", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
# part 4
plot(xx, Global_reactive_power, type="l", xlab="datetime")


# Save the figure to PNG:
png(file = "plot4.png", units = "px", width=480, height=480, res=NA)
par(mfrow=c(2,2))
# part 1
plot(xx,GAP, type="l", xlab=" ", ylab="Global Active Power")
# part 2
plot(xx,Voltage, type="l", xlab="datetime")
# part 3
with(DataExtracted, plot(xx, Sub_metering_1, type="l", col="black", xlab=" ", ylab="Energy sub metering"))
with(DataExtracted, lines(xx, Sub_metering_2, type="l", col="red", xlab=" ", ylab="Energy sub metering"))
with(DataExtracted, lines(xx, Sub_metering_3, type="l", col="blue", xlab=" ", ylab="Energy sub metering"))
legend("topright", lty=1, bty="n", col=c("black", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
# part 4
plot(xx, Global_reactive_power, type="l", xlab="datetime")


dev.off()

##########################################################
##########################################################
# end-of-file