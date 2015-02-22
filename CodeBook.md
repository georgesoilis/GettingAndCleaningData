##Code book for the run_analysis.R script  
- This Code Book describes the variables in the output data set ,
- The output dataset contains a total of 180 observations of 68 variables.
###Subject, Features ,Activity variables description
- This script first loads the data from the files,into temporary data frames.  
-Activities are divided into 6 categories :
"walking"",laying,sitting,,standing,walking_upstairs , "walking_downstairs"   
-Extracted only the mean and standard deviation for each measurement identified by the mean()and std() in the name,(excluding variables like meanFreq).
- After extracting only the measurements on the mean and standard deviation for each measurement the result is a 10299x66 data frame, because only 66 out of 561 attributes are measurements on the mean and standard deviation.(as deduced by their name and the original description of the data set)
- We applied the descriptive activity names to name the activities in the data set 
- Labeled the data set with descriptive names: all feature names (variables) are converted to lower case, underscores and brackets () are removed.
-Substituted "mean()" and "std()" with "Mean" and "Std"
-Abbreviations "f", "t", "Acc", and "Gyrr" are expanded to be self explanatory
examples of the new names for the variables :        
-timeBodyAccelerationMeanX        
-timeBodyAccelerationMeanY  
-timeBodyAccelerationMeanZ   	    
-timeBodyAccelerationStdX	      
-timeBodyAccelerationStdY	    
-timeBodyAccelerationStdZ	        
-timeGravityAccelerationMeanX	     
-timeGravityAccelerationMeanY      
-timeGravityAccelerationMeanZ     
-timeGravityAccelerationStdX	   
-timeGravityAccelerationStdY	    
-timeGravityAccelerationStdZ    	    
-timeBodyAccelerationJerkMeanX	     
-timeBodyAccelerationJerkMeanY     
-timeBodyAccelerationJerkMeanZ     	  
-timeBodyAccelerationJerkStdX	     
-timeBodyAccelerationJerkStdY	    
-timeBodyAccelerationJerkStdZ          
-timeBodyGyroscopeMeanX	             
-timeBodyGyroscopeMeanY	        
-timeBodyGyroscopeMeanZ    	    
-timeBodyGyroscopeStdX	      
-timeBodyGyroscopeStdY	    
-timeBodyGyroscopeStdZ    	    
-timeBodyGyroscopeJerkMeanX	    
-timeBodyGyroscopeJerkMeanY	    
-timeBodyGyroscopeJerkMeanZ	    
-timeBodyGyroscopeJerkStdX	    
-timeBodyGyroscopeJerkStdY	   
-timeBodyGyroscopeJerkStdZ	  
-Please note that the script only selects those variables whose names contain either "mean()" or "std()". This excludes variables like "meanFreq()", which contains the "weighted average of the frequency components to obtain a mean frequency".
- Merged the 10299x66 data frame containing features with the two 10299x1 data frames containing activity labels and subject IDs. (Added the activities and subjects to the features, for the complete block)
- The result is a 10299x68 data frame with the first column subject IDs,
 the second column activity names, and the 66 columns the measurements.
- Subject IDs are integers between 1 and 30 inclusive.
- This 2nd, independent tidy data set with the average of each measurement for each activity and each subject. 
- Saved as "tidyData.txt",containing subject IDs,activity names,and the averages for each 
 of the 66 out of the 561 measurements (thus making a size 180x68 data frame)
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