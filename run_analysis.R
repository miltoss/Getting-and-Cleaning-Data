
# Load some packages
library(reshape2)
library(plyr)
library(dplyr)


# Set the working directory
setwd("/Users/miltos/Documents/Coursera/JHDSS/3.GettingAndCleaningData/Project")
setwd("./UCI HAR Dataset")
getwd()


# Read the names of the features in a data frame
features <- read.table("./features.txt")
names(features) <- c("FeatureNumber","FeatureName")


# Get the features containing a mean or a standard deviation (std)
FeaturesMean <- grepl("-mean",features$FeatureName) 
FeaturesStd <- grepl("-std",features$FeatureName) 
FeaturesKeep <- FeaturesMean | FeaturesStd
FeaturesMeanStd<- as.vector(features$FeatureName[FeaturesKeep])


# Read the activity labels
activity_labels <- read.table("./activity_labels.txt")
names(activity_labels) <- c("ActivityNumber","ActivityName")

# Create a factor
f.activities <- factor(activity_labels$ActivityNumber, labels=activity_labels$ActivityName)


# Prepare the training dataset. Read the dataset, the subjets and 

## Read the training dataset
X_Train <- read.table("./train/X_Train.txt")
names(X_Train) <- features$FeatureName

## Keep only the features with mean and std
X_Train <- X_Train[,FeaturesMeanStd]

## Read the subjects in a data frame of one feature
subject_train <- read.table("./train/subject_train.txt")
names(subject_train) <- "Subject"

## Read the training labels in a data frame of one feature
y_train <- read.table("./train/y_train.txt")
names(y_train) <- "Activity"
y_train$Activity <- as.factor(y_train$Activity)
levels(y_train$Activity) <- levels(f.activities)


## Now put these together :
Train <- cbind(subject_train, y_train, X_Train)


# Repeat for the test set

## Read the test dataset
X_Test <- read.table("./test/X_Test.txt")
names(X_Test) <- features$FeatureName

## Keep only the features with mean and std
X_Test <- X_Test[,FeaturesMeanStd]


## Read the subjects in a data frame of one feature
subject_test <- read.table("./test/subject_test.txt")
names(subject_test) <- "Subject"


## Read the testing labels in a data frame of one feature
y_test <- read.table("./test/y_test.txt")
names(y_test) <- "Activity"
y_test$Activity <- as.factor(y_test$Activity)
levels(y_test$Activity) <- levels(f.activities)


## Now put these together:
Test <- cbind(subject_test, y_test, X_Test)

# Append test dataset to train dataset  
MyDataset <- rbind(Train,Test)

# Create the summary. First melt the dataset and then summurize the molten one.
melted <- melt(MyDataset, id=c("Subject","Activity"))
MyDataset2 <- ddply(melted,.(Subject, Activity, variable), summarize, MeanValue=mean(value))

write.table(MyDataset2, "./MyDataset2.csv", sep=',', row.names=FALSE)

