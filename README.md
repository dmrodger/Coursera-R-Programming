Coursera-R-Programming
======================

This is the 2nd course in Coursera's Data Science Specialization with John Hopkins University

Assignment 1: Air Pollution

Part 1: pollutantmean.R
  - calculates mean of a pollutant (sulfate or nitrate) across a list of 332 monitors
  - 3 arguments: directory, pollutant, and id
  - returns specified pollutant across all monitors specified, excluding NA values

Part 2: complete.R
  - Reads directory full of files and reports the number of completely observed cases in each data file (nitrate and sulfate)
  - 2 arguments: directory, id
  - Returns a data frame where the first column is the name of the file and the second column is # of complete cases

Part 3: corr.R
  - Takes a directory of data files and a threshold for complete cases and calculates correlation between sulfate and nitrate
  - Only for monitor locations where the number of complete cases is greater than the threshold
  - Function should return a vector of correlations for monitors that meet the threshold requirement
  - If no monitors meet requirement, return a numeriv vector of length 0


Assignment 2: Caching the Inverse of a Matrix, cachematrix.R
  - Write two functions: makeCacheMatrix and cacheSolve
  - makeCacheMatrix: creates a special "matrix" object that can cache its inverse
  - cacheSolve: computes the inverse of the special "matrix"; if inverse already calculated then this returns inverse from the cache
  - Assume matrix is always invertible

Assignment 3: 
  - The data for this assignment come from the Hospital Compare web site (http://hospitalcompare.hss.gov) run by the U.S. Department of Health and Human Services. The purpose of the web site is to provide data and information about the quality of care at over 4,000 Medicare-certified hospitals in the U.S. This dataset essentially covers all major U.S. hospitals. This dataset is used for a variety of purposes, including determining whether hospitals should be fined for not providing high quality care to patients (see http://goo.gl/jAXFX for some background on this particular topic).
  - The subset looked at for this assignment is in 3 files:
      •	outcome-of-care-measures.csv: Contains information about 30-day mortality and readmission rates for heart attacks, heart failure, and pneumonia for over 4,000 hospitals.
      •	hospital-data.csv: Contains information about each hospital.
      •	Hospital_Revised_Flatfiles.pdf: Descriptions of the variables in each file (i.e. the code book).

Part 1: Finding the best hospital in a state, best.R
  - Returns a character vector with the name of the hospital that has the best (lowest) 30-day mortality for specified outcome in that state
  - Arguments: state, outcome
  - Outcomes can be one of "heart attack", "heart failure", or "pneumonia"
  - Hospitals that do not have data should be excluded from the rankings

Part 2: Ranking hospitals by outcome in a state, rankhospital.R
  - Arguments: state, outcome, num
  - Returns name of hospital from a specific state, outcome, and ranking

Part 3: Ranking hospitals in all states, rankall.R
  - Arguments: outcome, num
  - Returns a 2-column data frame containing the hospital in each state with specified ranking in num
  - Should return a value for every state (some may be NA)
  - First column is named hospital, second is state


