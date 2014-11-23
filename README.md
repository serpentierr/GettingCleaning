Getting and Cleaning
====================

# run_analysis.R

This R script performs the following steps, as per the project assignment instructions:

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement. 
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive activity names. 
5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 

## how to download the original data

This script assumes that you have already downloaded and unzipped the original Samsung data in a folder called "UCI HAR Dataset", that resides on the path "U:/datasciencecoursera/GettingCleaning"

In your R enviroment (in the same folder where the data files are), load the script:

```
source('run_analysis.R')
```

The end result will be a file called "CleanData.txt" in the same folder.
