DT=read.table("household_power_consumption.txt", sep=";",skip=66637, nrows=2880)
col_names=read.table("household_power_consumption.txt", sep=";",nrows=1)
col_names=unname(unlist(col_names[1,]))

names(DT)=col_names

DT$DateTime=paste(DT$Date, DT$Time, sep=' ')
DateTime=strptime(DT$DateTime, format="%d/%m/%Y %H:%M:%S")

DT$Date=as.Date(DT$Date, "%d/%m/%Y")

#Plot 2
png(file="plot2.png")
plot(DT$DateTime, DT$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()