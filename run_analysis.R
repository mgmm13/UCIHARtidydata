############################################################################################
# Filename   : run_analysis.R
# Author     : Marian Grace M. Magallanes
# Description: 
#   Performs combining of training and test data sets from UCI HAR Dataset
#   (https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)
#   and creates a tidy data set from the computed averages of the mean and standard deviation
#   measurements of variables
# Dependencies: 
#   - data.table -> preferred for faster reading and loading of data 
#   - dplyr      -> preferred for piped / chained commands, syntax and aggregation
#   - tidyr      -> preferred for reshaping data via gather,integrated via dplyr chain commands
# Instructions: 
#   Ensure setting of working directory to local directory setup "$<somedir>/UCI HAR Dataset"
#   via setwd() before attempting to run script on your local environment
#   If successfully run, expected to produce tidy data set "signalaverages_tidydata.txt" in working
#   directory.
############################################################################################

# Ensure clean environment state
rm(list = ls())

# Load package dependencies
library(data.table)
library(dplyr)
library(tidyr)

# Define source file variables
testdatafile <- "./test/X_test.txt"
testactfile <- "./test/y_test.txt"
testsubjfile <- "./test/subject_test.txt"
traindatafile <- "./train/X_train.txt"
trainactfile <- "./train/y_train.txt"
trainsubjfile <- "./train/subject_train.txt"

# Load vector of names from features.txt
featcolnames <- read.table("features.txt", sep = "")
# Some characters such as parentheses and comma are removed, cleaned to be correctly assigned as column names of data frame/table below
featcolnames[,2] <- gsub("[\\()]", "", featcolnames[,2])      # remove parentheses
featcolnames[,2] <- gsub(",", "_", featcolnames[,2])          # replace comma with _
featcolnames <- featcolnames[[2]]                             # store column names (2nd field) into vector list

# Load Reference Table for Activity Labels
actlabels <- read.table("activity_labels.txt", sep = "")
names(actlabels) <- c("activityid", "activity")

# Signal Data Table loading function
# Returns a data table (from data.table package) containing signal + activitydata + subject info
loadsignaldata <- function(inputfile, activityfile, subjectfile) {
   signaldata <- fread(inputfile, sep = " ", header = FALSE, strip.white = TRUE)  # load signal data
   activitydata <- read.table(activityfile, sep = "")                             # load activity data
   subjectdata <- read.table(subjectfile, sep = "")                               # load subject data
   names(signaldata) <- featcolnames
   # Combine with activity, subject
   signaldata <- cbind(signaldata, activityid=activitydata[[1]])
   signaldata <- cbind(signaldata, subject=subjectdata[[1]])
   signaldata
}

# Load signal data for test and train
testdata <- loadsignaldata(testdatafile, testactfile, testsubjfile)
traindata <- loadsignaldata(traindatafile, trainactfile, trainsubjfile)

# (Step 1) Combine Signal Data from training and testing 
signaldata <- rbind(traindata, testdata)

# Remove individual data tables for train and test 
rm(traindata)
rm(testdata)

# (Step 2) Extract relevant fields and measurements (mean(), std(), activity and subject)
filteredcols <- grep("-mean[^Freq]|-mean$|-std|activity|subject", names(signaldata))
signaldata <- signaldata[ , filteredcols, with = FALSE]

# (Step 3) Display corresponding activity names (by merging with activity labels data)
signaldata <- signaldata %>% 
              merge(actlabels) %>%                    # merge with actlabels table
              select(-activityid) %>%                 # remove activityid field
              select(activity, subject, everything()) # reorder variables

# (Step 4) Rename columns to more descriptive variable names
desccolnames <- gsub("^t", "time", names(signaldata)) # replace variables starting with t with time
desccolnames <- gsub("^f", "freq", desccolnames)      # replace variables starting with f with frequency
desccolnames <- gsub("-mean", "Mean", desccolnames)   # replace -mean to Mean
desccolnames <- gsub("-std", "Std", desccolnames)     # replace -std to Std
names(signaldata) <- desccolnames

# (Step 5) Compute for averages per activity and subject, sorted
average_signaldata <- signaldata %>%
                      gather(signalvariable, value, -subject, -activity) %>%
                      group_by(activity,subject, signalvariable) %>%
                      summarize(averagevalue = mean(value)) %>%
                      arrange(activity, subject)

# Write output tidy data to file
write.table(average_signaldata, "signalaverages_tidydata.txt", row.names = FALSE)