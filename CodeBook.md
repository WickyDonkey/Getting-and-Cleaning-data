# This CodeBook file describes the Peer-graded Assignment: Getting and Cleaning Data Course Project

The original dataset contain the following information:
=========================================

- 'README.txt'

- 'features_info.txt': Shows information about the variables used on the feature vector.

- 'features.txt': List of all features.

- 'activity_labels.txt': Links the class labels with their activity name.

- 'train/X_train.txt': Training set.

- 'train/y_train.txt': Training labels.

- 'test/X_test.txt': Test set.

- 'test/y_test.txt': Test labels.

The following files are available for the train and test data. Their descriptions are equivalent. 

- 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 

- 'train/Inertial Signals/total_acc_x_train.txt': The acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g'. Every row shows a 128 element vector. The same description applies for the 'total_acc_x_train.txt' and 'total_acc_z_train.txt' files for the Y and Z axis. 

- 'train/Inertial Signals/body_acc_x_train.txt': The body acceleration signal obtained by subtracting the gravity from the total acceleration. 

- 'train/Inertial Signals/body_gyro_x_train.txt': The angular velocity vector measured by the gyroscope for each window sample. The units are radians/second. 


Code Book information for the run analysis program:
===================================================
The following files mentioned above are used:

- 'features.txt': List of all features.
- 'activity_labels.txt': Links the class labels with their activity name.
- 'train/X_train.txt': Training set.
- 'train/y_train.txt': Training labels.
- 'test/X_test.txt': Test set.
- 'test/y_test.txt': Test labels.

The files are loaded into the following variables:

- features : list of all features
- activity labels : links the class label with their activity name.
- subject_test, subject_train : links the activity to the corresponding test
- X_test, X_train : intermediate result of the test and training sets. These sets are extended with the subject, activity and type ("train" or "test") data.
- y_test, y_train : links the subject to the corresponding test


The following constants are added:

- n_features : number of features (= 561)


During the program the following variables are created:
=======================================================

- X : final combined training and test set with all the data.

- set_features : indices of the features that are included ( ... mean() and ...std() )

- secondset : intermediate result based on X to create the grouped information.

- result : final aggregated information. This information is aggregated based on the Subject and Activity parameters.



