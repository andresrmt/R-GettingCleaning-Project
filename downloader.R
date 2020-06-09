# This script downloads the accelerometer data generated from an experiment with
# Samsung Galaxy S smartphones. 

# First, we check if the dataset is already available in the local folder
if( !file.exists("./UCI HAR Dataset") ){
  # The dataset is encapsulated in a zip file, the `downloader` package will be used to
  # download it. First we check if the package is available, else it will be installed.
  if("downloader" %in% rownames(installed.packages()) == FALSE) {
    install.packages("downloader")
  }
  library(downloader)
  # Data is downloaded with the package
  url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
  download(url, dest="UCI HAR Dataset.zip", mode="wb") 
  # Finally, the dataset is unziped in the local folder
  unzip("UCI HAR Dataset.zip", exdir = "./")
} else {
  print("Data already in local folder.")
}