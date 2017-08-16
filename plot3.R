# read the data into R
data <- read.table("household_power_consumption.txt",skip=1,sep=";")
# Rename the column names
names(data) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
# Select only relevant rows
subdata <- subset(data,data$Date=="1/2/2007" | data$Date =="2/2/2007")
subdata$Global_active_power <- as.numeric(as.character(subdata$Global_active_power))
subdata$Sub_metering_1 <- as.numeric(as.character(subdata$Sub_metering_1))
subdata$Sub_metering_2 <- as.numeric(as.character(subdata$Sub_metering_2))
subdata$Sub_metering_3 <- as.numeric(as.character(subdata$Sub_metering_3))

# Convert date and time

subdata$Date <- as.Date(subdata$Date, format="%d/%m/%Y")
datetime <- paste(as.Date(subdata$Date), subdata$Time)
subdata$Datetime <- as.POSIXct(datetime)



# Convert date and time

subdata$Date <- as.Date(subdata$Date, format="%d/%m/%Y")
datetime <- paste(as.Date(subdata$Date), subdata$Time)
subdata$Datetime <- as.POSIXct(datetime)



# Plot 3

plot(subdata$Datetime,subdata$Sub_metering_1,type="l",xlab="",ylab="Energy sub metering")
with(subdata,lines(Datetime,Sub_metering_2,col="red"))
with(subdata,lines(Datetime,Sub_metering_3,col="blue"))

dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()
