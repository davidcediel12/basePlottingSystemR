library(zip)
library(dplyr)

# Obtaining the data
# this function throw warning because in some cases, instead of a numeric value,
# the value that appear is "?"



# Obtaining the data
if(!file.exists("./data")){dir.create("./data")}

if(!file.exists("./data/exdata_data_household_power_consumption.zip")){
      fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
      download.file(fileUrl, "./data/exdata_data_household_power_consumption.zip")
      unzip("./data/exdata_data_household_power_consumption.zip", exdir = "./data")
}

#Reading and adjusting the values
powerConsume <- read.table("./data/household_power_consumption.txt", 
                           sep = ";", header = TRUE)

powerConsume <- powerConsume %>%
   mutate(Date = as.Date(Date, format = "%d/%m/%Y"), 
           Global_active_power = as.numeric(Global_active_power), 
           Global_reactive_power = as.numeric(Global_reactive_power),
           Voltage = as.numeric(Voltage),
           Global_intensity = as.numeric(Global_intensity),
           Sub_metering_1 = as.numeric(Sub_metering_1),
           Sub_metering_2 = as.numeric(Sub_metering_2),
           Sub_metering_3 = as.numeric(Sub_metering_3)) %>%
   
   filter(Date >= as.Date("2007-02-01", format = "%Y-%m-%d"),
          Date <= as.Date("2007-02-02", format = "%Y-%m-%d"))

#Saving for use in the others scripts
write.csv(powerConsume, "./data/powerConsumeTidy.csv")






