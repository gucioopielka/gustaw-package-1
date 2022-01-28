library(calendar)
library(readr)
library(knitr)
library(dplyr)

remind_me <- function(){
  myfile <- "https://www.officeholidays.com/ics/netherlands"
  ics_raw <- readLines(myfile) 
  myfile <- ical(ics_raw, ic_attributes = NULL)
  
  next_dates <- myfile[!myfile$`DTEND;VALUE=DATE` < Sys.Date(),]
  next_dates <- next_dates %>% select("SUMMARY;LANGUAGE=en-us", "DTSTART;VALUE=DATE")
  next_dates$`SUMMARY;LANGUAGE=en-us` <- gsub("Netherlands: ", '', next_dates$`SUMMARY;LANGUAGE=en-us`)
  print(next_dates)
}

source("Week3R.R")

cheat <- function(exercise) {
  if (exercise == "Q3.1.1") {
    Q3.1.1()
  } else if (exercise == "Q3.1.2") {
    Q3.1.2()
  } else if (exercise == "Q3.1.3") {
    Q3.1.3()
  } else if (exercise == "Q3.1.4") {
    Q3.1.4()
  } else {
    print("Cheats are only available for the first 4 assignments.")
  }
}



