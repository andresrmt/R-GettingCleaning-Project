# Cleaning and Getting Data course project codebook

## Collecting data

The first lines in `run_analysis.R` will check if the database is already in
your local folder. If it is not, then `downloader.R` will be executed. This
script will download the `zip` file, unzip it, and store its contents in a folder
called `UCI HAR Dataset`. Else it will continue with the next step.

## Reading data

Both test and trained data sets are read. Each one consists on three files of data,
an `X` file with measurements, a `subject` file with id information, and a `y` file
which stores data associated with labels. These labels have an actual dictionary,
which is stored in `activity_labels.txt`. The name of the measurements reported in
`X` is available in `features.txt`.

Both datasets are loaded and merged. The names of the data columns are also collected
and properly set in a new database called `mdata`.

_If you want more information about the database, there are two files for further
explanations: `features_info.txt` and `README.txt`._

## Analysis

Not all data is needed from `mdata`. Only columns that hold a mean or standard
deviation measurement are preserved. Here, it is important to state that the base
contains some additional columns with `frequency` and `angle` information that also
has the `mean` or `std` tags. These are left out of the final database.

Then, the activity identifiers from `activity_labels.txt` were replaced in the data.
Once this was performed, the column names were corrected such that there were
no parenthesis `()` or hyphens `-` in the variable names.

## Tidying data

Finally, the data was grouped by subject and activity, and the mean was computed
for every measurement. This was then stored as a new tidy dataset called
`tidy_average.txt`.


## Output file

The output file, `tidy_average.txt`, does not have the names of its columns in it
(by request of the assignment). The corresponding names, besides the `id` and
`activity_labels`, are the ones described above from `features.txt` which were
processed. For completeness, I include a list of them:

* `tBodyAcc_mean_X`
* `tBodyAcc_mean_Y`
* `tBodyAcc_mean_Z`
* `tGravityAcc_mean_X`
* `tGravityAcc_mean_Y`
* `tGravityAcc_mean_Z`
* `tBodyAccJerk_mean_X`
* `tBodyAccJerk_mean_Y`
* `tBodyAccJerk_mean_Z`
* `tBodyGyro_mean_X`
* `tBodyGyro_mean_Y`
* `tBodyGyro_mean_Z`
* `tBodyGyroJerk_mean_X`
* `tBodyGyroJerk_mean_Y`
* `tBodyGyroJerk_mean_Z`
* `tBodyAccMag_mean`
* `tGravityAccMag_mean`
* `tBodyAccJerkMag_mean`
* `tBodyGyroMag_mean`
* `tBodyGyroJerkMag_mean`
* `fBodyAcc_mean_X`
* `fBodyAcc_mean_Y`
* `fBodyAcc_mean_Z`
* `fBodyAccJerk_mean_X`
* `fBodyAccJerk_mean_Y`
* `fBodyAccJerk_mean_Z`
* `fBodyGyro_mean_X`
* `fBodyGyro_mean_Y`
* `fBodyGyro_mean_Z`
* `fBodyAccMag_mean`
* `fBodyAccJerkMag_mean`
* `fBodyGyroMag_mean`
* `fBodyGyroJerkMag_mean`
* `tBodyAcc_std_X`
* `tBodyAcc_std_Y`
* `tBodyAcc_std_Z`
* `tGravityAcc_std_X`
* `tGravityAcc_std_Y`
* `tGravityAcc_std_Z`
* `tBodyAccJerk_std_X`
* `tBodyAccJerk_std_Y`
* `tBodyAccJerk_std_Z`
* `tBodyGyro_std_X`
* `tBodyGyro_std_Y`
* `tBodyGyro_std_Z`
* `tBodyGyroJerk_std_X`
* `tBodyGyroJerk_std_Y`
* `tBodyGyroJerk_std_Z`
* `tBodyAccMag_std`
* `tGravityAccMag_std`
* `tBodyAccJerkMag_std`
* `tBodyGyroMag_std`
* `tBodyGyroJerkMag_std`
* `fBodyAcc_std_X`
* `fBodyAcc_std_Y`
* `fBodyAcc_std_Z`
* `fBodyAccJerk_std_X`
* `fBodyAccJerk_std_Y`
* `fBodyAccJerk_std_Z`
* `fBodyGyro_std_X`
* `fBodyGyro_std_Y`
* `fBodyGyro_std_Z`
* `fBodyAccMag_std`
* `fBodyAccJerkMag_std`
* `fBodyGyroMag_std`
* `fBodyGyroJerkMag_std`
