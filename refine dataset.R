# create and set working directory:
dir.create("Electric Power Consumption")
setwd("Electric Power Consumption")

# download dataset:
download.file(
  url = "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",
  destfile = "raw data (zip)",
  mode='wb', cacheOK=FALSE
)

# unzip file:
unzip("raw data (zip)")

# read data:
consumption <- read.csv2("household_power_consumption.txt",
                       na.strings = "?")

# convert consumption date to YYYY-MM-DD format:
consumption$Date  <-  strptime(consumption$Date, format="%d/%m/%Y")

# subset dataset to target dates February 1 and 2, 2007:
consumption <- consumption[consumption$Date %in% c("2007-02-01","2007-02-02"),]

save(consumption,file = "consumption.RData")

rm(list=ls())
