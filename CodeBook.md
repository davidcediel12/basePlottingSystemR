# CodeBook 

In this markdown file, I'm going to explain the transformations that I made to the data 


# Variables in the script 

* fileUrl: For download the zip file
* powerConsume: Used in 'obtainData.R' to read the big dataset and tidying it

* globalActivePower: dataframe used in 'plot1.R' and 'plot2.R' to read the tidy data

* subMetering: used in 'plot3.R' to read the tidy data

* power: used in 'plot4.R' to read the tidy data

# Transformations 

The majority of the transformations occur in *obtainData.R* for clean up the data, the following transformation were made:

1. Change the class of column *Date* to Date
2. Change the rest of columns to numeric 
3. Filter the dates to have only the range that are spacified in the instructions (20007-02-01:2007-02-02)

4. Create a new column called *datetime* pasting the columns *Date* and *time* and trasnforming to POSIXlt format, this are made in the Scripts for plotting.