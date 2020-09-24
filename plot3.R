if(!file.exists("./data/powerConsumeTidy.csv")){
      stop("Please run first 'obtainData.R'")
}

# Reading and adjusting the data
subMetering <- read.csv("./data/powerConsumeTidy.csv")


subMetering <- subMetering %>%
      mutate(datetime = paste(Date, Time)) %>%
      mutate(datetime = as.POSIXlt(datetime, format = "%Y-%m-%d %H:%M:%S")) %>%
      filter(!is.na(datetime))

if(!file.exists("./images")){dir.create("./images")}

png(filename = "./images/plot3.png")
with(subMetering, {
      plot(datetime, Sub_metering_1, type = "l", 
           ylab = "Energy sub metering", xlab = "")
      points(datetime, Sub_metering_2, col = "red", type = "l")
      points(datetime, Sub_metering_3, col = "blue", type = "l")
      legend("topright", 
             legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
             pch = c("-", "-", "-"), col = c("black", "blue", "red"))
})

dev.off()
      