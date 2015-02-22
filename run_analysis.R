# This R script created for use on the dataset UCI HAR Dataset 
# downloaded from the Getting and Cleaning Data course link:
# https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
#-------------------------------------------------------------------------
# Download the UCI HAR dataset file .
# Unzip the downloaded file with the UCI HAR Dataset(keep folder structure intact)
# Open RStudio and navigate to this folder.
# Set as working directory the "getdata-projectfiles-UCI HAR Dataset" folder
# (Set As Working Directory option from the  RStudio file explorer "More" menu)
# Open the scipt in Rstudio ,check the "Source on Save" box on the editor toolbar 
# and click the icon to save.The script will run ,and alert the user when finished
# printing the message "Script finished, tidyData.txt  file produced in working directory."
# After finishing ,the output opens with View().If you want this behaviour stopped,
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

# merge the training and the test sets to create one set with all measurements
# one with all the corresponding subject IDs and one with all the activities performed 
subjectdt <- rbind (trainsubjectdt, testsubjectdt) #10299 obs of   1 variable (subjects)
featuredatadt <- rbind (trainxdt, testxdt)         #10299 obs of 561 variables(measurements)
activitydt <- rbind (trainydt, testydt)            #10299 obs of   1 variable (activities)

# free memory,remove the no longer needed data tables.(Comment out if you want to preserve)
rm (trainsubjectdt, trainxdt, trainydt, testsubjectdt, testxdt, testydt)

# read in the names of the features(variables) 
varnamesdt <-read.table ( "UCI HAR Dataset/features.txt", sep = " ")

# Extract and transform the names of the features
featurenames <- as.character (varnamesdt[,2])
names(featuredatadt) <- featurenames #insert the variable names to the data
names(subjectdt) <- c("Subject") 
names(activitydt) <- c("Activity")

# Extract only the mean and standard deviation measurements
# identified by the mean()and std() in the name, excluding variables like meanFreq 
selectedfeaturedt <- featuredatadt[, grep("mean\\()|std\\()", featurenames)]

# Rename the selected variables, using descriptive variable names
# substitute "mean()" and "std()" with "Mean" and "Std"
names(selectedfeaturedt) <- gsub("mean\\()", "Mean", names(selectedfeaturedt))
names(selectedfeaturedt) <- gsub("std\\()", "Std", names(selectedfeaturedt))

# remove all "-"
names(selectedfeaturedt) <- gsub("-", "", names(selectedfeaturedt))

# For making meaningful names ,abbreviations "f", "t", "Acc", and "Gyrr" are expanded 
names(selectedfeaturedt) <- gsub("^f", "frequency", names(selectedfeaturedt))
names(selectedfeaturedt) <- gsub("^t", "time", names(selectedfeaturedt))
names(selectedfeaturedt) <- gsub("Acc", "Acceleration", names(selectedfeaturedt))
names(selectedfeaturedt) <- gsub("Gyro", "Gyroscope", names(selectedfeaturedt))
names(selectedfeaturedt) <- gsub("BodyBody", "Body", names(selectedfeaturedt))

# add the activities and subjects to the features, for the complete block
selectedfeaturedt <- cbind(selectedfeaturedt, subjectdt, activitydt)

# free memory.Comment out if you want to preserve them
rm (featuredatadt, subjectdt, activitydt)

# Use descriptive activity names to name the activities in the data set
# read the labels from file
actlabels <- read.table ("UCI HAR Dataset/activity_labels.txt", header = FALSE, stringsAsFactors = FALSE)

# apply the labels to the data and change them to lower case.
selectedfeaturedt$Activity <- factor(selectedfeaturedt$Activity, levels = actlabels[,1], labels =tolower(actlabels$V2))

# Create a tidy data set with the average of each variable for each activity and each subject
# melt ,with the variables for Mean and Std
measures <- grep ("Mean|Std", names (selectedfeaturedt), value = TRUE)
moltendt <- melt(selectedfeaturedt, id.vars = c("Subject", "Activity"), measure.vars = measures)

# then cast the the data to the final wide form  
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

