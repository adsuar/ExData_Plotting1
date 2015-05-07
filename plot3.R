#########################################################
#
# filename: plot3.R
# author: Antonio Adsuar
# description: script that generates the third plot of
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

# Now I need to create a custom column to show in the x-axis the
# results between Thursday and Saturday.
# Thanks to the "Discussion Forums" :D
datetime <- strptime(paste(hpc_filtered$Date, hpc_filtered$Time), format="%d/%m/%Y %H:%M:%S", tz="C")
hpc_filtered$DateTime <- datetime

# Graphical device; we don't need to specify height and width to 480
# since the default value is 480 in both cases.
png("plot3.png",width=480,height=480)
# We plot the graph.
plot(x=hpc_filtered$DateTime, y=hpc_filtered[,"Sub_metering_1"],type="l",xlab="", ylab="Energy sub metering", col="black")
lines(x=hpc_filtered$DateTime, y=hpc_filtered[,"Sub_metering_2"], col="red")
lines(x=hpc_filtered$DateTime, y=hpc_filtered[,"Sub_metering_3"], col="blue")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col=c("black","red","blue"), lwd=2,lty=1)
# We shutdown the graphical device.
dev.off()
