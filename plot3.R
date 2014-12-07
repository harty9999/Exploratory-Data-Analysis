# Read data file 
data <- read.table("./Data/household_power_consumption.txt" 
                   , header = T 
                   , sep = ";" 
                   , na.strings="?" 
                   , stringsAsFactors = FALSE
) 


# Convert the Date and Time variable (Date) to Date/Time class 
data$Date <- as.Date(data$Date, format="%d/%m/%Y") 

# Subset data to only use dates "2007-02-01" and "2007-02-02" 
data_sub <- data[which(data$Date == "2007-02-01" | data$Date == "2007-02-02"), ] 

# Confirm dataset only contains the dates "2007-02-01" and "2007-02-02"  
unique(data_sub$Date) 

# Create Timestamp column from Date & Time columns
data_sub$Timestamp <- as.POSIXct(paste(data_sub$Date, data_sub$Time)) 

# Create Plot 3
with(data_sub, {
  plot(Sub_metering_1 ~ Timestamp
       , type="l"
       , ylab="Energy sub metering"
       , xlab=""
  )
  
  lines(Sub_metering_2 ~ Timestamp
        , col='Red'
  )
  
  lines(Sub_metering_3 ~ Timestamp
        , col='Blue'
  )
  
  legend("topright"
         , legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
         , col = c("black", "red", "blue")
         , lty = 1
         , lwd = 3 
         , bty = "o"
  ) 
}
)

# Saving Plot 3 to file
dev.copy(png
         , "plot3.png"
)

dev.off()