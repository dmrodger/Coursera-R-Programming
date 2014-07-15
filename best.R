best <- function(state, outcome) {
	## set working directory
	setwd("C:/Users/Dylan/Desktop/Coursera R/Assignment3")

	## Read outcome data
	file <- read.csv("outcome-of-care-measures.csv", na.strings = "Not Available")
	

	## Restricts columns to hospital, state, heart attack, heart failure, and pneumonia
	mydata <- file[,c(2, 7, 11, 17, 23)]
	## Rename columns
	colnames(mydata) <- c("Hospital", "State", "heart attack", "heart failure", "pneumonia")
	## Restrict outcome
	outcome.data <- mydata[c("Hospital", "State", outcome)]

	## Organize data by state
	state_data <- split(outcome.data, outcome.data$State)
	## Create list of specified state
	state.data <- state_data[state]

	## Convert list back to data frame
	state.outcome <- do.call(rbind.data.frame, state.data)
	final.df <- data.frame(lapply(state.outcome, as.character), stringsAsFactors = FALSE)
	## Convert outcome column from character to numeric data
	final.df[,3] <- as.numeric(as.character(final.df[,3]))
		
	## Sort data by best (lowest) 30-day mortality rate for specified outcome and state
	hospital.order <- final.df[order(final.df[,3]), ]
	
	## Return hospital name in that state with lowest 30-day death rate
	my.answer <- hospital.order[1,1]
	print(my.answer)
}