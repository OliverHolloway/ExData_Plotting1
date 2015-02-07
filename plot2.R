# load the data
data_full <- read.csv(file="./data/household_power_consumption.txt", 
                      sep=';', 
                      na.strings="?", 
                      check.names=F, 
                      stringsAsFactors=F, 
                      comment.char="", 
                      quote='\"'
)

# convert Date from char to date field to enable date-based subsetting
data_full$Date <- as.Date(data_full$Date, format="%d/%m/%Y")

# subset to the two days required and dump full data set out of memory
data <- subset(data_full, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(data_full)

# create a datetime column for use in the plot
datetime <- paste(as.Date(data$Date), data$Time)
data$Datetime <- as.POSIXct(datetime)

# make plot and save to file
png("plot2.png", width=480, height=480)
plot(data$Global_active_power~data$Datetime, type="l", ylab="Global Active Power (kilowatts)", xlab="")
dev.off()