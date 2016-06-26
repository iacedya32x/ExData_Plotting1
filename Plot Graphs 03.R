# PURPOSE - This program will read in a dataset and produce graphs specified in Week 1
#   of the Coursera course entitled, "Exploratory Data Analysis".

# Get working directory
setwd("C:\\Users\\Warren\\Desktop\\Coursework\\Coursera\\Exploratory Data Analysis\\Week 1 Assignment\\ExData_Plotting1")

# Input text file into R
input <- read.table(file = "household_power_consumption.txt",
                    sep = ";",
                    header = TRUE,
                    stringsAsFactors = FALSE)

input2 <- input

# Format the columns of the dataset

input2$DateTime <- strptime(paste(input2$Date,input2$Time, sep = " "), "%d/%m/%Y %H:%M:%S")
input2$Date <- as.Date(input2$Date, "%d/%m/%Y")
input2$Time <- strptime(input2$Time, "%H:%M:%S")
input2$Global_active_power <- as.numeric(input2$Global_active_power)
input2$Global_reactive_power <- as.numeric(input2$Global_reactive_power)
input2$Voltage <- as.numeric(input2$Voltage)
input2$Global_intensity <- as.numeric(input2$Global_intensity)
input2$Sub_metering_1 <- as.numeric(input2$Sub_metering_1)
input2$Sub_metering_2 <- as.numeric(input2$Sub_metering_2)
input2$Sub_metering_3 <- as.numeric(input2$Sub_metering_3)

# Subset the data.frame to only include February 1 and 2 in 2007 and order by date and time
set01 <- input2[(input2$Date == "2007-02-01" | input2$Date == "2007-02-02"),]
set01 <- set01[order(set01$Date, set01$Time),]

###################################################################
# PLOT 3

# Set up graphics device
png(filename = "plot3.png",
    width = 480,
    height = 480)

plot(set01$DateTime,
     set01$Sub_metering_1,
     type = "l",
     col = "black",
     xlab = "",
     ylab = "Energy sub metering")
points(set01$DateTime,
       set01$Sub_metering_2,
       type = "l",
       col = "red")
points(set01$DateTime,
       set01$Sub_metering_3,
       type = "l",
       col = "blue")
legend("topright",
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lty = c(1,1,1),
       col = c("black", "red", "blue"))

# Turn off graphics device
dev.off()


