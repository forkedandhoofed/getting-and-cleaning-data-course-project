## Getting & Cleaning Data Course Project

This project takes the Human Activity Recognition Using Smartphone Dataset from UC Irvine Machine Learning Repository, and transform the raw data into a tidy, ready-for-analysis format. 

More information regarding the data collection exercise can be found at [here](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones).

The raw data used for the analysis can be found [here](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip). Before you begin, please ensure the data is downloaded, unzipped, and saved in a subfolder named "UCI HAR Dataset" located in your workspace.

Script `run_analysis.R` will carry out the data tidying process, by doing the following:

1. Load the test and training datasets;
2. Load subject, activity, and feature information for both datasets;
3. Bind the training and test datasets by row (thus lengthening the dataset without changing the width);
4. Combine the subject and activity labels for both datasets respectively;
5. Add the combined subject and activity as two new variables in the dataset;
6. Select all features of interests (mean and standard deviation of all measures);
7. Export the tidy data as `tidydata.txt`;
8. Create a second, independent tidy dataset with the average of each variable for each activity and each subject. The resulting variables names have the prefix "mean-";
9. Export the second tidy dataset as `meantidydata.txt`.