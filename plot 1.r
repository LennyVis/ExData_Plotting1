DT=read.table("household_power_consumption.txt", sep=";",skip=66637, nrows=2880)
col_names=read.table("household_power_consumption.txt", sep=";",nrows=1)
col_names=unname(unlist(col_names[1,]))

names(DT)=col_names


DT$DateTime=paste(DT$Date, DT$Time, sep=' ')
DateTime=strptime(DT$DateTime, format="%d/%m/%Y %H:%M:%S")

DT$Date=as.Date(DT$Date, "%d/%m/%Y")

#Plot1
png(file="plot1.png")
library(datasets)
hist(DT$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)", ylim=range(0,1200))
dev.off()