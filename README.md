#Getting And Cleaning Data Project 
##Repository for the Human Activity Recognition using Smartphones Course Project

The goal of this project is to prepare tidy data that can be used for later analysis from the 
Human Activity Recognition database built from the recordings of 30 subjects performing activities of daily living
while carrying a waist-mounted smartphone with embedded inertial sensors.
The analysis.R results in a Tidy Data set,reduced  



A full description is available at  <http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones> 
The source data for this project was downloaded from <https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip>

This repository contains the following files:

**1) README.md ** :This file describing the contents of this repo 
                   and all the steps to recreate the results.
	
**2) CodeBook.md**:This file describes the variables,the data,and any transformations 
					or work performed with the run_analysis.R script to clean up the data 
	
**3) run_analysis.R **:The script that does the following:
					a)Merges the training and the test sets to create one data set.
					b)Extracts only the measurements on the mean and standard deviation for each measurement.
					c)Uses descriptive activity names to name the activities in the data set
					d)Appropriately labels the data set with descriptive activity names.
					e)Creates a second, independent tidy data set with the average of 
					  each variable for each activity and each subject.
				
##How to run the  run_analysis.R script :
*	To run this script has to be present in the folder /UCI HAR Dataset.
	The folder structure should be maintained as is after unzipping the original data,and the run_analysis.R file 
	should be copied into the /UCI HAR Dataset folder.
*	Set your working directory with setwd(~/getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset).
*	use source("run_analysis.R") command in RStudio.
*	Alternatively,open the file in RStudio and save it with the Source on Save box checked.
