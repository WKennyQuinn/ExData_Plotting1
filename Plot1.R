#Plot1.R
#Submitted for Week 1 Course Project of Coursera Exploratory Data course.
#Downloads and reads data of household power consumption from UCI Machine Learning Repository
#Creates and saves a plot as a Plot1.png in the working directory

#Check for if file exists and is unzipped, if not - download and/or unzip

fileUrl<- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"

if(!file.exists("./exdata-data-household_power_consumption.zip")){
    download.file(fileUrl,".//exdata-data-household_power_consumption.zip")
    datedownloaded = date()
}

if(!file.exists("./exdata-data-household_power_consumption")){
    unzip("./exdata-data-household_power_consumption.zip",exdir="./exdata-data-household_power_consumption")
}


filePath <- "./exdata-data-household_power_consumption/household_power_consumption.txt"
#Check file size before loading
fileSize <- file.info(filePath)$size

#Load data from 2007-02-01 and 2007-02-02
StartLine <- grep("1/2/2007",readLines(filePath))[1]
StopLine <- grep("3/2/2007",readLines(filePath))[1]
NumLines <- StopLine - StartLine

EnergyData<-read.table(filePath,sep=";",skip=StartLine-1,nrows=NumLines,stringsAsFactors=FALSE)
colnames(EnergyData) <- read.table(filePath,sep=";",nrows=1,stringsAsFactors=FALSE)

#Check for NAs
EnergyData[EnergyData == "?"] <- NA

#Convert Date and time to Date/Time class
EnergyData$DateTime <- strptime(paste0(EnergyData$Date,EnergyData$Time,sep=""),format="%d/%m/%Y%H:%M:%S")

#Create Plot 1
png("./Plot1.png",width=480,height=480,units="px",bg="transparent")
hist(EnergyData$Global_active_power,main = "Global Active Power", xlab="Global Active Power (kilowatts)", ylab = "Frequency",col="red")
dev.off()