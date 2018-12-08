categorize = function(x){
  if(is.na(x) == TRUE) {
    return(x)
  } 
  
  if(x > 0) {
    return(1)
  } else {
    return(0)
  }
}


groupifyMonths = function(mydata, monthLength){
  tempB = c()
  
  for(i in 1:length(mydata)) {
    # initialize smaller container
    tempS = c()
    for (j in 1:monthLength) {
      
      k = j+i*monthLength-3
      if (k<=length(mydata)) {
        # pushing in the smaller container (array)
        tempS <- c(tempS, mydata[k])
      }
    }
    # pushing in the bigger container (array of arrays)
    tempB <- cbind(tempB, tempS)
  }
  return(tempB)
}
