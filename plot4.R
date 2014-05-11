# read dataset
hpc_ch <- read.csv2("household_power_consumption.txt", colClasses="character")
# convert Date into format yyyy-mm-dd
hpc_ch[,1] <- as.Date(hpc_ch[,1], "%d/%m/%Y")
# only use data from 2007-02-01 to 2007-02-02
hpc_sub <- subset(hpc_ch, Date >= "2007-02-01" & Date <= "2007-02-02")
# convert to numeric
for (i in 3:9) {
    hpc_sub[,i] <- as.numeric(hpc_sub[,i])
}
# launch png graphics device
# default width/height 480 px (as required)
png(file="plot4.png")
# set graphical parameters
# 4 plots in 2 rows and 2 columns
par(mfrow = c(2,2))
# plot 1,1
# --------
# plot Global Active Power (naxt="n", i.e. no default ticks and labels on x axis)
plot(hpc_sub$Global_active_power,type="l",xlab="", ylab="Global Active Power", xaxt="n")
# add customized ticks and labels on x axis
axis(1, labels=c("Thu","Fri","Sat"), at=c(1,1440,2880))
# plot 1,2
# --------
# plot Voltage (naxt="n", i.e. no default ticks and labels on x axis)
plot(hpc_sub$Voltage,type="l",xlab="datetime", ylab="Voltage", xaxt="n")
# add customized ticks and labels on x axis
axis(1, labels=c("Thu","Fri","Sat"), at=c(1,1440,2880))
# plot 2,1
# --------
# plot Energy sub metering 1 (naxt="n", i.e. no default ticks and labels on x axis)
plot(hpc_sub$Sub_metering_1,type="l", col="black", xlab="", ylab="Energy sub metering", xaxt="n")
# add line for Energy sub metering 2
lines(hpc_sub$Sub_metering_2, col="red")
# add line for Energy sub metering 3
lines(hpc_sub$Sub_metering_3, col="blue")
# add customized ticks and labels on x axis
axis(1, labels=c("Thu","Fri","Sat"), at=c(1,1440,2880))
# legend without box around the legend
legend("topright", col=c("black", "red", "blue"), 
       legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), bty="n", lty=1, cex=.90)
# plot 2,2
# --------
# plot Global reactive power (naxt="n", i.e. no default ticks and labels on x axis)
plot(hpc_sub$Global_reactive_power, type="l",xlab="datetime", ylab="Global_reactive_power",
     xaxt="n")
# add customized ticks and labels on x axis
axis(1, labels=c("Thu","Fri","Sat"), at=c(1,1440,2880))

# close graphics device
dev.off()