---
title: "Getting and Cleaning Data: Course Project"
output: html_document
author: "Dr. Miltiadis Sarakinos"
---


# Working Directory
I move to the "UCI HAR Dataset" and work from there. If you put my script there and
have preserved the directory structure of the zip file with the data, then it should
all work fine.

# Workflow
In this document I use __bold__ to denote R objects such as data frames, vectors, etc. and
_italic_ to denote text files and their paths. I use double quotes to denote variable names, for example "Subject".


## Importing the metadata
I import the following metadata into data frames:

* Feature names from _features.txt_ into data frame __features__: 
I create a vector __FeaturesMeanStd__ with only those features that will be extracted
according to step 2, namely only means and standard deviations.
* Activity names from _activity_labels.txt_:  
Here I create a factor __f.activities__ for the six activities.

## Reading the data
For the training dataset I proceed as follows:

* I read _X_Train.txt_ into data frame __X_Train__ and name the columns 
according __features__ (fulfills requirement 4: "Appropriately labels the data set with descriptive variable names") but then I only keep the features in __FeaturesMeanStd__ (fulfills requirement 2 "Extracts only the measurements on the mean and standard deviation for each measurement"): I end up fith 7,352 rows and 79 columns.
* I read _train/subject_train.txt_ into data frame __subject_train__. I end up with 7,352 and 1 column.
I read _train/y_train.txt_ into data frame __y_train__: 7,352 and 1 column. Since the
values in the column are the different acctivites, I apply factor __f.activities__ 
(using the levels function) in order to make the column content understandable (Step 3
"Uses descriptive activity names to name the activities in the data set")

I combine the three datasets __subject_train__, __y_train__, __X_Train__ using cbind to create 
data frame __Train__ with 7,352 rows, 81 columns. The leftmost columns are the "Subject"
and the "Activity". The remaining 79 are the measurements (means and standard deviations)

I proceed in an analogous matter and create data frame __Test__: 2,947 rows and 81 columns.

I append __Test__ to __Train__ using rbind to create data frame __MyDataset__ (fulfills requirement 1 "Merges the training and the test sets to create one data set.")

## Summarising the Data
I first melt __MyDataset__ into __melted__ using columns "Subject", "Activity" as id.
Then I use the ddply function to get the means for each "Subject", "Activity", "variable"
where "variable" is any of the features __FeaturesMeanStd__. The final data frame is
__MyDataset2__ which is then exported as a .csv.


