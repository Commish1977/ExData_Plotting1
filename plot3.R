## Plot 3 R File per the Week 1 assignment
  setwd("R")
  library(data.table)

## read in dataset
  dataset<-read.table("data/household_power_consumption.txt",header=TRUE,sep=";",stringsAsFactors=FALSE)

## Key on Date and reformat
  testset<-data.table(dataset,key="Date")
  testset<-testset[,Date:=as.Date(Date,"%d/%m/%Y")]

## subset the data for this exercise
  finalset<-subset(testset, Date>=as.Date("2007-02-01") & Date<=as.Date("2007-02-02"))

## create a timestamp
  tstamp<-as.POSIXct(paste(finalset$Date,finalset$Time),format="%Y-%m-%d %H:%M:%S")

## bind it as a column
  finalset<-cbind(finalset,tstamp)

## Create blank plot to work in
  plot(finalset$tstamp,finalset$Sub_metering_1, type="n", ylab="Energy sub metering",xlab="")

## Plot 3 lines for each data column, Black/red/blue
  lines(finalset$tstamp,finalset$Sub_metering_1, type="l")
  lines(finalset$tstamp,finalset$Sub_metering_2, type="l",col="red")
  lines(finalset$tstamp,finalset$Sub_metering_3, type="l",col="blue")

## Add Legend  
  legend("topright",pch="-",col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

## Save to PNG file
  dev.copy(png,file="plot3.png")
  dev.off()
