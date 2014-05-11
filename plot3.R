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
png(file="plot3.png")
# plot Energy sub metering 1 (naxt="n", i.e. no default ticks and labels on x axis)
plot(hpc_sub$Sub_metering_1,type="l", col="black", xlab="", ylab="Energy sub metering", xaxt="n")
# add line for Energy sub metering 2
lines(hpc_sub$Sub_metering_2, col="red")
# add line for Energy sub metering 3
lines(hpc_sub$Sub_metering_3, col="blue")
# add customized ticks and labels on x axis
axis(1, labels=c("Thu","Fri","Sat"), at=c(1,1440,2880))
# legend
legend("topright", col=c("black", "red", "blue"), legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty=1)
# close graphics device
dev.off()