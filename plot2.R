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
png(file="plot2.png")
# plot Global Active Power (naxt="n", i.e. no default ticks and labels on x axis)
plot(hpc_sub$Global_active_power,type="l",xlab="", ylab="Global Active Power (kilowatts)", xaxt="n")
# add customized ticks and labels on x axis
axis(1, labels=c("Thu","Fri","Sat"), at=c(1,1440,2880))
# close graphics device
dev.off()
