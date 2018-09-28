# This file contains the Peer-graded Assignment: Getting and Cleaning Data Course Project

# download dataset and extract the zip file
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip", "Dataset.zip")
unzip("Dataset.zip")

# make links to all directories within the dataset
path_R <- getwd()
path_dataset <- paste(path_R,"UCI HAR Dataset",sep="/")
path_test <- paste(path_dataset,"test",sep="/")
path_train <- paste(path_dataset,"train",sep="/")


# load all extracted files into dataframes
# 1) load the general files
setwd(path_dataset)

activity_labels <- read.table("activity_labels.txt",sep=" ")
names(activity_labels) <- c("activity_id","activity")

features <- read.table("features.txt",sep=" ")
names(features) <- c("feature_id", "feature")
n_features <- nrow(features)


# 2) load the train files
setwd(path_train)

subject_train <- read.table("subject_train.txt")
names(subject_train) <- "subject"

X_train <- read.fwf("X_train.txt",rep(16,n_features))
names(X_train) <- 1:n_features

y_train <- read.table("y_train.txt")
names(y_train) <- "activity"


# 3) load the test files
setwd(path_test)

subject_test <- read.table("subject_test.txt")
names(subject_test) <- "subject"

X_test <- read.fwf("X_test.txt",rep(16,n_features))
names(X_test) <- 1:n_features

y_test <- read.table("y_test.txt")
names(y_test) <- "activity"



# Merge all the training and the test sets to create one data set
library(dplyr)
X_train <- cbind(X_train, subject_train)
X_train <- cbind(X_train, y_train)
X_train <- mutate(X_train, type = "train")
X_test <- cbind(X_test, subject_test)
X_test <- cbind(X_test, y_test)
X_test <- mutate(X_test, type = "test")
X <- rbind(X_train, X_test)


# Extracts only the measurements on the mean and standard deviation of all measurements
library(data.table)
set_features <- filter(features, ((feature %like% "mean()") & (!feature %like% "meanFreq()")) | (feature %like% "std()"))

X <- select (X, subject, activity, type, set_features[,"feature_id"] )


# Uses descriptive activity names to name the activities
X <- mutate (X, activity = activity_labels[activity,2])


# Appropriately labels the data set with descriptive variable names.
library(readr)
temp <- parse_integer(names(X)[4:69])
names(X)[4:69] <- as.character(features[temp,"feature"])


# Creates a second, independent tidy data set with the average of each variable for each activity and each subject.
secondset <- group_by(X,activity, subject)

result <- aggregate(secondset,
                    list(Activity = secondset$activity,
                         Subject = secondset$subject), 
                    mean)

result <- select(result, -(3:5))

# Conclusion:
# The dataframe X contains the result of the first 4 instructions.
# The dataframe "result" contains the result of the last instruction.
