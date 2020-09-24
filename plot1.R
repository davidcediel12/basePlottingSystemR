

if(!file.exists("./data/powerConsumeTidy.csv")){
      stop("Please run first 'obtainData.R'")
}
# Reading and adjusting the data

globalActivePower <- read.csv("./data/powerConsumeTidy.csv")
globalActivePower <- globalActivePower %>%
      select(Global_active_power) %>%     
      filter(!is.na(Global_active_power))

if(!file.exists("./images")){dir.create("./images")}

png(filename = "./images/plot1.png")

hist(globalActivePower$Global_active_power, col = "red", freq = TRUE,
     xlab = "Global Active Power (kilowatts)", 
     ylab = "Frequency", main = "Global Active Power", 
     xlim = c(0, 6))

dev.off()
