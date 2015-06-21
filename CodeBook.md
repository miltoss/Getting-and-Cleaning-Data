---
title: "CodeBook for Course Project: Getting and Cleaning Data"
author: Dr. Miltiadis Sarakinos
output: html_document
---

# Output (aggregated) Dataset 
The output dataset contains the following columns as given with the str function:

$ Subject  : int  1 1 1 1 1 1 1 1 1 1 ... (these are the subjects from 1 - 30. Subjects
are the persons performing the tests.)

$ Activity : Factor w/ 6 levels "WALKING","WALKING_UPSTAIRS",..: 1 1 1 1 1 1 1 1 1 1 ...
(these are the possible activities that each subject performed.)

$ variable : Factor w/ 79 levels "tBodyAcc-mean()-X",..: 1 2 3 4 5 6 7 8 9 10 ...
(these are the diffrent means or standard deviations of the different measurements
that will be averaged.)

$ MeanValue: num  0.2773 -0.0174 -0.1111 -0.2837 0.1145 ... (these are the mean values
of "variable" for each "Subject" and "Activity")

# Tidy Dataset used for extracting Output Dataset (before aggregation)

The first two volumns are:

$ Subject  : int  1 1 1 1 1 1 1 1 1 1 ... (these are the subjects from 1 - 30. Subjects
are the persons performing the tests.)

$ Activity : Factor w/ 6 levels "WALKING","WALKING_UPSTAIRS",..: 1 1 1 1 1 1 1 1 1 1 ...
(these are the possible activities that each subject performed.)

Then there are 79 numeric features with means and standard deviations of measuerements. The
contain the strings "-mean" and "-std" respectively. The different measurements are described
in the next section.

# Measurements

Here I am actually copying and refering to the code book _features_info.txt_. I am copying the
content below and denote what is not relevant for this assignement.

## From the old code book
The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

tBodyAcc-XYZ

tGravityAcc-XYZ

tBodyAccJerk-XYZ

tBodyGyro-XYZ

tBodyGyroJerk-XYZ

tBodyAccMag

tGravityAccMag

tBodyAccJerkMag

tBodyGyroMag

tBodyGyroJerkMag

fBodyAcc-XYZ

fBodyAccJerk-XYZ

fBodyGyro-XYZ

fBodyAccMag

fBodyAccJerkMag

fBodyGyroMag

fBodyGyroJerkMag

The set of variables that were estimated from these signals are: 

### Kept for this assignement 
mean(): Mean value

std(): Standard deviation

### Not kept for this assignement

mad(): Median absolute deviation 

max(): Largest value in array

min(): Smallest value in array

sma(): Signal magnitude area

energy(): Energy measure. Sum of the squares divided by the number of values. 

iqr(): Interquartile range 

entropy(): Signal entropy

arCoeff(): Autorregresion coefficients with Burg order equal to 4

correlation(): correlation coefficient between two signals

maxInds(): index of the frequency component with largest magnitude

meanFreq(): Weighted average of the frequency components to obtain a mean frequency

skewness(): skewness of the frequency domain signal 

kurtosis(): kurtosis of the frequency domain signal 

bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.

angle(): Angle between to vectors.

Additional vectors obtained by averaging the signals in a signal window sample. These are used 
on the angle() variable:

gravityMean

tBodyAccMean

tBodyAccJerkMean

tBodyGyroMean

tBodyGyroJerkMean




