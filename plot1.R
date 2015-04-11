## Plot 1 R File per the Week 1 assignment
setwd("R")
library(data.table)

## read in dataset
  dataset<-read.table("data/household_power_consumption.txt",header=TRUE,sep=";",stringsAsFactors=FALSE)

## Key on Data and reformat
  testset<-data.table(dataset,key="Date")
  testset<-testset[,Date:=as.Date(Date,"%d/%m/%Y")]

## subset the data for this exercise
  finalset<-subset(testset, Date>=as.Date("2007-02-01") & Date<=as.Date("2007-02-02"))

## Start Plot directly to PNG file
  png(file="plot1.png", width=480, height=480, bg="white")

## Plot Histogram
  hist(as.numeric(finalset$Global_active_power),main="Global Active Power",col="red",xlab="Global Active Power (kilowatts)")

## Save to PNG file
  dev.off()
