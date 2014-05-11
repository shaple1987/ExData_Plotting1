fname<-"household_power_consumption.txt"
data<-read.table(fname,sep=";",header=TRUE, na.strings="?")
data[,"Date"]<-as.Date(data[,"Date"],"%d/%m/%Y")
startDate<-as.Date("2007-02-01")
endDate<-as.Date("2007-02-02")
subset<- data[,"Date"]>=startDate & data[,"Date"]<=endDate
data_subset<-data[subset,]
Datetime<-strptime(paste(data_subset[,"Date"],data_subset[,"Time"]),"%Y-%m-%d %H:%M:%S")
png(file="ExData_Plotting1/plot1.png")
with(data_subset,hist(Global_active_power,col="red",xlab="Global Active Power (kilowatts)", main="Global Active Power"))
dev.off()