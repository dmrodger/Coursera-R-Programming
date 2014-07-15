pollutantmean <- function(directory = "specdata", pollutant = "sulfate", id = 1:332) {
	## set working directory
	setwd("C:/Users/Dylan/Desktop/Coursera R")

	## ensure that the id number is always 3 digits long: 1 would be 001
	filevector <- formatC(id, width = 3, flag = "0")
	## add .csv to the above numbers to create the file names
	filenames <- paste0(filevector, ".csv", sep = "")
	## locate the files
	filedirectory <- file.path(directory, filenames)

	## create empty data frame
	poldata <- data.frame()
	## read in data and combine based on location id
	for(i in 1:length(id)) {
		dataset <- read.csv(filedirectory[[i]], header = TRUE)
		poldata <- rbind(poldata, dataset)
	}

	## calculate and print mean of either sulfate or nitrate pollutant
	polmean <- mean(poldata[[pollutant]], na.rm = T)
	polmean
}