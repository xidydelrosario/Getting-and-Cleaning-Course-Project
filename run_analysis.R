library(dplyr)
library(plyr)

#1: Merges the training and the test sets to create one data set.

xtrain <- read.table("train/X_train.txt")
ytrain <- read.table("train/y_train.txt")
subjecttrain <- read.table("train/subject_train.txt")

xtest <- read.table("test/X_test.txt")
ytest <- read.table("test/y_test.txt")
subjecttest <- read.table("test/subject_test.txt")

#combine train and test data set
xdata <- rbind(xtrain, xtest)

ydata <- rbind(ytrain, ytest)

subjectdata <- rbind(subjecttrain, subjecttest)

#2: Extracts only the measurements on the mean and standard deviation for each measurement.

features_data <- read.table("features.txt")

#get columns with mean() or std() values
features_mean_std <- grep("-(mean|std)\\(\\)", features_data[, 2])

#subset xdata
xdata <- xdata[, features_mean_std]

# correct the column headers
names(xdata) <- features_data[features_mean_std, 2]

#3:Uses descriptive activity names to name the activities in the data set

activitylabel <- read.table("activity_labels.txt")

#update values with activity labels
ydata[, 1] <- activitylabel[ydata[, 1], 2]

#correct column header
names(ydata) <- "activity"

#4:Appropriately labels the data set with descriptive variable names.

#correct column header
names(subjectdata) <- "subject"

#combine all data in 1 dataset
alldata <- cbind(xdata, ydata, subjectdata)

#5:From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

averagedata <- ddply(alldata, .(subject, activity), function(x) colMeans(x[, 1:66]))

write.table(averagedata, "tidy.txt", row.name=FALSE)
