if(!file.exists("./data/powerConsumeTidy.csv")){
      stop("Please run first 'obtainData.R'")
}

# Reading and adjusting the data
globalActivePower <- read.csv("./data/powerConsumeTidy.csv")

globalActivePower <- globalActivePower %>%
      select(c(Global_active_power, Date, Time)) %>% 
      mutate(datetime = paste(Date, Time)) %>%
      mutate(datetime = as.POSIXlt(datetime, format = "%Y-%m-%d %H:%M:%S")) %>%
      filter(!is.na(datetime))


if(!file.exists("./images")){dir.create("./images")}

png(filename = "./images/plot2.png")
with(globalActivePower, plot(datetime, Global_active_power, type = "l", 
                             xlab = "", 
                             ylab = "Global Active Power (kilowatts)"))

dev.off()
