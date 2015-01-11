
# Project 1, plot 1 code:
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

# Display the figure on the screen:
windows()
hist(GAP, col="red", xlab="Global Active Power (kilowatts)", ylab="Frequency", main="Global Active Power")

# Save the figure to PNG:
png(file = "plot1.png", units = "px", width=480, height=480, res=NA)
#png(file = "plot1.png")
hist(GAP, col="red", xlab="Global Active Power (kilowatts)", ylab="Frequency", main="Global Active Power")
dev.off()

##########################################################
##########################################################
# end-of-file