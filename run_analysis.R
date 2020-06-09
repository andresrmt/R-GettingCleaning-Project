# Check if data is available
if( !file.exists("./UCI HAR Dataset") ){
  source("downloader.R")
} else {
  print("Dataset is available in the local folder.")
}

# Import the dplyr library
library(dplyr)


# *** Load data ***

## Test dataset
x_t <- read.table("./UCI HAR Dataset/test/X_test.txt")          # X test
y_t <- read.table("./UCI HAR Dataset/test/y_test.txt")          # test labels
s_t <- read.table("./UCI HAR Dataset/test/subject_test.txt")    # test subjects

## Train dataset
x_e <- read.table("./UCI HAR Dataset/train/X_train.txt")        # X train
y_e <- read.table("./UCI HAR Dataset/train/y_train.txt")        # train labels
s_e <- read.table("./UCI HAR Dataset/train/subject_train.txt")  # train subjects

## Names of columns
nom <- read.table("UCI HAR Dataset/features.txt")
nom <- c("id", "activity_labels", nom[,2])

## Names of activity labels
labls <- read.table("UCI HAR Dataset/activity_labels.txt")


# *** Merge datasets ***

## Merge test dataset
test <- data.frame(s_t, y_t, x_t)

## Merge train dataset
train <- data.frame(s_e, y_e, x_e)

## Combine the training and test running datasets
mdata <- bind_rows(test,train)

## Remove data no longer needed in memory
rm(x_t,x_e, y_t,y_e, s_t,s_e, test, train)

## Add names to combined dataset
colnames(mdata) <- nom


# *** Select means and std ***
mstd <- mdata %>%
  select(id, activity_labels,
         contains(c("mean","std")), -contains(c("angle","freq")) )

# *** Use descriptive activity names to name the activities in the data set ***
mstd <- mstd %>%
  mutate( activity_labels = labls[match(activity_labels, labls[,1] ), 'V2'] )


# *** Relabel data names ****
## * Take parenthesis off
## * Change hyphens to underscores
## * There are some variables with "BodyBody" repeated

colnames(mstd) <- gsub("BodyBody","Body",
                       gsub("-", "_",
                            gsub("\\(\\)", "", colnames(mstd)) ) )


# *** New dataset: Average of each variable for each activity and each subject ***

tidy_average <- mstd %>%
  group_by(id, activity_labels) %>%
  summarise_each(mean)


# *** Store dataset *** #
write.table(tidy_average, file = "tidy_average.txt", row.name=FALSE)
