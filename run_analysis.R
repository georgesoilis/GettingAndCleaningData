# This R script created for use on the dataset UCI HAR Dataset 
# Creates an output of a file containing the averages of each variable for
# each activity and each subject
#-------------------------------------------------------------------------
# This file must be saved in the top directory of the unzipped data file ,
# downloaded from the Getting and Cleaning Data course link:
# https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
#-------------------------------------------------------------------------
# Download and unzip this file .Please keep directory structure as is after unzipping.
# Save this script file(run_analysis.r) in the top folder of those created during unzipping, 
# namely the folder:"getdata-projectfiles-UCI HAR Dataset".
# (As a pointer,in this folder you will see another folder,"UCI HAR Dataset")
# Set as your working directory the folder:"getdata-projectfiles-UCI HAR Dataset".
# example >  setwd("~/Coursera/Getting and cleaning data/getdata-projectfiles-UCI HAR Dataset")
# if the downloaded file was unzipped in C:/My Documents/Coursera/Getting and Cleaning data/
# and your home directory (in RStudio) is My Documents)
# To use it type in the prompt  >source("run_analysis.R") or
# In RStudio,check Source on Save and click on save --after-- setting the working directory
# as per the instructions above and in the Readme.md that accompanies this script
# After finishing the output opens with View() automatically.If you want this behaviour stopped,
# please comment out the last 2 lines.
require("data.table")
require("reshape2")

# read the data from the archives
trainsubjectdt <- read.table ("UCI HAR Dataset/train/subject_train.txt")
trainxdt <- read.table ( "UCI HAR Dataset/train/X_train.txt", header = FALSE)
trainydt <- read.table ( "UCI HAR Dataset/train/y_train.txt", header = FALSE)

testsubjectdt <- read.table ( "UCI HAR Dataset/test/subject_test.txt", header = FALSE)
testxdt <- read.table ("UCI HAR Dataset/test/X_test.txt", header = FALSE)
testydt <- read.table ("UCI HAR Dataset/test/y_test.txt", header = FALSE)

# merge the training and the test sets to create one data set
# we don't build the complete set here,since the variable names will change
subjectdt <- rbind (trainsubjectdt, testsubjectdt)
featuredatadt <- rbind (trainxdt, testxdt)
activitydt <- rbind (trainydt, testydt)

# free memory,remove no longer needed data tables.Comment out if you want to preserve them
rm (trainsubjectdt, trainxdt, trainydt, testsubjectdt, testxdt, testydt)

# read the names of the features
varnamesdt <-read.table ( "UCI HAR Dataset/features.txt", sep = " ")

# the second column contains the feature names
featurenames <- as.character (varnamesdt[,2])
names(featuredatadt) <- featurenames #insert the feature names to the data frame
names(subjectdt) <- c("Subject")
names(activitydt) <- c("Activity")

# Extract only the mean and standard deviation for each measurement
# identified by the mean()and std() in the name, thus excluding variables like meanFreq 
selectedfeaturedt <- featuredatadt[, grep("mean\\()|std\\()", featurenames)]

# Rename the variables, use descriptive variable names
# substitute "mean()" and "std()" with "Mean" and "Std"
names(selectedfeaturedt) <- gsub("mean\\()", "Mean", names(selectedfeaturedt))
names(selectedfeaturedt) <- gsub("std\\()", "Std", names(selectedfeaturedt))
names(selectedfeaturedt) <- gsub("-", "", names(selectedfeaturedt))# remove all "-"
# For making meaningful names ,abbreviations "f", "t", "Acc", and "Gyrr" are expanded 
names(selectedfeaturedt) <- gsub("^f", "frequency", names(selectedfeaturedt))
names(selectedfeaturedt) <- gsub("^t", "time", names(selectedfeaturedt))
names(selectedfeaturedt) <- gsub("Acc", "Acceleration", names(selectedfeaturedt))
names(selectedfeaturedt) <- gsub("Gyro", "Gyroscope", names(selectedfeaturedt))
names(selectedfeaturedt) <- gsub("BodyBody", "Body", names(selectedfeaturedt))

# add the activities and subjects to the features, for the complete block
selectedfeaturedt <- cbind(selectedfeaturedt, subjectdt, activitydt)

rm (featuredatadt, subjectdt, activitydt)# free memory.Comment out if you want to preserve them

# Use descriptive activity names to name the activities in the data set
# read the labels from file
actlabels <- read.table ("UCI HAR Dataset/activity_labels.txt", header = FALSE, stringsAsFactors = FALSE)
# apply the labels to the data
selectedfeaturedt$Activity <- factor(selectedfeaturedt$Activity, levels = actlabels[,1], labels = actlabels[,2])

# Create a tidy data set with the average of each variable for each activity and each subject
# melt ,with the variables for Mean and Std
measures <- grep ("Mean|Std", names (selectedfeaturedt), value = TRUE)
moltendt <- melt(selectedfeaturedt, id.vars = c("Subject", "Activity"), measure.vars = measures)

# then cast the the data to the final form
tidydt <- dcast(moltendt, Subject + Activity ~ variable, mean)

# Write the data to a txt file
write.table (tidydt, file = "tidyData.txt", row.names = FALSE)
message("Script finished, tidyData.txt  file produced in working directory.")
# clean up .comment out if you want to preserve the temporary files for inspection
rm(actlabels, moltendt, selectedfeaturedt, tidydt)
rm(featurenames, measures,varnamesdt)
#read and open output for viewing Please comment out the 2 lines below to stop autoviewing
temp<-read.table("tidyData.txt",header=T)
View(temp)
