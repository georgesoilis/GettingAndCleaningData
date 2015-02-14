##Code book for the run_analysis.R script  
- This Code Book describes the variables, the data, and any transformations or work performed to clean up the data
- Instructions for the use of the script run_analysis.R are given in the [README.MD file]( https://github.com/georgesoilis/GettingAndCleaningData/blob/master/README.md) of this project.
 - This file must be saved in the top directory of the unzipped data file ,
 downloaded from the Getting and Cleaning Data course link:
 <https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip>
 * Please keep directory structure as is after unzipping,
 adding this file in the folder named "UCI HAR Dataset".
- There are already files in this folder,namely :
  1. 'README.txt'(the original description of the data set)
  2. 'features_info.txt'(Description of features and variables)
  3. 'activity_labels.txt'(List of the activities subjects exectuted during a day)
  4. 'features.txt' (The complete list of variables of each feature vector)
- Copy here the script file (run_analysis.R)
 To use it type in the command line >source("run_analysis.R")
###Script description 
- This script first loads the data from the files,into temporary data frames,and joins them with rbind())
 creating a 10299x561 data frame, as in the original description("Number of Instances: 10299" and "Number of Attributes: 561"),
 a 10299x1 data frame with subject IDs, and a 10299x1 data frame with activity IDs. 
- Extracts only the measurements on the mean and standard deviation for each measurement. 
- The result is a 10299x66 data frame, because only 66 out of 561 attributes are measurements on the mean and standard deviation.
- Applies descriptive activity names to name the activities in the data set 
- Labels the data set with descriptive names: all feature names (attributes) and activity names are converted to lower case,
 underscores and brackets () are removed.
- Merges the 10299x66 data frame containing features with the two 10299x1 data frames containing activity labels and subject IDs.
- The result is a 10299x68 data frame with the first column subject IDs,
 the second column activity names, and the last 66 columns the measurements.
- Subject IDs are integers between 1 and 30 inclusive.
- The features are named similarly to the original naming,
 here are some examples .taken from the top of the data
- tbodyacc-mean-x (time domain signals (prefix 't' to denote time))
- tbodyacc-mean-y 
- tbodyacc-mean-z 
- tbodyacc-std-x 
- tbodyacc-std-y 
- tbodyacc-std-z 
- tgravityacc-mean-x 
- tgravityacc-mean-y
- tgravityacc-mean-z
- tbodyaccjerk-mean-x
- tbodyaccjerk-mean-y.............

- Creates a 2nd, independent tidy data set with the average of each measurement for each activity and each subject. 
- Finally the result is saved as "TidySet.txt",containing subject IDs,activity names,and the averages for each 
 of the 66 attributes (thus making a size 180x68 data frame)
- There are 30 subjects and 6 activities, thus 180 rows in this data set with averages.
 
###Notes: 
- Features are normalized and bounded within [-1,1].
- Each feature vector is a row on the text file.

For more information about this dataset contact: activityrecognition@smartlab.ws

###License:
Use of this dataset in publications must be acknowledged by referencing the following publication [1] 

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

This dataset is distributed AS-IS and no responsibility implied or explicit can be addressed to the authors or their institutions for its use or misuse. Any commercial use is prohibited.

Jorge L. Reyes-Ortiz, Alessandro Ghio, Luca Oneto, Davide Anguita. November 2012.

Script run_analysis.r ,codebook.md(this file),and readme.md in this project by George Soilis,February,2015 