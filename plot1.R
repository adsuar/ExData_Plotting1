#########################################################
#
# filename: plot1.R
# author: Antonio Adsuar
# description: script that generates the first plot of
#              the first course project of the Coursera's
#              Exploratory Data Analysis course.

# Removal of previousily created variables
rm(list=ls())

# We read the data file, using as a separator the ';' character,
# avoiding the creation of factors, and assigning NA values to
# cells valued as '?'
hpc <- read.csv("household_power_consumption.txt",header=T,sep=";",stringsAsFactors=F, na.strings="?")

# Remove the lines that are different from February first and second, 2007.
# I don't need to perform any transformation over the data.
hpc_filtered <- hpc[hpc[,"Date"] == "1/2/2007" | hpc[,"Date"] == "2/2/2007",]

# Graphical device; we don't need to specify height and width to 480
# since the default value is 480 in both cases.
png("plot1.png",width=480,height=480)
# We plot the histogram.
hist(hpc_filtered$Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")
# We shutdown the graphical device.
dev.off()
