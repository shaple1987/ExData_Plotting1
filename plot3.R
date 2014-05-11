fname<-"household_power_consumption.txt"
data<-read.table(fname,sep=";",header=TRUE, na.strings="?")
data[,"Date"]<-as.Date(data[,"Date"],"%d/%m/%Y")
startDate<-as.Date("2007-02-01")
endDate<-as.Date("2007-02-02")
subset<- data[,"Date"]>=startDate & data[,"Date"]<=endDate
data_subset<-data[subset,]
Datetime<-strptime(paste(data_subset[,"Date"],data_subset[,"Time"]),"%Y-%m-%d %H:%M:%S")
png(file="ExData_Plotting1/plot3.png")
plot(Datetime,data_subset[,"Sub_metering_1"],type="l",xlab="",ylab="Energy sub metering")
lines(Datetime,data_subset[,"Sub_metering_2"],col="red")
lines(Datetime,data_subset[,"Sub_metering_3"],col="blue")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty="solid",
       col=c("black","red","blue"))
dev.off()