rankall <- function(outcome, num = "best") {

	## Set working directory
	setwd("C:/Users/Dylan/Desktop/Coursera R/Assignment3")

	## Read outcome data
	file <- read.csv("outcome-of-care-measures.csv", na.strings = "Not Available")

	## Restricts columns to hospital, state, heart attack, heart failure, and pneumonia
	mydata <- file[,c(2, 7, 11, 17, 23)]
	## Rename columns
	colnames(mydata) <- c("Hospital", "State", "heart attack", "heart failure", "pneumonia")

	## Restrict data frame to specific outcome
	outcome.data <- mydata[,c("Hospital", "State", outcome)]

	## Order outcome mortality rate in ascending order
	mortality.rank <- outcome.data[ order(outcome.data[,3], outcome.data[,1]), ]

	## Split data into groups by state
	state.split <- split(mortality.rank, mortality.rank$State)

}

