# Getting-and-cleaning-data-assignment

This project focuses on data collected from he accelerometer and gyroscope of the Samsung Galaxy S smartphone. Based on the information from the owner of Data Set (http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones) an experiment has been carried out with a group of 30 volunteers with and age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.

The aim of this assignment is to understand the data set by first retriving the dataset from the website, cleaning the data and merging in order to produce a tidy data set that can be used for further analysis.

The repository called "getting-and-cleaning data-assignment" contains the following files:-
- README.md - provides details about the data set and the project
- secTidySet.txt - contains the data set
- codeBook.md - which describes the contents of the data set
- analysis.R - which is an R script that shows the details on generating the tidy data set

In the process of creating the data set as shown in analisi.R file the following steps has been followed based on the project learning objectives.

- Merges the training and the test sets to create one data set.
- Extracts only the measurements on the mean and standard deviation for each measurement.
- Uses descriptive activity names to name the activities in the data set
- Appropriately labels the data set with descriptive variable names.
- From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.