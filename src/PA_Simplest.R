# setting the work directory
setwd('C:/SolarPanelProject/external')

# importing my utils file
source('C:/SolarPanelProject/src/utils/utils_tanjima.R')

# importing data

weatherPA1 = as.data.frame(read.xlsx('Weather_PA.xlsx', 1, header=TRUE, colClasses=NA))
# Assign a heading to the year-month-date column
names(weatherPA1)[1] <- 'YMD'

weatherPA1_LpYr_removed = weatherPA1
LpYrIndices = c()
# Removing the 29th-februaries for simplicity
for(i in 1:length(weatherPA1[,1]) ) {
  if( grepl("02-29", weatherPA1[,1][i]) ) {
    LpYrIndices <- c(LpYrIndices, i)
  }
}

weatherPA1_LpYr_removed = weatherPA1_LpYr_removed[-LpYrIndices, ]

# extracting relevant data
PA_Snow2011 = weatherPA1_LpYr_removed[,3]



# Taking an array of the same size of relevant data.
# and nullifying its content.
PA_Snow2011_Catagorized = PA_Snow2011*0

# categorizing the relevant data using my predefined function
# categorize() defined in ./utils_tanjima.R file
for (i in 1:length(PA_Snow2011)) {
  PA_Snow2011_Catagorized[i] <- categorize( PA_Snow2011[i])
}

# applying the repeat length element funciton on categorized data
rleOutput = rle(PA_Snow2011_Catagorized)
snowCount = data.frame(
  'DaysInARow' = rleOutput$lengths,
  'SnowOrNot' = rleOutput$values
)

# sanitizing snowCount data frame
snowCount_sanitized = snowCount[complete.cases(snowCount),]


# Assuming that it takes some days to clean the snow on the panels,
# let's define the operating time as the period with 7 or more days
# of no-snow (i.e. 0) in a row. Let's filter them
# I WILL DO IT SOON

# Exporting output file
write.table(
  snowCount_sanitized, 
  'OUTPUT_snowCount_sanitized.txt',
  append = FALSE, 
  sep = "\t", 
  dec = ".",
  row.names = FALSE, 
  col.names = TRUE
)
