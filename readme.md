# Data Analysis Project on Solar Panel

> **Download** the zip file from the green button, extract, and run in RStudio.

(or, if you are familiar with git, you already know what to do ;-) 

## Description
- `external` folder contains all the imported and exported data files. So you must set this folder as your working directory.
- `src` folder contains the source code.

## Progress
Following the professor's discussoin, the **simplest** possible model on the basis of `external/Weather_PA.xlsx` file is saffolded so far. The file: `external/OUTPUT_snowCount_sanitized` contains the 0s and 1s of expectation.

## Interpretatoin of output
For examle the first row of the output file means
> 6 days in a row, No snow
Next row means
> 1	day it snowed.
etc.

## Flaw
Because the data is discontinuous, the March data is concatenated with the next year's January data. So, if there were 5 days no snow in a row in the end of March, and 5 days no snow at the beginning of next January, the output gives us a 10 days no snow in a row. We have to somehow seperate all the months either programmatically or by hand.