rankhospital <- function(state, outcome, num) {

	setwd("C:/Users/Dylan/Desktop/Coursera R/Assignment3")

	## Read outcome data
	file <- read.csv("outcome-of-care-measures.csv", na.strings = "Not Available")
	## Retrieve state codes
	state.list <- levels(factor(file[,7]))

	# converts num = "best" input to num = 1
	if (num == "best") {
		num = 1
	}


	## Create error message for invalid state
	if (! state %in% state.list) {
		stop("invalid state")
	}

	## Create error message for invalid outcome
	if (! outcome %in% c("heart attack", "heart failure", "pneumonia")) {
		stop("invalid outcome")
	}

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
	## Remove NAs
	final.df <- na.omit(final.df)
		

	## Sort data by best (lowest) 30-day mortality rate for specified outcome and state
	hospital.order <- final.df[ order(final.df[,3], final.df[,1]), ]

	## converts num = "best" input to the last row

	if (num == "worst") {
		num = nrow(hospital.order)
	}
	
	## Return hospital name in that state with lowest 30-day death rate
	my.answer <- hospital.order[num,1]
	print(my.answer)

	
}

rankhospital("MD", "heart attack", "worst")