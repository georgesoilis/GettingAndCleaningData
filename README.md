---
output: html_document
---
##Getting And Cleaning Data Project 
###Repository for the Human Activity Recognition using Smartphones Course Project
This R script created for use on the dataset UCI HAR Dataset 
Creates an output of a file containing the averages of each variable for
each activity and each subject.
The Human Activity Recognition database was built from the recordings of 30 subjects performing activities of daily living while carrying a waist-mounted smartphone with embedded inertial sensors.
A full description of the original data is available at  <http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones> 
The source data for this project was downloaded from <https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip> .

###This repository contains the following files:

1. README.md   :This file describing the contents of this repo and how the script works
2. CodeBook.md  :This file describes the variables,the data,and the transformations performed 
3. run_analysis.R :The script that does the following:   
      
* Reads in the files      
* Merges the training and the test sets to create one data set.   
* Extracts only the measurements on the mean and standard deviation for each measurement.   
* Uses descriptive activity names to name the activities in the data set   
* Appropriately labels the data set with descriptive activity names.  
* Creates a second, independent tidy data set with the average of each variable for each activity and each subject.    

###How to run the  run_analysis.R script :  

**short version for use with RStudio (included in script):**  
* Download the data set from <https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip> and unzip it.It will create a series of folder/files as follows: getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/...
* Unzip the downloaded file with the UCI HAR Dataset(keep folder structure intact)  
* Open RStudio and navigate to the "getdata-projectfiles-UCI HAR Dataset"" folder with the RStudio file explorer.  
* Set as working directory this folder("Set As Working Directory" option from the RStudio file explorer "More" menu,or with the setwd() in R prompt.  
* Download,save and open the script in Rstudio ,check the "Source on Save"" box on the editor toolbar and click the icon Save.The script will start running,and alert the user when finished printing the message "Script finished, tidyData.txt  file produced in working directory."
* Alternatively ,type > source(run_analysis.R)
* After finishing ,the output opens with View().If you want this behaviour stopped,please comment out the last 2 lines.

** Detailed instructions for R (and RStudio)**  
*	Save this script file(run_analysis.r) in the top folder of those created during unzipping, 
namely the folder:"getdata-projectfiles-UCI HAR Dataset". To run ,this script has to be in the folder "getdata-projectfiles-UCI HAR Dataset".(Please keep directory structure as is after unzipping.)  
(As a pointer,in this folder you will see only one folder,"UCI HAR Dataset" and no files)
*	Set your working directory the folder:"getdata-projectfiles-UCI HAR Dataset" with for example: 
```setwd("~/Coursera/Getting and cleaning data/getdata-projectfiles-UCI HAR Dataset")``` if for example the downloaded file was unzipped in C:/My Documents/Coursera/Getting and Cleaning data/
and your home directory (in RStudio) is My Documents).
*	Type in the prompt  ```source("run_analysis.R")``` .
(Alternatively,open the file in RStudio and click on save with the "Source on Save"" box checked).
* After running,the script will produce a file "tidyData.txt"" in the "getdata-projectfiles-UCI HAR Dataset" directory.
* The script then reads the output file "tidyData.txt" into RStudio and opens it for viewing.This behaviour can be changed by commenting out the last 2 lines of the script (if the user doesnt want to view the output or prefers to read it in him/herself.In this case,please use )
``` 
temp<-read.table("tidyData.txt" ,header=TRUE)
```
and then :
```
View(temp)
```   
note:Every effort has been made to clean up during and after running to preserve memory by default,so if the user wants to see the steps of the transormartion and not only the end result can comment out these lines,: 42,70,90,91 where the calls for the function rm() reside.

George Soilis,February,2015
