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

# Create Plot 1
with(data_sub,
     hist(Global_active_power
          , col = "Red"
          , border = "Black"
          , main = "Global Active Power"
          , xlab = "Global Active Power (kilowatts)"
          , ylab = "Frequency"
          , ylim = c(0, 1200)
     ) 
)

# Saving Plot 1 to file
dev.copy(png
         , "plot1.png"
)

dev.off()