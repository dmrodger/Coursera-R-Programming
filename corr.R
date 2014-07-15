corr <- function(directory, threshold = 0) {

	## set working directory
	setwd("C:/Users/Dylan/Desktop/Coursera R/specdata")
	## create names of all files in directory
	files <- c(dir())

	## create empty numeric and empty vector
	result <- numeric(0)
	final <- vector()
	
	## return correlation between pollutants where nobs > threshold
	for (i in 1:332) {
		current_file <- read.csv(files[i], header = TRUE)
		result <- current_file[complete.cases(current_file),]
		if(nrow(result)>threshold) {
			final <- append(final,cor(result$nitrate,result$sulfate))
		}
	}
	## print correlation
	return(final)
}
