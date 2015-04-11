## Plot 4 R File per the Week 1 assignment
setwd("R")
library(data.table)

## read in dataset
  dataset<-read.table("data/household_power_consumption.txt",header=TRUE,sep=";",stringsAsFactors=FALSE)

## Key on Data and reformat
  testset<-data.table(dataset,key="Date")
  testset<-testset[,Date:=as.Date(Date,"%d/%m/%Y")]

## subset the data for this exercise
  finalset<-subset(testset, Date>=as.Date("2007-02-01") & Date<=as.Date("2007-02-02"))

## create a timestamp
  tstamp<-as.POSIXct(paste(finalset$Date,finalset$Time),format="%Y-%m-%d %H:%M:%S")

## bind it as a column
  finalset<-cbind(finalset,tstamp)

## Start Plot directly to PNG file
  png(file="plot4.png", width=480, height=480, bg="white")

## build a 2 x 2 graphic device
  par(mfrow=c(2,2))

## plot upper Left
  plot(finalset$tstamp,finalset$Global_active_power,type="l", ylab="Global Active Power",xlab="")

## plot upper Right
  plot(finalset$tstamp,finalset$Voltage,type="l", ylab="Voltage",xlab="datetime")

## plot lower left
  plot(finalset$tstamp,finalset$Sub_metering_1, type="n", ylab="Energy sub metering",xlab="")
  lines(finalset$tstamp,finalset$Sub_metering_1, type="l")
  lines(finalset$tstamp,finalset$Sub_metering_2, type="l",col="red")
  lines(finalset$tstamp,finalset$Sub_metering_3, type="l",col="blue")
  legend("topright",lty=1, col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

## plot lower right
  plot(finalset$tstamp,finalset$Global_reactive_power,type="l", ylab="Global_reactive_power",xlab="datetime")

## save as a PNG
  dev.off()
