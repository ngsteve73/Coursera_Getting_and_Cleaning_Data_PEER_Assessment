CodeBook for the tidy dataset
=============================

Data Source
-----------

This dataset is derived from the "Human Activity Recognition Using Smartphones Data Set" which was originally made avaiable here: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Feature Selection 
-----------------

I refer you to the README and features.txt files in the original dataset to learn more about the feature selection for this dataset. And there you will find the follow description:

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

The reasoning behind my selection of features is that the assignment explicitly states "Extracts only the measurements on the mean and standard deviation for each measurement."
To be complete, I included all variables having to do with mean or standard deviation.

In short, for this derived dataset, these signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

* tBodyAcc-XYZ
* tGravityAcc-XYZ
* tBodyAccJerk-XYZ
* tBodyGyro-XYZ
* tBodyGyroJerk-XYZ
* tBodyAccMag
* tGravityAccMag
* tBodyAccJerkMag
* tBodyGyroMag
* tBodyGyroJerkMag
* fBodyAcc-XYZ
* fBodyAccJerk-XYZ
* fBodyGyro-XYZ
* fBodyAccMag
* fBodyAccJerkMag
* fBodyGyroMag
* fBodyGyroJerkMag

The set of variables that were estimated (and kept for this assignment) from these signals are: 

* mean(): Mean value
* std(): Standard deviation

Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:

* gravityMean
* tBodyAccMean
* tBodyAccJerkMean
* tBodyGyroMean
* tBodyGyroJerkMean

Other estimates have been removed for the purpose of this excercise.

Note: features are normalized and bounded within [-1,1].

The resulting variable names are of the following form: tbodyaccmeanx, which means the mean value of tBodyAcc-XYZ.

Data Transformation 
-------------------

The raw data set are processed with run_analysis.R script to create a tidy data set.

**1. Merges the training and the test sets to create one data set.**

Test and training data (X_train.txt, X_test.txt), subject ids (subject_train.txt, subject_test.txt) and activity ids (y_train.txt,
y_test.txt) are merged to obtain a single data set. Variables are labelled with the names assigned by original collectors
(features.txt).

**2. Extracts only the measurements on the mean and standard deviation for each measurement.**

From the merged data set is extracted and intermediate data set with only the values of estimated mean (variables with
labels that contain "mean()") and standard deviation (variables with labels that contain "std()").

**3. Uses descriptive activity names to name the activities in the data set**

A new column is added to intermediate data set with the activity description. Activity id column is used to look up
descriptions in activity_labels.txt.

**4. Appropriately labels the data set with descriptive variable names.**

Labels given from the original collectors were changed: to obtain valid R names without parentheses, dashes and
commas to obtain more descriptive labels

**5. Creates a tidy data set with the average of each variable for each activity and each subject.**

From the intermediate data set is created a final tidy data set where numeric variables are averaged for each activity and
each subject.
The tidy data set contains 180 rows and 68 columns divided in:
an activity label (Activity): WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING
an identifier of the subject who carried out the experiment (Subject): 1 to 30
a 66 feature vector with time and frequency domain signal variables (numeric)

The data set is written to the file tidy_dataset.txt

Variables In Tidy Data Set 
--------------------------

| No. | OLD NAME                             | NEW NAME                                                         | DESCRIPTION |
|:----|:-------------------------------------|:-----------------------------------------------------------------|:-------------|
| 1   | Activity                             | Activity                                                         |  the activity performed by the person. WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING  |
| 2   | SubjectID                            | SubjectID                                                        |  the subject ID of the person performing the task: 1 to 30  |
| 3   | tBodyAcc-mean()-X                    | TimeDomainBodyAccelerationMeanX                                  | The mean of the  body acceleration  along the X-axis in the time domain  |
| 4   | tBodyAcc-mean()-Y                    | TimeDomainBodyAccelerationMeanY                                  | The mean of the  body acceleration  along the Y-axis in the time domain  |
| 5   | tBodyAcc-mean()-Z                    | TimeDomainBodyAccelerationMeanZ                                  | The mean of the  body acceleration  along the Z-axis in the time domain  |
| 6   | tBodyAcc-std()-X                     | TimeDomainBodyAccelerationStandardDeviationX                     | The standard deviation of the  body acceleration  along the X-axis in the time domain  |
| 7   | tBodyAcc-std()-Y                     | TimeDomainBodyAccelerationStandardDeviationY                     | The standard deviation of the  body acceleration  along the Y-axis in the time domain  |
| 8   | tBodyAcc-std()-Z                     | TimeDomainBodyAccelerationStandardDeviationZ                     | The standard deviation of the  body acceleration  along the Z-axis in the time domain  |
| 9   | tGravityAcc-mean()-X                 | TimeDomainGravityAccelerationMeanX                               | The mean of the  gravity acceleration  along the X-axis in the time domain  |
| 10  | tGravityAcc-mean()-Y                 | TimeDomainGravityAccelerationMeanY                               | The mean of the  gravity acceleration  along the Y-axis in the time domain  |
| 11  | tGravityAcc-mean()-Z                 | TimeDomainGravityAccelerationMeanZ                               | The mean of the  gravity acceleration  along the Z-axis in the time domain  |
| 12  | tGravityAcc-std()-X                  | TimeDomainGravityAccelerationStandardDeviationX                  | The standard deviation of the  gravity acceleration  along the X-axis in the time domain  |
| 13  | tGravityAcc-std()-Y                  | TimeDomainGravityAccelerationStandardDeviationY                  | The standard deviation of the  gravity acceleration  along the Y-axis in the time domain  |
| 14  | tGravityAcc-std()-Z                  | TimeDomainGravityAccelerationStandardDeviationZ                  | The standard deviation of the  gravity acceleration  along the Z-axis in the time domain  |
| 15  | tBodyAccJerk-mean()-X                | TimeDomainBodyAccelerationJerkMeanX                              | The mean of the  body acceleration jerk  along the X-axis in the time domain  |
| 16  | tBodyAccJerk-mean()-Y                | TimeDomainBodyAccelerationJerkMeanY                              | The mean of the  body acceleration jerk  along the Y-axis in the time domain  |
| 17  | tBodyAccJerk-mean()-Z                | TimeDomainBodyAccelerationJerkMeanZ                              | The mean of the  body acceleration jerk  along the Z-axis in the time domain  |
| 18  | tBodyAccJerk-std()-X                 | TimeDomainBodyAccelerationJerkStandardDeviationX                 | The standard deviation of the  body acceleration jerk  along the X-axis in the time domain  |
| 19  | tBodyAccJerk-std()-Y                 | TimeDomainBodyAccelerationJerkStandardDeviationY                 | The standard deviation of the  body acceleration jerk  along the Y-axis in the time domain  |
| 20  | tBodyAccJerk-std()-Z                 | TimeDomainBodyAccelerationJerkStandardDeviationZ                 | The standard deviation of the  body acceleration jerk  along the Z-axis in the time domain  |
| 21  | tBodyGyro-mean()-X                   | TimeDomainBodyAngularSpeedMeanX                                  | The mean of the  body angular speed  along the X-axis in the time domain  |
| 22  | tBodyGyro-mean()-Y                   | TimeDomainBodyAngularSpeedMeanY                                  | The mean of the  body angular speed  along the Y-axis in the time domain  |
| 23  | tBodyGyro-mean()-Z                   | TimeDomainBodyAngularSpeedMeanZ                                  | The mean of the  body angular speed  along the Z-axis in the time domain  |
| 24  | tBodyGyro-std()-X                    | TimeDomainBodyAngularSpeedStandardDeviationX                     | The standard deviation of the  body angular speed  along the X-axis in the time domain  |
| 25  | tBodyGyro-std()-Y                    | TimeDomainBodyAngularSpeedStandardDeviationY                     | The standard deviation of the  body angular speed  along the Y-axis in the time domain  |
| 26  | tBodyGyro-std()-Z                    | TimeDomainBodyAngularSpeedStandardDeviationZ                     | The standard deviation of the  body angular speed  along the Z-axis in the time domain  |
| 27  | tBodyGyroJerk-mean()-X               | TimeDomainBodyAngularAccelerationMeanX                           | The mean of the  body angular acceleration  along the X-axis in the time domain  |
| 28  | tBodyGyroJerk-mean()-Y               | TimeDomainBodyAngularAccelerationMeanY                           | The mean of the  body angular acceleration  along the Y-axis in the time domain  |
| 29  | tBodyGyroJerk-mean()-Z               | TimeDomainBodyAngularAccelerationMeanZ                           | The mean of the  body angular acceleration  along the Z-axis in the time domain  |
| 30  | tBodyGyroJerk-std()-X                | TimeDomainBodyAngularAccelerationStandardDeviationX              | The standard deviation of the  body angular acceleration  along the X-axis in the time domain  |
| 31  | tBodyGyroJerk-std()-Y                | TimeDomainBodyAngularAccelerationStandardDeviationY              | The standard deviation of the  body angular acceleration  along the Y-axis in the time domain  |
| 32  | tBodyGyroJerk-std()-Z                | TimeDomainBodyAngularAccelerationStandardDeviationZ              | The standard deviation of the  body angular acceleration  along the Z-axis in the time domain  |
| 33  | tBodyAccMag-mean()                   | TimeDomainBodyAccelerationMagnitudeMean                          | The mean of the  body acceleration magnitude  in the time domain  |
| 34  | tBodyAccMag-std()                    | TimeDomainBodyAccelerationMagnitudeStandardDeviation             | The standard deviation of the  body acceleration magnitude  in the time domain  |
| 35  | tGravityAccMag-mean()                | TimeDomainGravityAccelerationMagnitudeMean                       | The mean of the  gravity acceleration magnitude  in the time domain  |
| 36  | tGravityAccMag-std()                 | TimeDomainGravityAccelerationMagnitudeStandardDeviation          | The standard deviation of the  gravity acceleration magnitude  in the time domain  |
| 37  | tBodyAccJerkMag-mean()               | TimeDomainBodyAccelerationJerkMagnitudeMean                      | The mean of the  body acceleration jerk magnitude  in the time domain  |
| 38  | tBodyAccJerkMag-std()                | TimeDomainBodyAccelerationJerkMagnitudeStandardDeviation         | The standard deviation of the  body acceleration jerk magnitude  in the time domain  |
| 39  | tBodyGyroMag-mean()                  | TimeDomainBodyAngularSpeedMagnitudeMean                          | The mean of the  body angular speed magnitude  in the time domain  |
| 40  | tBodyGyroMag-std()                   | TimeDomainBodyAngularSpeedMagnitudeStandardDeviation             | The standard deviation of the  body angular speed magnitude  in the time domain  |
| 41  | tBodyGyroJerkMag-mean()              | TimeDomainBodyAngularAccelerationMagnitudeMean                   | The mean of the  body angular acceleration magnitude  in the time domain  |
| 42  | tBodyGyroJerkMag-std()               | TimeDomainBodyAngularAccelerationMagnitudeStandardDeviation      | The standard deviation of the  body angular acceleration magnitude  in the time domain  |
| 43  | fBodyAcc-mean()-X                    | FrequencyDomainBodyAccelerationMeanX                             | The mean of the  body acceleration  along the X-axis in the frequency domain  |
| 44  | fBodyAcc-mean()-Y                    | FrequencyDomainBodyAccelerationMeanY                             | The mean of the  body acceleration  along the Y-axis in the frequency domain  |
| 45  | fBodyAcc-mean()-Z                    | FrequencyDomainBodyAccelerationMeanZ                             | The mean of the  body acceleration  along the Z-axis in the frequency domain  |
| 46  | fBodyAcc-std()-X                     | FrequencyDomainBodyAccelerationStandardDeviationX                | The standard deviation of the  body acceleration  along the X-axis in the frequency domain  |
| 47  | fBodyAcc-std()-Y                     | FrequencyDomainBodyAccelerationStandardDeviationY                | The standard deviation of the  body acceleration  along the Y-axis in the frequency domain  |
| 48  | fBodyAcc-std()-Z                     | FrequencyDomainBodyAccelerationStandardDeviationZ                | The standard deviation of the  body acceleration  along the Z-axis in the frequency domain  |
| 49  | fBodyAccJerk-mean()-X                | FrequencyDomainBodyAccelerationJerkMeanX                         | The mean of the  body acceleration jerk  along the X-axis in the frequency domain  |
| 50  | fBodyAccJerk-mean()-Y                | FrequencyDomainBodyAccelerationJerkMeanY                         | The mean of the  body acceleration jerk  along the Y-axis in the frequency domain  |
| 51  | fBodyAccJerk-mean()-Z                | FrequencyDomainBodyAccelerationJerkMeanZ                         | The mean of the  body acceleration jerk  along the Z-axis in the frequency domain  |
| 52  | fBodyAccJerk-std()-X                 | FrequencyDomainBodyAccelerationJerkStandardDeviationX            | The standard deviation of the  body acceleration jerk  along the X-axis in the frequency domain  |
| 53  | fBodyAccJerk-std()-Y                 | FrequencyDomainBodyAccelerationJerkStandardDeviationY            | The standard deviation of the  body acceleration jerk  along the Y-axis in the frequency domain  |
| 54  | fBodyAccJerk-std()-Z                 | FrequencyDomainBodyAccelerationJerkStandardDeviationZ            | The standard deviation of the  body acceleration jerk  along the Z-axis in the frequency domain  |
| 55  | fBodyGyro-mean()-X                   | FrequencyDomainBodyAngularSpeedMeanX                             | The mean of the  body angular speed  along the X-axis in the frequency domain  |
| 56  | fBodyGyro-mean()-Y                   | FrequencyDomainBodyAngularSpeedMeanY                             | The mean of the  body angular speed  along the Y-axis in the frequency domain  |
| 57  | fBodyGyro-mean()-Z                   | FrequencyDomainBodyAngularSpeedMeanZ                             | The mean of the  body angular speed  along the Z-axis in the frequency domain  |
| 58  | fBodyGyro-std()-X                    | FrequencyDomainBodyAngularSpeedStandardDeviationX                | The standard deviation of the  body angular speed  along the X-axis in the frequency domain  |
| 59  | fBodyGyro-std()-Y                    | FrequencyDomainBodyAngularSpeedStandardDeviationY                | The standard deviation of the  body angular speed  along the Y-axis in the frequency domain  |
| 60  | fBodyGyro-std()-Z                    | FrequencyDomainBodyAngularSpeedStandardDeviationZ                | The standard deviation of the  body angular speed  along the Z-axis in the frequency domain  |
| 61  | fBodyAccMag-mean()                   | FrequencyDomainBodyAccelerationMagnitudeMean                     | The mean of the  body acceleration magnitude  in the frequency domain  |
| 62  | fBodyAccMag-std()                    | FrequencyDomainBodyAccelerationMagnitudeStandardDeviation        | The standard deviation of the  body acceleration magnitude  in the frequency domain  |
| 63  | fBodyBodyAccJerkMag-mean()           | FrequencyDomainBodyAccelerationJerkMagnitudeMean                 | The mean of the  body acceleration jerk magnitude  in the frequency domain  |
| 64  | fBodyBodyAccJerkMag-std()            | FrequencyDomainBodyAccelerationJerkMagnitudeStandardDeviation    | The standard deviation of the  body acceleration jerk magnitude  in the frequency domain  |
| 65  | fBodyBodyGyroMag-mean()              | FrequencyDomainBodyAngularSpeedMagnitudeMean                     | The mean of the  body angular speed magnitude  in the frequency domain  |
| 66  | fBodyBodyGyroMag-std()               | FrequencyDomainBodyAngularSpeedMagnitudeStandardDeviation        | The standard deviation of the  body angular speed magnitude  in the frequency domain  |
| 67  | fBodyBodyGyroJerkMag-mean()          | FrequencyDomainBodyAngularAccelerationMagnitudeMean              | The mean of the  body angular acceleration magnitude  in the frequency domain  |
| 68  | fBodyBodyGyroJerkMag-std()           | FrequencyDomainBodyAngularAccelerationMagnitudeStandardDeviation | The standard deviation of the  body angular acceleration magnitude  in the frequency domain  |
| 69  | tBodyAcc-mad()-X                     | ----------NOT SELECTED----------                                 | |--------------| |
| 70  | tBodyAcc-mad()-Y                     | ----------NOT SELECTED----------                                 | |--------------| |
| 71  | tBodyAcc-mad()-Z                     | ----------NOT SELECTED----------                                 | |--------------| |
| 72  | tBodyAcc-max()-X                     | ----------NOT SELECTED----------                                 | |--------------| |
| 73  | tBodyAcc-max()-Y                     | ----------NOT SELECTED----------                                 | |--------------| |
| 74  | tBodyAcc-max()-Z                     | ----------NOT SELECTED----------                                 | |--------------| |
| 75  | tBodyAcc-min()-X                     | ----------NOT SELECTED----------                                 | |--------------| |
| 76  | tBodyAcc-min()-Y                     | ----------NOT SELECTED----------                                 | |--------------| |
| 77  | tBodyAcc-min()-Z                     | ----------NOT SELECTED----------                                 | |--------------| |
| 78  | tBodyAcc-sma()                       | ----------NOT SELECTED----------                                 | |--------------| |
| 79  | tBodyAcc-energy()-X                  | ----------NOT SELECTED----------                                 | |--------------| |
| 80  | tBodyAcc-energy()-Y                  | ----------NOT SELECTED----------                                 | |--------------| |
| 81  | tBodyAcc-energy()-Z                  | ----------NOT SELECTED----------                                 | |--------------| |
| 82  | tBodyAcc-iqr()-X                     | ----------NOT SELECTED----------                                 | |--------------| |
| 83  | tBodyAcc-iqr()-Y                     | ----------NOT SELECTED----------                                 | |--------------| |
| 84  | tBodyAcc-iqr()-Z                     | ----------NOT SELECTED----------                                 | |--------------| |
| 85  | tBodyAcc-entropy()-X                 | ----------NOT SELECTED----------                                 | |--------------| |
| 86  | tBodyAcc-entropy()-Y                 | ----------NOT SELECTED----------                                 | |--------------| |
| 87  | tBodyAcc-entropy()-Z                 | ----------NOT SELECTED----------                                 | |--------------| |
| 88  | tBodyAcc-arCoeff()-X,1               | ----------NOT SELECTED----------                                 | |--------------| |
| 89  | tBodyAcc-arCoeff()-X,2               | ----------NOT SELECTED----------                                 | |--------------| |
| 90  | tBodyAcc-arCoeff()-X,3               | ----------NOT SELECTED----------                                 | |--------------| |
| 91  | tBodyAcc-arCoeff()-X,4               | ----------NOT SELECTED----------                                 | |--------------| |
| 92  | tBodyAcc-arCoeff()-Y,1               | ----------NOT SELECTED----------                                 | |--------------| |
| 93  | tBodyAcc-arCoeff()-Y,2               | ----------NOT SELECTED----------                                 | |--------------| |
| 94  | tBodyAcc-arCoeff()-Y,3               | ----------NOT SELECTED----------                                 | |--------------| |
| 95  | tBodyAcc-arCoeff()-Y,4               | ----------NOT SELECTED----------                                 | |--------------| |
| 96  | tBodyAcc-arCoeff()-Z,1               | ----------NOT SELECTED----------                                 | |--------------| |
| 97  | tBodyAcc-arCoeff()-Z,2               | ----------NOT SELECTED----------                                 | |--------------| |
| 98  | tBodyAcc-arCoeff()-Z,3               | ----------NOT SELECTED----------                                 | |--------------| |
| 99  | tBodyAcc-arCoeff()-Z,4               | ----------NOT SELECTED----------                                 | |--------------| |
| 100 | tBodyAcc-correlation()-X,Y           | ----------NOT SELECTED----------                                 | |--------------| |
| 101 | tBodyAcc-correlation()-X,Z           | ----------NOT SELECTED----------                                 | |--------------| |
| 102 | tBodyAcc-correlation()-Y,Z           | ----------NOT SELECTED----------                                 | |--------------| |
| 103 | tGravityAcc-mad()-X                  | ----------NOT SELECTED----------                                 | |--------------| |
| 104 | tGravityAcc-mad()-Y                  | ----------NOT SELECTED----------                                 | |--------------| |
| 105 | tGravityAcc-mad()-Z                  | ----------NOT SELECTED----------                                 | |--------------| |
| 106 | tGravityAcc-max()-X                  | ----------NOT SELECTED----------                                 | |--------------| |
| 107 | tGravityAcc-max()-Y                  | ----------NOT SELECTED----------                                 | |--------------| |
| 108 | tGravityAcc-max()-Z                  | ----------NOT SELECTED----------                                 | |--------------| |
| 109 | tGravityAcc-min()-X                  | ----------NOT SELECTED----------                                 | |--------------| |
| 110 | tGravityAcc-min()-Y                  | ----------NOT SELECTED----------                                 | |--------------| |
| 111 | tGravityAcc-min()-Z                  | ----------NOT SELECTED----------                                 | |--------------| |
| 112 | tGravityAcc-sma()                    | ----------NOT SELECTED----------                                 | |--------------| |
| 113 | tGravityAcc-energy()-X               | ----------NOT SELECTED----------                                 | |--------------| |
| 114 | tGravityAcc-energy()-Y               | ----------NOT SELECTED----------                                 | |--------------| |
| 115 | tGravityAcc-energy()-Z               | ----------NOT SELECTED----------                                 | |--------------| |
| 116 | tGravityAcc-iqr()-X                  | ----------NOT SELECTED----------                                 | |--------------| |
| 117 | tGravityAcc-iqr()-Y                  | ----------NOT SELECTED----------                                 | |--------------| |
| 118 | tGravityAcc-iqr()-Z                  | ----------NOT SELECTED----------                                 | |--------------| |
| 119 | tGravityAcc-entropy()-X              | ----------NOT SELECTED----------                                 | |--------------| |
| 120 | tGravityAcc-entropy()-Y              | ----------NOT SELECTED----------                                 | |--------------| |
| 121 | tGravityAcc-entropy()-Z              | ----------NOT SELECTED----------                                 | |--------------| |
| 122 | tGravityAcc-arCoeff()-X,1            | ----------NOT SELECTED----------                                 | |--------------| |
| 123 | tGravityAcc-arCoeff()-X,2            | ----------NOT SELECTED----------                                 | |--------------| |
| 124 | tGravityAcc-arCoeff()-X,3            | ----------NOT SELECTED----------                                 | |--------------| |
| 125 | tGravityAcc-arCoeff()-X,4            | ----------NOT SELECTED----------                                 | |--------------| |
| 126 | tGravityAcc-arCoeff()-Y,1            | ----------NOT SELECTED----------                                 | |--------------| |
| 127 | tGravityAcc-arCoeff()-Y,2            | ----------NOT SELECTED----------                                 | |--------------| |
| 128 | tGravityAcc-arCoeff()-Y,3            | ----------NOT SELECTED----------                                 | |--------------| |
| 129 | tGravityAcc-arCoeff()-Y,4            | ----------NOT SELECTED----------                                 | |--------------| |
| 130 | tGravityAcc-arCoeff()-Z,1            | ----------NOT SELECTED----------                                 | |--------------| |
| 131 | tGravityAcc-arCoeff()-Z,2            | ----------NOT SELECTED----------                                 | |--------------| |
| 132 | tGravityAcc-arCoeff()-Z,3            | ----------NOT SELECTED----------                                 | |--------------| |
| 133 | tGravityAcc-arCoeff()-Z,4            | ----------NOT SELECTED----------                                 | |--------------| |
| 134 | tGravityAcc-correlation()-X,Y        | ----------NOT SELECTED----------                                 | |--------------| |
| 135 | tGravityAcc-correlation()-X,Z        | ----------NOT SELECTED----------                                 | |--------------| |
| 136 | tGravityAcc-correlation()-Y,Z        | ----------NOT SELECTED----------                                 | |--------------| |
| 137 | tBodyAccJerk-mad()-X                 | ----------NOT SELECTED----------                                 | |--------------| |
| 138 | tBodyAccJerk-mad()-Y                 | ----------NOT SELECTED----------                                 | |--------------| |
| 139 | tBodyAccJerk-mad()-Z                 | ----------NOT SELECTED----------                                 | |--------------| |
| 140 | tBodyAccJerk-max()-X                 | ----------NOT SELECTED----------                                 | |--------------| |
| 141 | tBodyAccJerk-max()-Y                 | ----------NOT SELECTED----------                                 | |--------------| |
| 142 | tBodyAccJerk-max()-Z                 | ----------NOT SELECTED----------                                 | |--------------| |
| 143 | tBodyAccJerk-min()-X                 | ----------NOT SELECTED----------                                 | |--------------| |
| 144 | tBodyAccJerk-min()-Y                 | ----------NOT SELECTED----------                                 | |--------------| |
| 145 | tBodyAccJerk-min()-Z                 | ----------NOT SELECTED----------                                 | |--------------| |
| 146 | tBodyAccJerk-sma()                   | ----------NOT SELECTED----------                                 | |--------------| |
| 147 | tBodyAccJerk-energy()-X              | ----------NOT SELECTED----------                                 | |--------------| |
| 148 | tBodyAccJerk-energy()-Y              | ----------NOT SELECTED----------                                 | |--------------| |
| 149 | tBodyAccJerk-energy()-Z              | ----------NOT SELECTED----------                                 | |--------------| |
| 150 | tBodyAccJerk-iqr()-X                 | ----------NOT SELECTED----------                                 | |--------------| |
| 151 | tBodyAccJerk-iqr()-Y                 | ----------NOT SELECTED----------                                 | |--------------| |
| 152 | tBodyAccJerk-iqr()-Z                 | ----------NOT SELECTED----------                                 | |--------------| |
| 153 | tBodyAccJerk-entropy()-X             | ----------NOT SELECTED----------                                 | |--------------| |
| 154 | tBodyAccJerk-entropy()-Y             | ----------NOT SELECTED----------                                 | |--------------| |
| 155 | tBodyAccJerk-entropy()-Z             | ----------NOT SELECTED----------                                 | |--------------| |
| 156 | tBodyAccJerk-arCoeff()-X,1           | ----------NOT SELECTED----------                                 | |--------------| |
| 157 | tBodyAccJerk-arCoeff()-X,2           | ----------NOT SELECTED----------                                 | |--------------| |
| 158 | tBodyAccJerk-arCoeff()-X,3           | ----------NOT SELECTED----------                                 | |--------------| |
| 159 | tBodyAccJerk-arCoeff()-X,4           | ----------NOT SELECTED----------                                 | |--------------| |
| 160 | tBodyAccJerk-arCoeff()-Y,1           | ----------NOT SELECTED----------                                 | |--------------| |
| 161 | tBodyAccJerk-arCoeff()-Y,2           | ----------NOT SELECTED----------                                 | |--------------| |
| 162 | tBodyAccJerk-arCoeff()-Y,3           | ----------NOT SELECTED----------                                 | |--------------| |
| 163 | tBodyAccJerk-arCoeff()-Y,4           | ----------NOT SELECTED----------                                 | |--------------| |
| 164 | tBodyAccJerk-arCoeff()-Z,1           | ----------NOT SELECTED----------                                 | |--------------| |
| 165 | tBodyAccJerk-arCoeff()-Z,2           | ----------NOT SELECTED----------                                 | |--------------| |
| 166 | tBodyAccJerk-arCoeff()-Z,3           | ----------NOT SELECTED----------                                 | |--------------| |
| 167 | tBodyAccJerk-arCoeff()-Z,4           | ----------NOT SELECTED----------                                 | |--------------| |
| 168 | tBodyAccJerk-correlation()-X,Y       | ----------NOT SELECTED----------                                 | |--------------| |
| 169 | tBodyAccJerk-correlation()-X,Z       | ----------NOT SELECTED----------                                 | |--------------| |
| 170 | tBodyAccJerk-correlation()-Y,Z       | ----------NOT SELECTED----------                                 | |--------------| |
| 171 | tBodyGyro-mad()-X                    | ----------NOT SELECTED----------                                 | |--------------| |
| 172 | tBodyGyro-mad()-Y                    | ----------NOT SELECTED----------                                 | |--------------| |
| 173 | tBodyGyro-mad()-Z                    | ----------NOT SELECTED----------                                 | |--------------| |
| 174 | tBodyGyro-max()-X                    | ----------NOT SELECTED----------                                 | |--------------| |
| 175 | tBodyGyro-max()-Y                    | ----------NOT SELECTED----------                                 | |--------------| |
| 176 | tBodyGyro-max()-Z                    | ----------NOT SELECTED----------                                 | |--------------| |
| 177 | tBodyGyro-min()-X                    | ----------NOT SELECTED----------                                 | |--------------| |
| 178 | tBodyGyro-min()-Y                    | ----------NOT SELECTED----------                                 | |--------------| |
| 179 | tBodyGyro-min()-Z                    | ----------NOT SELECTED----------                                 | |--------------| |
| 180 | tBodyGyro-sma()                      | ----------NOT SELECTED----------                                 | |--------------| |
| 181 | tBodyGyro-energy()-X                 | ----------NOT SELECTED----------                                 | |--------------| |
| 182 | tBodyGyro-energy()-Y                 | ----------NOT SELECTED----------                                 | |--------------| |
| 183 | tBodyGyro-energy()-Z                 | ----------NOT SELECTED----------                                 | |--------------| |
| 184 | tBodyGyro-iqr()-X                    | ----------NOT SELECTED----------                                 | |--------------| |
| 185 | tBodyGyro-iqr()-Y                    | ----------NOT SELECTED----------                                 | |--------------| |
| 186 | tBodyGyro-iqr()-Z                    | ----------NOT SELECTED----------                                 | |--------------| |
| 187 | tBodyGyro-entropy()-X                | ----------NOT SELECTED----------                                 | |--------------| |
| 188 | tBodyGyro-entropy()-Y                | ----------NOT SELECTED----------                                 | |--------------| |
| 189 | tBodyGyro-entropy()-Z                | ----------NOT SELECTED----------                                 | |--------------| |
| 190 | tBodyGyro-arCoeff()-X,1              | ----------NOT SELECTED----------                                 | |--------------| |
| 191 | tBodyGyro-arCoeff()-X,2              | ----------NOT SELECTED----------                                 | |--------------| |
| 192 | tBodyGyro-arCoeff()-X,3              | ----------NOT SELECTED----------                                 | |--------------| |
| 193 | tBodyGyro-arCoeff()-X,4              | ----------NOT SELECTED----------                                 | |--------------| |
| 194 | tBodyGyro-arCoeff()-Y,1              | ----------NOT SELECTED----------                                 | |--------------| |
| 195 | tBodyGyro-arCoeff()-Y,2              | ----------NOT SELECTED----------                                 | |--------------| |
| 196 | tBodyGyro-arCoeff()-Y,3              | ----------NOT SELECTED----------                                 | |--------------| |
| 197 | tBodyGyro-arCoeff()-Y,4              | ----------NOT SELECTED----------                                 | |--------------| |
| 198 | tBodyGyro-arCoeff()-Z,1              | ----------NOT SELECTED----------                                 | |--------------| |
| 199 | tBodyGyro-arCoeff()-Z,2              | ----------NOT SELECTED----------                                 | |--------------| |
| 200 | tBodyGyro-arCoeff()-Z,3              | ----------NOT SELECTED----------                                 | |--------------| |
| 201 | tBodyGyro-arCoeff()-Z,4              | ----------NOT SELECTED----------                                 | |--------------| |
| 202 | tBodyGyro-correlation()-X,Y          | ----------NOT SELECTED----------                                 | |--------------| |
| 203 | tBodyGyro-correlation()-X,Z          | ----------NOT SELECTED----------                                 | |--------------| |
| 204 | tBodyGyro-correlation()-Y,Z          | ----------NOT SELECTED----------                                 | |--------------| |
| 205 | tBodyGyroJerk-mad()-X                | ----------NOT SELECTED----------                                 | |--------------| |
| 206 | tBodyGyroJerk-mad()-Y                | ----------NOT SELECTED----------                                 | |--------------| |
| 207 | tBodyGyroJerk-mad()-Z                | ----------NOT SELECTED----------                                 | |--------------| |
| 208 | tBodyGyroJerk-max()-X                | ----------NOT SELECTED----------                                 | |--------------| |
| 209 | tBodyGyroJerk-max()-Y                | ----------NOT SELECTED----------                                 | |--------------| |
| 210 | tBodyGyroJerk-max()-Z                | ----------NOT SELECTED----------                                 | |--------------| |
| 211 | tBodyGyroJerk-min()-X                | ----------NOT SELECTED----------                                 | |--------------| |
| 212 | tBodyGyroJerk-min()-Y                | ----------NOT SELECTED----------                                 | |--------------| |
| 213 | tBodyGyroJerk-min()-Z                | ----------NOT SELECTED----------                                 | |--------------| |
| 214 | tBodyGyroJerk-sma()                  | ----------NOT SELECTED----------                                 | |--------------| |
| 215 | tBodyGyroJerk-energy()-X             | ----------NOT SELECTED----------                                 | |--------------| |
| 216 | tBodyGyroJerk-energy()-Y             | ----------NOT SELECTED----------                                 | |--------------| |
| 217 | tBodyGyroJerk-energy()-Z             | ----------NOT SELECTED----------                                 | |--------------| |
| 218 | tBodyGyroJerk-iqr()-X                | ----------NOT SELECTED----------                                 | |--------------| |
| 219 | tBodyGyroJerk-iqr()-Y                | ----------NOT SELECTED----------                                 | |--------------| |
| 220 | tBodyGyroJerk-iqr()-Z                | ----------NOT SELECTED----------                                 | |--------------| |
| 221 | tBodyGyroJerk-entropy()-X            | ----------NOT SELECTED----------                                 | |--------------| |
| 222 | tBodyGyroJerk-entropy()-Y            | ----------NOT SELECTED----------                                 | |--------------| |
| 223 | tBodyGyroJerk-entropy()-Z            | ----------NOT SELECTED----------                                 | |--------------| |
| 224 | tBodyGyroJerk-arCoeff()-X,1          | ----------NOT SELECTED----------                                 | |--------------| |
| 225 | tBodyGyroJerk-arCoeff()-X,2          | ----------NOT SELECTED----------                                 | |--------------| |
| 226 | tBodyGyroJerk-arCoeff()-X,3          | ----------NOT SELECTED----------                                 | |--------------| |
| 227 | tBodyGyroJerk-arCoeff()-X,4          | ----------NOT SELECTED----------                                 | |--------------| |
| 228 | tBodyGyroJerk-arCoeff()-Y,1          | ----------NOT SELECTED----------                                 | |--------------| |
| 229 | tBodyGyroJerk-arCoeff()-Y,2          | ----------NOT SELECTED----------                                 | |--------------| |
| 230 | tBodyGyroJerk-arCoeff()-Y,3          | ----------NOT SELECTED----------                                 | |--------------| |
| 231 | tBodyGyroJerk-arCoeff()-Y,4          | ----------NOT SELECTED----------                                 | |--------------| |
| 232 | tBodyGyroJerk-arCoeff()-Z,1          | ----------NOT SELECTED----------                                 | |--------------| |
| 233 | tBodyGyroJerk-arCoeff()-Z,2          | ----------NOT SELECTED----------                                 | |--------------| |
| 234 | tBodyGyroJerk-arCoeff()-Z,3          | ----------NOT SELECTED----------                                 | |--------------| |
| 235 | tBodyGyroJerk-arCoeff()-Z,4          | ----------NOT SELECTED----------                                 | |--------------| |
| 236 | tBodyGyroJerk-correlation()-X,Y      | ----------NOT SELECTED----------                                 | |--------------| |
| 237 | tBodyGyroJerk-correlation()-X,Z      | ----------NOT SELECTED----------                                 | |--------------| |
| 238 | tBodyGyroJerk-correlation()-Y,Z      | ----------NOT SELECTED----------                                 | |--------------| |
| 239 | tBodyAccMag-mad()                    | ----------NOT SELECTED----------                                 | |--------------| |
| 240 | tBodyAccMag-max()                    | ----------NOT SELECTED----------                                 | |--------------| |
| 241 | tBodyAccMag-min()                    | ----------NOT SELECTED----------                                 | |--------------| |
| 242 | tBodyAccMag-sma()                    | ----------NOT SELECTED----------                                 | |--------------| |
| 243 | tBodyAccMag-energy()                 | ----------NOT SELECTED----------                                 | |--------------| |
| 244 | tBodyAccMag-iqr()                    | ----------NOT SELECTED----------                                 | |--------------| |
| 245 | tBodyAccMag-entropy()                | ----------NOT SELECTED----------                                 | |--------------| |
| 246 | tBodyAccMag-arCoeff()1               | ----------NOT SELECTED----------                                 | |--------------| |
| 247 | tBodyAccMag-arCoeff()2               | ----------NOT SELECTED----------                                 | |--------------| |
| 248 | tBodyAccMag-arCoeff()3               | ----------NOT SELECTED----------                                 | |--------------| |
| 249 | tBodyAccMag-arCoeff()4               | ----------NOT SELECTED----------                                 | |--------------| |
| 250 | tGravityAccMag-mad()                 | ----------NOT SELECTED----------                                 | |--------------| |
| 251 | tGravityAccMag-max()                 | ----------NOT SELECTED----------                                 | |--------------| |
| 252 | tGravityAccMag-min()                 | ----------NOT SELECTED----------                                 | |--------------| |
| 253 | tGravityAccMag-sma()                 | ----------NOT SELECTED----------                                 | |--------------| |
| 254 | tGravityAccMag-energy()              | ----------NOT SELECTED----------                                 | |--------------| |
| 255 | tGravityAccMag-iqr()                 | ----------NOT SELECTED----------                                 | |--------------| |
| 256 | tGravityAccMag-entropy()             | ----------NOT SELECTED----------                                 | |--------------| |
| 257 | tGravityAccMag-arCoeff()1            | ----------NOT SELECTED----------                                 | |--------------| |
| 258 | tGravityAccMag-arCoeff()2            | ----------NOT SELECTED----------                                 | |--------------| |
| 259 | tGravityAccMag-arCoeff()3            | ----------NOT SELECTED----------                                 | |--------------| |
| 260 | tGravityAccMag-arCoeff()4            | ----------NOT SELECTED----------                                 | |--------------| |
| 261 | tBodyAccJerkMag-mad()                | ----------NOT SELECTED----------                                 | |--------------| |
| 262 | tBodyAccJerkMag-max()                | ----------NOT SELECTED----------                                 | |--------------| |
| 263 | tBodyAccJerkMag-min()                | ----------NOT SELECTED----------                                 | |--------------| |
| 264 | tBodyAccJerkMag-sma()                | ----------NOT SELECTED----------                                 | |--------------| |
| 265 | tBodyAccJerkMag-energy()             | ----------NOT SELECTED----------                                 | |--------------| |
| 266 | tBodyAccJerkMag-iqr()                | ----------NOT SELECTED----------                                 | |--------------| |
| 267 | tBodyAccJerkMag-entropy()            | ----------NOT SELECTED----------                                 | |--------------| |
| 268 | tBodyAccJerkMag-arCoeff()1           | ----------NOT SELECTED----------                                 | |--------------| |
| 269 | tBodyAccJerkMag-arCoeff()2           | ----------NOT SELECTED----------                                 | |--------------| |
| 270 | tBodyAccJerkMag-arCoeff()3           | ----------NOT SELECTED----------                                 | |--------------| |
| 271 | tBodyAccJerkMag-arCoeff()4           | ----------NOT SELECTED----------                                 | |--------------| |
| 272 | tBodyGyroMag-mad()                   | ----------NOT SELECTED----------                                 | |--------------| |
| 273 | tBodyGyroMag-max()                   | ----------NOT SELECTED----------                                 | |--------------| |
| 274 | tBodyGyroMag-min()                   | ----------NOT SELECTED----------                                 | |--------------| |
| 275 | tBodyGyroMag-sma()                   | ----------NOT SELECTED----------                                 | |--------------| |
| 276 | tBodyGyroMag-energy()                | ----------NOT SELECTED----------                                 | |--------------| |
| 277 | tBodyGyroMag-iqr()                   | ----------NOT SELECTED----------                                 | |--------------| |
| 278 | tBodyGyroMag-entropy()               | ----------NOT SELECTED----------                                 | |--------------| |
| 279 | tBodyGyroMag-arCoeff()1              | ----------NOT SELECTED----------                                 | |--------------| |
| 280 | tBodyGyroMag-arCoeff()2              | ----------NOT SELECTED----------                                 | |--------------| |
| 281 | tBodyGyroMag-arCoeff()3              | ----------NOT SELECTED----------                                 | |--------------| |
| 282 | tBodyGyroMag-arCoeff()4              | ----------NOT SELECTED----------                                 | |--------------| |
| 283 | tBodyGyroJerkMag-mad()               | ----------NOT SELECTED----------                                 | |--------------| |
| 284 | tBodyGyroJerkMag-max()               | ----------NOT SELECTED----------                                 | |--------------| |
| 285 | tBodyGyroJerkMag-min()               | ----------NOT SELECTED----------                                 | |--------------| |
| 286 | tBodyGyroJerkMag-sma()               | ----------NOT SELECTED----------                                 | |--------------| |
| 287 | tBodyGyroJerkMag-energy()            | ----------NOT SELECTED----------                                 | |--------------| |
| 288 | tBodyGyroJerkMag-iqr()               | ----------NOT SELECTED----------                                 | |--------------| |
| 289 | tBodyGyroJerkMag-entropy()           | ----------NOT SELECTED----------                                 | |--------------| |
| 290 | tBodyGyroJerkMag-arCoeff()1          | ----------NOT SELECTED----------                                 | |--------------| |
| 291 | tBodyGyroJerkMag-arCoeff()2          | ----------NOT SELECTED----------                                 | |--------------| |
| 292 | tBodyGyroJerkMag-arCoeff()3          | ----------NOT SELECTED----------                                 | |--------------| |
| 293 | tBodyGyroJerkMag-arCoeff()4          | ----------NOT SELECTED----------                                 | |--------------| |
| 294 | fBodyAcc-mad()-X                     | ----------NOT SELECTED----------                                 | |--------------| |
| 295 | fBodyAcc-mad()-Y                     | ----------NOT SELECTED----------                                 | |--------------| |
| 296 | fBodyAcc-mad()-Z                     | ----------NOT SELECTED----------                                 | |--------------| |
| 297 | fBodyAcc-max()-X                     | ----------NOT SELECTED----------                                 | |--------------| |
| 298 | fBodyAcc-max()-Y                     | ----------NOT SELECTED----------                                 | |--------------| |
| 299 | fBodyAcc-max()-Z                     | ----------NOT SELECTED----------                                 | |--------------| |
| 300 | fBodyAcc-min()-X                     | ----------NOT SELECTED----------                                 | |--------------| |
| 301 | fBodyAcc-min()-Y                     | ----------NOT SELECTED----------                                 | |--------------| |
| 302 | fBodyAcc-min()-Z                     | ----------NOT SELECTED----------                                 | |--------------| |
| 303 | fBodyAcc-sma()                       | ----------NOT SELECTED----------                                 | |--------------| |
| 304 | fBodyAcc-energy()-X                  | ----------NOT SELECTED----------                                 | |--------------| |
| 305 | fBodyAcc-energy()-Y                  | ----------NOT SELECTED----------                                 | |--------------| |
| 306 | fBodyAcc-energy()-Z                  | ----------NOT SELECTED----------                                 | |--------------| |
| 307 | fBodyAcc-iqr()-X                     | ----------NOT SELECTED----------                                 | |--------------| |
| 308 | fBodyAcc-iqr()-Y                     | ----------NOT SELECTED----------                                 | |--------------| |
| 309 | fBodyAcc-iqr()-Z                     | ----------NOT SELECTED----------                                 | |--------------| |
| 310 | fBodyAcc-entropy()-X                 | ----------NOT SELECTED----------                                 | |--------------| |
| 311 | fBodyAcc-entropy()-Y                 | ----------NOT SELECTED----------                                 | |--------------| |
| 312 | fBodyAcc-entropy()-Z                 | ----------NOT SELECTED----------                                 | |--------------| |
| 313 | fBodyAcc-maxInds-X                   | ----------NOT SELECTED----------                                 | |--------------| |
| 314 | fBodyAcc-maxInds-Y                   | ----------NOT SELECTED----------                                 | |--------------| |
| 315 | fBodyAcc-maxInds-Z                   | ----------NOT SELECTED----------                                 | |--------------| |
| 316 | fBodyAcc-meanFreq()-X                | ----------NOT SELECTED----------                                 | |--------------| |
| 317 | fBodyAcc-meanFreq()-Y                | ----------NOT SELECTED----------                                 | |--------------| |
| 318 | fBodyAcc-meanFreq()-Z                | ----------NOT SELECTED----------                                 | |--------------| |
| 319 | fBodyAcc-skewness()-X                | ----------NOT SELECTED----------                                 | |--------------| |
| 320 | fBodyAcc-kurtosis()-X                | ----------NOT SELECTED----------                                 | |--------------| |
| 321 | fBodyAcc-skewness()-Y                | ----------NOT SELECTED----------                                 | |--------------| |
| 322 | fBodyAcc-kurtosis()-Y                | ----------NOT SELECTED----------                                 | |--------------| |
| 323 | fBodyAcc-skewness()-Z                | ----------NOT SELECTED----------                                 | |--------------| |
| 324 | fBodyAcc-kurtosis()-Z                | ----------NOT SELECTED----------                                 | |--------------| |
| 325 | fBodyAcc-bandsEnergy()-1,8           | ----------NOT SELECTED----------                                 | |--------------| |
| 326 | fBodyAcc-bandsEnergy()-9,16          | ----------NOT SELECTED----------                                 | |--------------| |
| 327 | fBodyAcc-bandsEnergy()-17,24         | ----------NOT SELECTED----------                                 | |--------------| |
| 328 | fBodyAcc-bandsEnergy()-25,32         | ----------NOT SELECTED----------                                 | |--------------| |
| 329 | fBodyAcc-bandsEnergy()-33,40         | ----------NOT SELECTED----------                                 | |--------------| |
| 330 | fBodyAcc-bandsEnergy()-41,48         | ----------NOT SELECTED----------                                 | |--------------| |
| 331 | fBodyAcc-bandsEnergy()-49,56         | ----------NOT SELECTED----------                                 | |--------------| |
| 332 | fBodyAcc-bandsEnergy()-57,64         | ----------NOT SELECTED----------                                 | |--------------| |
| 333 | fBodyAcc-bandsEnergy()-1,16          | ----------NOT SELECTED----------                                 | |--------------| |
| 334 | fBodyAcc-bandsEnergy()-17,32         | ----------NOT SELECTED----------                                 | |--------------| |
| 335 | fBodyAcc-bandsEnergy()-33,48         | ----------NOT SELECTED----------                                 | |--------------| |
| 336 | fBodyAcc-bandsEnergy()-49,64         | ----------NOT SELECTED----------                                 | |--------------| |
| 337 | fBodyAcc-bandsEnergy()-1,24          | ----------NOT SELECTED----------                                 | |--------------| |
| 338 | fBodyAcc-bandsEnergy()-25,48         | ----------NOT SELECTED----------                                 | |--------------| |
| 339 | fBodyAcc-bandsEnergy()-1,8.1         | ----------NOT SELECTED----------                                 | |--------------| |
| 340 | fBodyAcc-bandsEnergy()-9,16.1        | ----------NOT SELECTED----------                                 | |--------------| |
| 341 | fBodyAcc-bandsEnergy()-17,24.1       | ----------NOT SELECTED----------                                 | |--------------| |
| 342 | fBodyAcc-bandsEnergy()-25,32.1       | ----------NOT SELECTED----------                                 | |--------------| |
| 343 | fBodyAcc-bandsEnergy()-33,40.1       | ----------NOT SELECTED----------                                 | |--------------| |
| 344 | fBodyAcc-bandsEnergy()-41,48.1       | ----------NOT SELECTED----------                                 | |--------------| |
| 345 | fBodyAcc-bandsEnergy()-49,56.1       | ----------NOT SELECTED----------                                 | |--------------| |
| 346 | fBodyAcc-bandsEnergy()-57,64.1       | ----------NOT SELECTED----------                                 | |--------------| |
| 347 | fBodyAcc-bandsEnergy()-1,16.1        | ----------NOT SELECTED----------                                 | |--------------| |
| 348 | fBodyAcc-bandsEnergy()-17,32.1       | ----------NOT SELECTED----------                                 | |--------------| |
| 349 | fBodyAcc-bandsEnergy()-33,48.1       | ----------NOT SELECTED----------                                 | |--------------| |
| 350 | fBodyAcc-bandsEnergy()-49,64.1       | ----------NOT SELECTED----------                                 | |--------------| |
| 351 | fBodyAcc-bandsEnergy()-1,24.1        | ----------NOT SELECTED----------                                 | |--------------| |
| 352 | fBodyAcc-bandsEnergy()-25,48.1       | ----------NOT SELECTED----------                                 | |--------------| |
| 353 | fBodyAcc-bandsEnergy()-1,8.2         | ----------NOT SELECTED----------                                 | |--------------| |
| 354 | fBodyAcc-bandsEnergy()-9,16.2        | ----------NOT SELECTED----------                                 | |--------------| |
| 355 | fBodyAcc-bandsEnergy()-17,24.2       | ----------NOT SELECTED----------                                 | |--------------| |
| 356 | fBodyAcc-bandsEnergy()-25,32.2       | ----------NOT SELECTED----------                                 | |--------------| |
| 357 | fBodyAcc-bandsEnergy()-33,40.2       | ----------NOT SELECTED----------                                 | |--------------| |
| 358 | fBodyAcc-bandsEnergy()-41,48.2       | ----------NOT SELECTED----------                                 | |--------------| |
| 359 | fBodyAcc-bandsEnergy()-49,56.2       | ----------NOT SELECTED----------                                 | |--------------| |
| 360 | fBodyAcc-bandsEnergy()-57,64.2       | ----------NOT SELECTED----------                                 | |--------------| |
| 361 | fBodyAcc-bandsEnergy()-1,16.2        | ----------NOT SELECTED----------                                 | |--------------| |
| 362 | fBodyAcc-bandsEnergy()-17,32.2       | ----------NOT SELECTED----------                                 | |--------------| |
| 363 | fBodyAcc-bandsEnergy()-33,48.2       | ----------NOT SELECTED----------                                 | |--------------| |
| 364 | fBodyAcc-bandsEnergy()-49,64.2       | ----------NOT SELECTED----------                                 | |--------------| |
| 365 | fBodyAcc-bandsEnergy()-1,24.2        | ----------NOT SELECTED----------                                 | |--------------| |
| 366 | fBodyAcc-bandsEnergy()-25,48.2       | ----------NOT SELECTED----------                                 | |--------------| |
| 367 | fBodyAccJerk-mad()-X                 | ----------NOT SELECTED----------                                 | |--------------| |
| 368 | fBodyAccJerk-mad()-Y                 | ----------NOT SELECTED----------                                 | |--------------| |
| 369 | fBodyAccJerk-mad()-Z                 | ----------NOT SELECTED----------                                 | |--------------| |
| 370 | fBodyAccJerk-max()-X                 | ----------NOT SELECTED----------                                 | |--------------| |
| 371 | fBodyAccJerk-max()-Y                 | ----------NOT SELECTED----------                                 | |--------------| |
| 372 | fBodyAccJerk-max()-Z                 | ----------NOT SELECTED----------                                 | |--------------| |
| 373 | fBodyAccJerk-min()-X                 | ----------NOT SELECTED----------                                 | |--------------| |
| 374 | fBodyAccJerk-min()-Y                 | ----------NOT SELECTED----------                                 | |--------------| |
| 375 | fBodyAccJerk-min()-Z                 | ----------NOT SELECTED----------                                 | |--------------| |
| 376 | fBodyAccJerk-sma()                   | ----------NOT SELECTED----------                                 | |--------------| |
| 377 | fBodyAccJerk-energy()-X              | ----------NOT SELECTED----------                                 | |--------------| |
| 378 | fBodyAccJerk-energy()-Y              | ----------NOT SELECTED----------                                 | |--------------| |
| 379 | fBodyAccJerk-energy()-Z              | ----------NOT SELECTED----------                                 | |--------------| |
| 380 | fBodyAccJerk-iqr()-X                 | ----------NOT SELECTED----------                                 | |--------------| |
| 381 | fBodyAccJerk-iqr()-Y                 | ----------NOT SELECTED----------                                 | |--------------| |
| 382 | fBodyAccJerk-iqr()-Z                 | ----------NOT SELECTED----------                                 | |--------------| |
| 383 | fBodyAccJerk-entropy()-X             | ----------NOT SELECTED----------                                 | |--------------| |
| 384 | fBodyAccJerk-entropy()-Y             | ----------NOT SELECTED----------                                 | |--------------| |
| 385 | fBodyAccJerk-entropy()-Z             | ----------NOT SELECTED----------                                 | |--------------| |
| 386 | fBodyAccJerk-maxInds-X               | ----------NOT SELECTED----------                                 | |--------------| |
| 387 | fBodyAccJerk-maxInds-Y               | ----------NOT SELECTED----------                                 | |--------------| |
| 388 | fBodyAccJerk-maxInds-Z               | ----------NOT SELECTED----------                                 | |--------------| |
| 389 | fBodyAccJerk-meanFreq()-X            | ----------NOT SELECTED----------                                 | |--------------| |
| 390 | fBodyAccJerk-meanFreq()-Y            | ----------NOT SELECTED----------                                 | |--------------| |
| 391 | fBodyAccJerk-meanFreq()-Z            | ----------NOT SELECTED----------                                 | |--------------| |
| 392 | fBodyAccJerk-skewness()-X            | ----------NOT SELECTED----------                                 | |--------------| |
| 393 | fBodyAccJerk-kurtosis()-X            | ----------NOT SELECTED----------                                 | |--------------| |
| 394 | fBodyAccJerk-skewness()-Y            | ----------NOT SELECTED----------                                 | |--------------| |
| 395 | fBodyAccJerk-kurtosis()-Y            | ----------NOT SELECTED----------                                 | |--------------| |
| 396 | fBodyAccJerk-skewness()-Z            | ----------NOT SELECTED----------                                 | |--------------| |
| 397 | fBodyAccJerk-kurtosis()-Z            | ----------NOT SELECTED----------                                 | |--------------| |
| 398 | fBodyAccJerk-bandsEnergy()-1,8       | ----------NOT SELECTED----------                                 | |--------------| |
| 399 | fBodyAccJerk-bandsEnergy()-9,16      | ----------NOT SELECTED----------                                 | |--------------| |
| 400 | fBodyAccJerk-bandsEnergy()-17,24     | ----------NOT SELECTED----------                                 | |--------------| |
| 401 | fBodyAccJerk-bandsEnergy()-25,32     | ----------NOT SELECTED----------                                 | |--------------| |
| 402 | fBodyAccJerk-bandsEnergy()-33,40     | ----------NOT SELECTED----------                                 | |--------------| |
| 403 | fBodyAccJerk-bandsEnergy()-41,48     | ----------NOT SELECTED----------                                 | |--------------| |
| 404 | fBodyAccJerk-bandsEnergy()-49,56     | ----------NOT SELECTED----------                                 | |--------------| |
| 405 | fBodyAccJerk-bandsEnergy()-57,64     | ----------NOT SELECTED----------                                 | |--------------| |
| 406 | fBodyAccJerk-bandsEnergy()-1,16      | ----------NOT SELECTED----------                                 | |--------------| |
| 407 | fBodyAccJerk-bandsEnergy()-17,32     | ----------NOT SELECTED----------                                 | |--------------| |
| 408 | fBodyAccJerk-bandsEnergy()-33,48     | ----------NOT SELECTED----------                                 | |--------------| |
| 409 | fBodyAccJerk-bandsEnergy()-49,64     | ----------NOT SELECTED----------                                 | |--------------| |
| 410 | fBodyAccJerk-bandsEnergy()-1,24      | ----------NOT SELECTED----------                                 | |--------------| |
| 411 | fBodyAccJerk-bandsEnergy()-25,48     | ----------NOT SELECTED----------                                 | |--------------| |
| 412 | fBodyAccJerk-bandsEnergy()-1,8.1     | ----------NOT SELECTED----------                                 | |--------------| |
| 413 | fBodyAccJerk-bandsEnergy()-9,16.1    | ----------NOT SELECTED----------                                 | |--------------| |
| 414 | fBodyAccJerk-bandsEnergy()-17,24.1   | ----------NOT SELECTED----------                                 | |--------------| |
| 415 | fBodyAccJerk-bandsEnergy()-25,32.1   | ----------NOT SELECTED----------                                 | |--------------| |
| 416 | fBodyAccJerk-bandsEnergy()-33,40.1   | ----------NOT SELECTED----------                                 | |--------------| |
| 417 | fBodyAccJerk-bandsEnergy()-41,48.1   | ----------NOT SELECTED----------                                 | |--------------| |
| 418 | fBodyAccJerk-bandsEnergy()-49,56.1   | ----------NOT SELECTED----------                                 | |--------------| |
| 419 | fBodyAccJerk-bandsEnergy()-57,64.1   | ----------NOT SELECTED----------                                 | |--------------| |
| 420 | fBodyAccJerk-bandsEnergy()-1,16.1    | ----------NOT SELECTED----------                                 | |--------------| |
| 421 | fBodyAccJerk-bandsEnergy()-17,32.1   | ----------NOT SELECTED----------                                 | |--------------| |
| 422 | fBodyAccJerk-bandsEnergy()-33,48.1   | ----------NOT SELECTED----------                                 | |--------------| |
| 423 | fBodyAccJerk-bandsEnergy()-49,64.1   | ----------NOT SELECTED----------                                 | |--------------| |
| 424 | fBodyAccJerk-bandsEnergy()-1,24.1    | ----------NOT SELECTED----------                                 | |--------------| |
| 425 | fBodyAccJerk-bandsEnergy()-25,48.1   | ----------NOT SELECTED----------                                 | |--------------| |
| 426 | fBodyAccJerk-bandsEnergy()-1,8.2     | ----------NOT SELECTED----------                                 | |--------------| |
| 427 | fBodyAccJerk-bandsEnergy()-9,16.2    | ----------NOT SELECTED----------                                 | |--------------| |
| 428 | fBodyAccJerk-bandsEnergy()-17,24.2   | ----------NOT SELECTED----------                                 | |--------------| |
| 429 | fBodyAccJerk-bandsEnergy()-25,32.2   | ----------NOT SELECTED----------                                 | |--------------| |
| 430 | fBodyAccJerk-bandsEnergy()-33,40.2   | ----------NOT SELECTED----------                                 | |--------------| |
| 431 | fBodyAccJerk-bandsEnergy()-41,48.2   | ----------NOT SELECTED----------                                 | |--------------| |
| 432 | fBodyAccJerk-bandsEnergy()-49,56.2   | ----------NOT SELECTED----------                                 | |--------------| |
| 433 | fBodyAccJerk-bandsEnergy()-57,64.2   | ----------NOT SELECTED----------                                 | |--------------| |
| 434 | fBodyAccJerk-bandsEnergy()-1,16.2    | ----------NOT SELECTED----------                                 | |--------------| |
| 435 | fBodyAccJerk-bandsEnergy()-17,32.2   | ----------NOT SELECTED----------                                 | |--------------| |
| 436 | fBodyAccJerk-bandsEnergy()-33,48.2   | ----------NOT SELECTED----------                                 | |--------------| |
| 437 | fBodyAccJerk-bandsEnergy()-49,64.2   | ----------NOT SELECTED----------                                 | |--------------| |
| 438 | fBodyAccJerk-bandsEnergy()-1,24.2    | ----------NOT SELECTED----------                                 | |--------------| |
| 439 | fBodyAccJerk-bandsEnergy()-25,48.2   | ----------NOT SELECTED----------                                 | |--------------| |
| 440 | fBodyGyro-mad()-X                    | ----------NOT SELECTED----------                                 | |--------------| |
| 441 | fBodyGyro-mad()-Y                    | ----------NOT SELECTED----------                                 | |--------------| |
| 442 | fBodyGyro-mad()-Z                    | ----------NOT SELECTED----------                                 | |--------------| |
| 443 | fBodyGyro-max()-X                    | ----------NOT SELECTED----------                                 | |--------------| |
| 444 | fBodyGyro-max()-Y                    | ----------NOT SELECTED----------                                 | |--------------| |
| 445 | fBodyGyro-max()-Z                    | ----------NOT SELECTED----------                                 | |--------------| |
| 446 | fBodyGyro-min()-X                    | ----------NOT SELECTED----------                                 | |--------------| |
| 447 | fBodyGyro-min()-Y                    | ----------NOT SELECTED----------                                 | |--------------| |
| 448 | fBodyGyro-min()-Z                    | ----------NOT SELECTED----------                                 | |--------------| |
| 449 | fBodyGyro-sma()                      | ----------NOT SELECTED----------                                 | |--------------| |
| 450 | fBodyGyro-energy()-X                 | ----------NOT SELECTED----------                                 | |--------------| |
| 451 | fBodyGyro-energy()-Y                 | ----------NOT SELECTED----------                                 | |--------------| |
| 452 | fBodyGyro-energy()-Z                 | ----------NOT SELECTED----------                                 | |--------------| |
| 453 | fBodyGyro-iqr()-X                    | ----------NOT SELECTED----------                                 | |--------------| |
| 454 | fBodyGyro-iqr()-Y                    | ----------NOT SELECTED----------                                 | |--------------| |
| 455 | fBodyGyro-iqr()-Z                    | ----------NOT SELECTED----------                                 | |--------------| |
| 456 | fBodyGyro-entropy()-X                | ----------NOT SELECTED----------                                 | |--------------| |
| 457 | fBodyGyro-entropy()-Y                | ----------NOT SELECTED----------                                 | |--------------| |
| 458 | fBodyGyro-entropy()-Z                | ----------NOT SELECTED----------                                 | |--------------| |
| 459 | fBodyGyro-maxInds-X                  | ----------NOT SELECTED----------                                 | |--------------| |
| 460 | fBodyGyro-maxInds-Y                  | ----------NOT SELECTED----------                                 | |--------------| |
| 461 | fBodyGyro-maxInds-Z                  | ----------NOT SELECTED----------                                 | |--------------| |
| 462 | fBodyGyro-meanFreq()-X               | ----------NOT SELECTED----------                                 | |--------------| |
| 463 | fBodyGyro-meanFreq()-Y               | ----------NOT SELECTED----------                                 | |--------------| |
| 464 | fBodyGyro-meanFreq()-Z               | ----------NOT SELECTED----------                                 | |--------------| |
| 465 | fBodyGyro-skewness()-X               | ----------NOT SELECTED----------                                 | |--------------| |
| 466 | fBodyGyro-kurtosis()-X               | ----------NOT SELECTED----------                                 | |--------------| |
| 467 | fBodyGyro-skewness()-Y               | ----------NOT SELECTED----------                                 | |--------------| |
| 468 | fBodyGyro-kurtosis()-Y               | ----------NOT SELECTED----------                                 | |--------------| |
| 469 | fBodyGyro-skewness()-Z               | ----------NOT SELECTED----------                                 | |--------------| |
| 470 | fBodyGyro-kurtosis()-Z               | ----------NOT SELECTED----------                                 | |--------------| |
| 471 | fBodyGyro-bandsEnergy()-1,8          | ----------NOT SELECTED----------                                 | |--------------| |
| 472 | fBodyGyro-bandsEnergy()-9,16         | ----------NOT SELECTED----------                                 | |--------------| |
| 473 | fBodyGyro-bandsEnergy()-17,24        | ----------NOT SELECTED----------                                 | |--------------| |
| 474 | fBodyGyro-bandsEnergy()-25,32        | ----------NOT SELECTED----------                                 | |--------------| |
| 475 | fBodyGyro-bandsEnergy()-33,40        | ----------NOT SELECTED----------                                 | |--------------| |
| 476 | fBodyGyro-bandsEnergy()-41,48        | ----------NOT SELECTED----------                                 | |--------------| |
| 477 | fBodyGyro-bandsEnergy()-49,56        | ----------NOT SELECTED----------                                 | |--------------| |
| 478 | fBodyGyro-bandsEnergy()-57,64        | ----------NOT SELECTED----------                                 | |--------------| |
| 479 | fBodyGyro-bandsEnergy()-1,16         | ----------NOT SELECTED----------                                 | |--------------| |
| 480 | fBodyGyro-bandsEnergy()-17,32        | ----------NOT SELECTED----------                                 | |--------------| |
| 481 | fBodyGyro-bandsEnergy()-33,48        | ----------NOT SELECTED----------                                 | |--------------| |
| 482 | fBodyGyro-bandsEnergy()-49,64        | ----------NOT SELECTED----------                                 | |--------------| |
| 483 | fBodyGyro-bandsEnergy()-1,24         | ----------NOT SELECTED----------                                 | |--------------| |
| 484 | fBodyGyro-bandsEnergy()-25,48        | ----------NOT SELECTED----------                                 | |--------------| |
| 485 | fBodyGyro-bandsEnergy()-1,8.1        | ----------NOT SELECTED----------                                 | |--------------| |
| 486 | fBodyGyro-bandsEnergy()-9,16.1       | ----------NOT SELECTED----------                                 | |--------------| |
| 487 | fBodyGyro-bandsEnergy()-17,24.1      | ----------NOT SELECTED----------                                 | |--------------| |
| 488 | fBodyGyro-bandsEnergy()-25,32.1      | ----------NOT SELECTED----------                                 | |--------------| |
| 489 | fBodyGyro-bandsEnergy()-33,40.1      | ----------NOT SELECTED----------                                 | |--------------| |
| 490 | fBodyGyro-bandsEnergy()-41,48.1      | ----------NOT SELECTED----------                                 | |--------------| |
| 491 | fBodyGyro-bandsEnergy()-49,56.1      | ----------NOT SELECTED----------                                 | |--------------| |
| 492 | fBodyGyro-bandsEnergy()-57,64.1      | ----------NOT SELECTED----------                                 | |--------------| |
| 493 | fBodyGyro-bandsEnergy()-1,16.1       | ----------NOT SELECTED----------                                 | |--------------| |
| 494 | fBodyGyro-bandsEnergy()-17,32.1      | ----------NOT SELECTED----------                                 | |--------------| |
| 495 | fBodyGyro-bandsEnergy()-33,48.1      | ----------NOT SELECTED----------                                 | |--------------| |
| 496 | fBodyGyro-bandsEnergy()-49,64.1      | ----------NOT SELECTED----------                                 | |--------------| |
| 497 | fBodyGyro-bandsEnergy()-1,24.1       | ----------NOT SELECTED----------                                 | |--------------| |
| 498 | fBodyGyro-bandsEnergy()-25,48.1      | ----------NOT SELECTED----------                                 | |--------------| |
| 499 | fBodyGyro-bandsEnergy()-1,8.2        | ----------NOT SELECTED----------                                 | |--------------| |
| 500 | fBodyGyro-bandsEnergy()-9,16.2       | ----------NOT SELECTED----------                                 | |--------------| |
| 501 | fBodyGyro-bandsEnergy()-17,24.2      | ----------NOT SELECTED----------                                 | |--------------| |
| 502 | fBodyGyro-bandsEnergy()-25,32.2      | ----------NOT SELECTED----------                                 | |--------------| |
| 503 | fBodyGyro-bandsEnergy()-33,40.2      | ----------NOT SELECTED----------                                 | |--------------| |
| 504 | fBodyGyro-bandsEnergy()-41,48.2      | ----------NOT SELECTED----------                                 | |--------------| |
| 505 | fBodyGyro-bandsEnergy()-49,56.2      | ----------NOT SELECTED----------                                 | |--------------| |
| 506 | fBodyGyro-bandsEnergy()-57,64.2      | ----------NOT SELECTED----------                                 | |--------------| |
| 507 | fBodyGyro-bandsEnergy()-1,16.2       | ----------NOT SELECTED----------                                 | |--------------| |
| 508 | fBodyGyro-bandsEnergy()-17,32.2      | ----------NOT SELECTED----------                                 | |--------------| |
| 509 | fBodyGyro-bandsEnergy()-33,48.2      | ----------NOT SELECTED----------                                 | |--------------| |
| 510 | fBodyGyro-bandsEnergy()-49,64.2      | ----------NOT SELECTED----------                                 | |--------------| |
| 511 | fBodyGyro-bandsEnergy()-1,24.2       | ----------NOT SELECTED----------                                 | |--------------| |
| 512 | fBodyGyro-bandsEnergy()-25,48.2      | ----------NOT SELECTED----------                                 | |--------------| |
| 513 | fBodyAccMag-mad()                    | ----------NOT SELECTED----------                                 | |--------------| |
| 514 | fBodyAccMag-max()                    | ----------NOT SELECTED----------                                 | |--------------| |
| 515 | fBodyAccMag-min()                    | ----------NOT SELECTED----------                                 | |--------------| |
| 516 | fBodyAccMag-sma()                    | ----------NOT SELECTED----------                                 | |--------------| |
| 517 | fBodyAccMag-energy()                 | ----------NOT SELECTED----------                                 | |--------------| |
| 518 | fBodyAccMag-iqr()                    | ----------NOT SELECTED----------                                 | |--------------| |
| 519 | fBodyAccMag-entropy()                | ----------NOT SELECTED----------                                 | |--------------| |
| 520 | fBodyAccMag-maxInds                  | ----------NOT SELECTED----------                                 | |--------------| |
| 521 | fBodyAccMag-meanFreq()               | ----------NOT SELECTED----------                                 | |--------------| |
| 522 | fBodyAccMag-skewness()               | ----------NOT SELECTED----------                                 | |--------------| |
| 523 | fBodyAccMag-kurtosis()               | ----------NOT SELECTED----------                                 | |--------------| |
| 524 | fBodyBodyAccJerkMag-mad()            | ----------NOT SELECTED----------                                 | |--------------| |
| 525 | fBodyBodyAccJerkMag-max()            | ----------NOT SELECTED----------                                 | |--------------| |
| 526 | fBodyBodyAccJerkMag-min()            | ----------NOT SELECTED----------                                 | |--------------| |
| 527 | fBodyBodyAccJerkMag-sma()            | ----------NOT SELECTED----------                                 | |--------------| |
| 528 | fBodyBodyAccJerkMag-energy()         | ----------NOT SELECTED----------                                 | |--------------| |
| 529 | fBodyBodyAccJerkMag-iqr()            | ----------NOT SELECTED----------                                 | |--------------| |
| 530 | fBodyBodyAccJerkMag-entropy()        | ----------NOT SELECTED----------                                 | |--------------| |
| 531 | fBodyBodyAccJerkMag-maxInds          | ----------NOT SELECTED----------                                 | |--------------| |
| 532 | fBodyBodyAccJerkMag-meanFreq()       | ----------NOT SELECTED----------                                 | |--------------| |
| 533 | fBodyBodyAccJerkMag-skewness()       | ----------NOT SELECTED----------                                 | |--------------| |
| 534 | fBodyBodyAccJerkMag-kurtosis()       | ----------NOT SELECTED----------                                 | |--------------| |
| 535 | fBodyBodyGyroMag-mad()               | ----------NOT SELECTED----------                                 | |--------------| |
| 536 | fBodyBodyGyroMag-max()               | ----------NOT SELECTED----------                                 | |--------------| |
| 537 | fBodyBodyGyroMag-min()               | ----------NOT SELECTED----------                                 | |--------------| |
| 538 | fBodyBodyGyroMag-sma()               | ----------NOT SELECTED----------                                 | |--------------| |
| 539 | fBodyBodyGyroMag-energy()            | ----------NOT SELECTED----------                                 | |--------------| |
| 540 | fBodyBodyGyroMag-iqr()               | ----------NOT SELECTED----------                                 | |--------------| |
| 541 | fBodyBodyGyroMag-entropy()           | ----------NOT SELECTED----------                                 | |--------------| |
| 542 | fBodyBodyGyroMag-maxInds             | ----------NOT SELECTED----------                                 | |--------------| |
| 543 | fBodyBodyGyroMag-meanFreq()          | ----------NOT SELECTED----------                                 | |--------------| |
| 544 | fBodyBodyGyroMag-skewness()          | ----------NOT SELECTED----------                                 | |--------------| |
| 545 | fBodyBodyGyroMag-kurtosis()          | ----------NOT SELECTED----------                                 | |--------------| |
| 546 | fBodyBodyGyroJerkMag-mad()           | ----------NOT SELECTED----------                                 | |--------------| |
| 547 | fBodyBodyGyroJerkMag-max()           | ----------NOT SELECTED----------                                 | |--------------| |
| 548 | fBodyBodyGyroJerkMag-min()           | ----------NOT SELECTED----------                                 | |--------------| |
| 549 | fBodyBodyGyroJerkMag-sma()           | ----------NOT SELECTED----------                                 | |--------------| |
| 550 | fBodyBodyGyroJerkMag-energy()        | ----------NOT SELECTED----------                                 | |--------------| |
| 551 | fBodyBodyGyroJerkMag-iqr()           | ----------NOT SELECTED----------                                 | |--------------| |
| 552 | fBodyBodyGyroJerkMag-entropy()       | ----------NOT SELECTED----------                                 | |--------------| |
| 553 | fBodyBodyGyroJerkMag-maxInds         | ----------NOT SELECTED----------                                 | |--------------| |
| 554 | fBodyBodyGyroJerkMag-meanFreq()      | ----------NOT SELECTED----------                                 | |--------------| |
| 555 | fBodyBodyGyroJerkMag-skewness()      | ----------NOT SELECTED----------                                 | |--------------| |
| 556 | fBodyBodyGyroJerkMag-kurtosis()      | ----------NOT SELECTED----------                                 | |--------------| |
| 557 | angle(tBodyAccMean,gravity)          | ----------NOT SELECTED----------                                 | |--------------| |
| 558 | angle(tBodyAccJerkMean),gravityMean) | ----------NOT SELECTED----------                                 | |--------------| |
| 559 | angle(tBodyGyroMean,gravityMean)     | ----------NOT SELECTED----------                                 | |--------------| |
| 560 | angle(tBodyGyroJerkMean,gravityMean) | ----------NOT SELECTED----------                                 | |--------------| |
| 561 | angle(X,gravityMean)                 | ----------NOT SELECTED----------                                 | |--------------| |
| 562 | angle(Y,gravityMean)                 | ----------NOT SELECTED----------                                 | |--------------| |
| 563 | angle(Z,gravityMean)                 | ----------NOT SELECTED----------                                 | |--------------| |
