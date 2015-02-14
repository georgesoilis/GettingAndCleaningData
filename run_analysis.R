# This R script created for use on the dataset UCI HAR Dataset 
# Creates an output of a file containing the averages of each variable for
# each activity and each subject

# This file must be saved in the top directory of the unzipped data file ,
# downloaded from the Getting and Cleaning Data course link:
# https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
# Please keep directory structure as is after unzipping,
# adding this file in the folder named "UCI HAR Dataset".
# there are already 4 files in this folder,namely 
# 1. 'README.txt'
# 2. 'features_info.txt'
# 3. 'activity_labels.txt'
# 4. 'features.txt'
# Make sure you add this file in this folder
# To use it type in the command line >source("run_analysis.R") 


# 1. Merge the training and the test sets to create one data set.

xtrain <- read.table("train/X_train.txt")
xtest <- read.table("test/X_test.txt")
X <- rbind(xtrain,xtest)

# NB:For memory economy we reuse the same temporary storage (xtrain,xtest)

xtrain <- read.table("train/subject_train.txt")
xtest <- read.table("test/subject_test.txt")
S <- rbind(xtrain,xtest)

xtrain <- read.table("train/y_train.txt")
xtest <- read.table("test/y_test.txt")
Y <- rbind(xtrain,xtest)

# 2. Extract the mean and standard deviation for each measurement.

features <- read.table("features.txt")
featuresindex <- grep("-mean\\(\\)|-std\\(\\)", features[, 2])
X <- X[, featuresindex]
names(X) <- features[featuresindex, 2]
names(X) <- gsub("\\(|\\)", "", names(X))
names(X) <- tolower(names(X))

# 3. Use descriptive activity names to name the activities in the data set

activities <- read.table("activity_labels.txt")
activities[, 2] = gsub("_", "", tolower(as.character(activities[, 2])))
Y[,1] = activities[Y[,1], 2]
names(Y) <- "activity"

# 4. Appropriately label the data set with descriptive activity names.

names(S) <- "subject"
tidydata <- cbind(S, Y, X)

# 5. From the data set in step 4, creates a second , independent 
#    tidy data set with the average of each variable for each activity and each subject.

uniqueSubjects = unique(S)[,1]
numSubjects = length(unique(S)[,1])
numActivities = length(activities[,1])
numCols = dim(tidydata)[2]
result = tidydata[1:(numSubjects*numActivities), ]#getting the average 

nrow = 1
for (count in 1:numSubjects) {  #30 subjects 
    for (a in 1:numActivities) {       #6 activities 
        result[nrow, 1] = uniqueSubjects[count]  
        result[nrow, 2] = activities[a, 2]
        tmp <- tidydata[tidydata$subject==count & tidydata$activity==activities[a, 2], ]
        result[nrow, 3:numCols] <- colMeans(tmp[, 3:numCols])
        nrow = nrow+1 
    }
}
write.table(result, "TidySet.txt", row.name=FALSE) 

