if(!file.exists("./data/powerConsumeTidy.csv")){
      stop("Please run first 'obtainData.R'")
}

# Reading and adjusting the data
globalActivePower <- read.csv("./data/powerConsumeTidy.csv")


globalActivePower <- globalActivePower %>%
      mutate(datetime = paste(Date, Time)) %>%
      mutate(datetime = as.POSIXlt(datetime, format = "%Y-%m-%d %H:%M:%S")) %>%
      filter(!is.na(datetime))

if(!file.exists("./images")){dir.create("./images")}

png(filename = "./images/plot4.png")

par(mfcol = c(2, 2))
#Same code of  graph 2
with(globalActivePower, plot(datetime, Global_active_power, type = "l", 
                             xlab = "", 
                             ylab = "Global Active Power"))

#Same code of graph 3
with(globalActivePower, {
      plot(datetime, Sub_metering_1, type = "l", 
           ylab = "Energy sub metering", xlab = "")
      points(datetime, Sub_metering_2, col = "red", type = "l")
      points(datetime, Sub_metering_3, col = "blue", type = "l")
      legend("topright", 
             legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
             pch = c("-", "-", "-"), col = c("black", "blue", "red"))
})


with(globalActivePower, plot(datetime, Voltage, type = "l"))


with(globalActivePower, plot(datetime, Global_reactive_power, type = "l"))

dev.off()
