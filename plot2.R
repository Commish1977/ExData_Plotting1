## Plot 2 R File per the Week 1 assignment
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

## Plot line graph
  plot(finalset$tstamp,finalset$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")

## Save as PNG file
dev.copy(png,file="plot2.png")
dev.off()
