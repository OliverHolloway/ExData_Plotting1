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

# make histogram and save to file
png("plot1.png", width=480, height=480)
hist(data$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()