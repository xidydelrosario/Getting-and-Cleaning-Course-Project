# Code Book for *Getting and Cleaning Data* course project

This is the code book of the end result data set `tidy_data.txt`. This will briefly describe data, the variables used in the code and the steps made in creating the code.

## Data

The `tidy_data.txt` data file is a text file, containing space-separated values.

The first row contains the names of the variables and the succeeding rows contain the values of these variables. 

## Variables

* `xtrain`, `ytrain`, `xtest`, `ytest`, `subjecttrain` and `subjecttest` contain the data from the downloaded files.
* `xdata`, `ydata` and `subjectdata` contains the combined data from the 'test' and 'train' data. This data set was created using rbind command.
* `features_mean_std` is a numeric vector which is a placeholder of all the required values.
* `features_data` contains the correct names for the `xdata` dataset. These values are then applied to the column names stored in `features_mean_std`
* `activitylabel` contains all the activities data 
* `alldata` combines `xdata`, `ydata` and `subject_ata` in one dataset.
* Finally, `averagedata` contains the relevant averages which will be later stored in the `tidy.txt` file.

## Activity

	* `WALKING`- subject was walking during the test
	* `WALKING_UPSTAIRS`- subject was walking upstairs during the test
	* `WALKING_DOWNSTAIRS`- subject was walking downstairs during the test
	* `SITTING`- subject was sitting during the test
	* `STANDING`- subject was standing during the test
	* `LAYING`- subject was laying during the test
