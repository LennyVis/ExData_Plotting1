DT=read.table("household_power_consumption.txt", sep=";",skip=66637, nrows=2880)
col_names=read.table("household_power_consumption.txt", sep=";",nrows=1)
col_names=unname(unlist(col_names[1,]))

names(DT)=col_names

DT$DateTime=paste(DT$Date, DT$Time, sep=' ')
DateTime=strptime(DT$DateTime, format="%d/%m/%Y %H:%M:%S")

DT$Date=as.Date(DT$Date, "%d/%m/%Y")

#Plot 3
png(file="plot3.png")
plot(DT$DateTime, DT$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(DT$DateTime, DT$Sub_metering_2, type="l")
lines(DT$DateTime, DT$Sub_metering_2, type="l", col="red")
lines(DT$DateTime, DT$Sub_metering_3, type="l", col="blue")
legend("topright", col=c("black", "red", "blue"), cex=0.8, lty=1, legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()