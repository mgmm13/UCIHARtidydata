
# Code Book - Tidy Data for Mean and Standard Deviation Measurements from UCI HAR Data set

## Source Data Set
The tidied data is based from the UCI HAR Dataset. The dataset contains information on the measured acceleration 
signals from subjects performing specific activities which are then captured by the smartphone's sensors.
Further information as provided is available here: 
	<http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones>
The dataset was downloaded using below provided link: 
	<https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip>
The data set was divided into two sets: training and testing. 


## Source Data Signal Variables
The source data contains signal measurements based on movements performed by subjects for varying activities. 
Originally, the data set contains 561 columns/fields of signals and computations to record an observation. 
These data was read from *X_test.txt* and *X_train.txt* files. 

For the purpose processing of the tidy data set, only signal variables with mean (mean()) and standard deviation (std()) measurements have been extracted and renamed below to be more readable (please see Table 1 below). 
The complete list of feature labels have been read from *features.txt*.

For the description of each signal measurement, this can be referred to the *features_info.txt* file of the dataset, as quoted below:

> The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

> Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

> Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

> These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

> tBodyAcc-XYZ
> tGravityAcc-XYZ
> tBodyAccJerk-XYZ
> tBodyGyro-XYZ
> tBodyGyroJerk-XYZ
> tBodyAccMag
> tGravityAccMag
> tBodyAccJerkMag
> tBodyGyroMag
> tBodyGyroJerkMag
> fBodyAcc-XYZ
> fBodyAccJerk-XYZ
> fBodyGyro-XYZ
> fBodyAccMag
> fBodyAccJerkMag
> fBodyGyroMag
> fBodyGyroJerkMag

### Table 1. Signal Variables Gathered

| New Signal Variable Name (As Renamed in Tidy Data Set) | Original Signal Variable     |
| -------------------------------------------------------|------------------------------|
| timeBodyAccMean-X                                      | tBodyAcc-mean()-X            |
| timeBodyAccMean-Y                                      | tBodyAcc-mean()-Y            |
| timeBodyAccStd-Y                                       | tBodyAcc-std()-Y             |
| timeGravityAccMean-Y                                   | tGravityAcc-mean()-Y         |
| timeGravityAccStd-Y                                    | tGravityAcc-std()-Y          |
| timeBodyAccJerkMean-Y                                  | tBodyAccJerk-mean()-Y        |
| timeBodyAccJerkStd-Y                                   | tBodyAccJerk-std()-Y         |
| timeBodyGyroMean-Y                                     | tBodyGyro-mean()-Y           |
| timeBodyGyroStd-Y                                      | tBodyGyro-std()-Y            |
| timeBodyGyroJerkMean-Y                                 | tBodyGyroJerk-mean()-Y       |
| timeBodyGyroJerkStd-Y                                  | tBodyGyroJerk-std()-Y        |
| timeBodyAccMagStd                                      | tBodyAccMag-std()            |
| timeBodyAccJerkMagMean                                 | tBodyAccJerkMag-mean()       |
| timeBodyGyroMagStd                                     | tBodyGyroMag-std()           |
| freqBodyAccMean-X                                      | fBodyAcc-mean()-X            |
| freqBodyAccStd-X                                       | fBodyAcc-std()-X             |
| freqBodyAccJerkMean-X                                  | fBodyAccJerk-mean()-X        |
| freqBodyAccJerkStd-X                                   | fBodyAccJerk-std()-X         |
| freqBodyGyroMean-X                                     | fBodyGyro-mean()-X           |
| freqBodyGyroStd-X                                      | fBodyGyro-std()-X            |
| freqBodyAccMagMean                                     | fBodyAccMag-mean()           |
| freqBodyBodyAccJerkMagStd                              | fBodyBodyAccJerkMag-std()    |
| freqBodyBodyGyroJerkMagMean                            | fBodyBodyGyroJerkMag-mean()  |
| timeBodyAccMean-Z                                      | tBodyAcc-mean()-Z            |
| timeBodyAccStd-Z                                       | tBodyAcc-std()-Z             |
| timeGravityAccMean-Z                                   | tGravityAcc-mean()-Z         |
| timeGravityAccStd-Z                                    | tGravityAcc-std()-Z          |
| timeBodyAccJerkMean-Z                                  | tBodyAccJerk-mean()-Z        |
| timeBodyAccJerkStd-Z                                   | tBodyAccJerk-std()-Z         |
| timeBodyGyroMean-Z                                     | tBodyGyro-mean()-Z           |
| timeBodyGyroStd-Z                                      | tBodyGyro-std()-Z            |
| timeBodyGyroJerkMean-Z                                 | tBodyGyroJerk-mean()-Z       |
| timeBodyGyroJerkStd-Z                                  | tBodyGyroJerk-std()-Z        |
| timeGravityAccMagMean                                  | tGravityAccMag-mean()        |
| timeBodyAccJerkMagStd                                  | tBodyAccJerkMag-std()        |
| timeBodyGyroJerkMagMean                                | tBodyGyroJerkMag-mean()      |
| freqBodyAccMean-Y                                      | fBodyAcc-mean()-Y            |
| freqBodyAccStd-Y                                       | fBodyAcc-std()-Y             |
| freqBodyAccJerkMean-Y                                  | fBodyAccJerk-mean()-Y        |
| freqBodyAccJerkStd-Y                                   | fBodyAccJerk-std()-Y         |
| freqBodyGyroMean-Y                                     | fBodyGyro-mean()-Y           |
| freqBodyGyroStd-Y                                      | fBodyGyro-std()-Y            |
| freqBodyAccMagStd                                      | fBodyAccMag-std()            |
| freqBodyBodyGyroMagMean                                | fBodyBodyGyroMag-mean()      |
| freqBodyBodyGyroJerkMagStd                             | fBodyBodyGyroJerkMag-std()   |
| timeBodyAccStd-X                                       | tBodyAcc-std()-X             |
| timeGravityAccMean-X                                   | tGravityAcc-mean()-X         |
| timeGravityAccStd-X                                    | tGravityAcc-std()-X          |
| timeBodyAccJerkMean-X                                  | tBodyAccJerk-mean()-X        |
| timeBodyAccJerkStd-X                                   | tBodyAccJerk-std()-X         |
| timeBodyGyroMean-X                                     | tBodyGyro-mean()-X           |
| timeBodyGyroStd-X                                      | tBodyGyro-std()-X            |
| timeBodyGyroJerkMean-X                                 | tBodyGyroJerk-mean()-X       |
| timeBodyGyroJerkStd-X                                  | tBodyGyroJerk-std()-X        |
| timeBodyAccMagMean                                     | tBodyAccMag-mean()           |
| timeGravityAccMagStd                                   | tGravityAccMag-std()         |
| timeBodyGyroMagMean                                    | tBodyGyroMag-mean()          |
| timeBodyGyroJerkMagStd                                 | tBodyGyroJerkMag-std()       |
| freqBodyAccMean-Z                                      | fBodyAcc-mean()-Z            |
| freqBodyAccStd-Z                                       | fBodyAcc-std()-Z             |
| freqBodyAccJerkMean-Z                                  | fBodyAccJerk-mean()-Z        |
| freqBodyAccJerkStd-Z                                   | fBodyAccJerk-std()-Z         |
| freqBodyGyroMean-Z                                     | fBodyGyro-mean()-Z           |
| freqBodyGyroStd-Z                                      | fBodyGyro-std()-Z            |
| freqBodyBodyAccJerkMagMean                             | fBodyBodyAccJerkMag-mean()   |
| freqBodyBodyGyroMagStd                                 | fBodyBodyGyroMag-std()       |


## Source Data Non-Signal Variables
In processing the signal data for each observation, non-signal variables were also gathered: 

* subject  : a numeric identifier (from 1 to 30) which represents the person performing the movement. The subject data for each observation was read from the files *subject_test.txt* and *subject_train.txt*.

* activity : represented by a numeric identifier (we may call activityid), this denotes what type of movement is being performed by the subject for an observation. The list of distinct activities (activityid and activityname) are sourced from *activity_labels.txt* which has been read to indicate instead the activity labels. Activity data for observations was read from files *y_test.txt* and *y_train.txt*.

## Processing the Tidy Data
The processing to create tidy data is coded in the script *run_analysis.R* file. 
Referencing the non-signal variables (subject and activity), these where matched to corresponding row observations containing the signal variables. 
This process created a 68 variable data set (66 signal variables + subject + activity) both for training and testing data sets provided which were then merged into one dataset which we will refer in our code as the **signaldata** R object.

From **signaldata**, the next step was done to produce another data set which should be a tidy one.
Here, the average of each signal variable was to be computed per activity and subject involved. 
I chose to reshape the data by retaining the subject and activity fields, and capturing the signal variable names as the key and their values in another column. 

### Table 2. Sample Reshaped data from signaldata

| activity | subject | signalvariable | value |
|----------|---------|----------------|-------|

From this, I summarized the average value according to the grouping (activity, subject, signalvariable) and computed the averagevalue via the mean(value) aggregation. This is now assigned to the **average_signaldata** R object, and is written as an output file for the resulting tidy data set. 

### Table 3. Sample Reshaped data, with averages computed, assigned to **average_signaldata**

| activity | subject | signalvariable | averagevalue |
|----------|---------|----------------|--------------|

The tiny data has been chosen in this form and has not been recast / spread again so as to explicitly indicate that the average values has been computed for each of the signal variable per activity and subject.


## Tiny Data Variables
The following are the resulting variables of the tidy data set.

* subject        : the subject identifier who performed an observed activity
* activity       : the activity label indicated what type of activity has been made by the subject
* signalvariable : the signal variable name measured for the observation, the list of available values can be referenced from Table 1 (Column 1) above, as a result of the reshaping
* averagevalue   : the computed average value of a signal variable 



