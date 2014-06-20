# IMPORTANT: Prior to running this script, set your working directory to the directory containing the unzipped Samsung data
# e.g. setwd('~/dataproj')

# Samsung data can be downloaded here:  https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

#Read data common to both train and test
features <- read.table("features.txt", header = F, stringsAsFactors = F)
activity_labels <- read.table("activity_labels.txt", header = F, stringsAsFactors = F)

#Read training data
y_train <- read.table("train/y_train.txt", header = F, stringsAsFactors = F)
X_train <- read.table("train/X_train.txt", header = F, stringsAsFactors = F)
subject_train <- read.table("train/subject_train.txt", header = F, stringsAsFactors = F)

#Set column names
colnames(activity_labels) <- c('activityid', 'activity_name')
colnames(y_train) <- c('testid')

#For features, sanitize colnames first by removing characters that require escaping in R object names
group <- make.names(features[['V2']])
#Also remove periods. Need to escape . so that it doesn't match the 'any single character' regex
group <- gsub("\\.","",group)
colnames(X_train) <- group
colnames(subject_train) <- c('subjectid')

#Join data frames
x_y_train <- merge(y_train, X_train, by=0)

#Convert the new $Row.names column to numeric so that we can use it in join comparisons
x_y_train$Row.names = as.numeric(x_y_train$Row.names)
x_y_subject_train <- merge(x_y_train, subject_train, by.x="Row.names",by.y=0)

#Now repeat the same process on test data
#Read test data
y_test <- read.table("test/y_test.txt", header = F, stringsAsFactors = F)
X_test <- read.table("test/X_test.txt", header = F, stringsAsFactors = F)
subject_test <- read.table("test/subject_test.txt", header = F, stringsAsFactors = F)

#Set column names
colnames(y_test) <- c('testid')
colnames(subject_test) <- c('subjectid')
#For features, sanitize colnames by removing characters that require escaping in R object names. Re-use colname vector made above.
colnames(X_test) <- group

#Join data frames
x_y_test <- merge(y_test, X_test, by=0)

#Convert the new $Row.names column to numeric so that we can use it in join comparisons
x_y_test$Row.names = as.numeric(x_y_test$Row.names)
x_y_subject_test <- merge(x_y_test, subject_test, by.x="Row.names",by.y=0)

#Combine test and training into one dataset
activity_data <- rbind(x_y_subject_train, x_y_subject_test)

#Join to activity_labels
activity_data <- merge(activity_data, activity_labels, by.x="testid", by.y="activityid")

#Project only the columns we are interested in here
activity_data <- activity_data[,c(grep('Row.names|activity_name|subjectid|std|mean$|mean.$',colnames(activity_data)))]

#Now build a tidy dataset -- aggregate subjectid, activityid by mean() for each type of measurement
activity_data_tidy <- aggregate(activity_data, by=list(subjectid,activity_name), FUN=mean)
# Discard unneeded columns: Row.names and original subjectid and activity_name (now NA due to the grouping)
activity_data_tidy <- activity_data_tidy[,c(1,2,4:69)]
# Label the grouped by columns
colnames(activity_data_tidy)[1:2] <- c('subjectid', 'activity_name')

# Write a table to a file
write.table(activity_data_tidy, file = "activity_data_tidy.txt", sep = ",", col.names = TRUE, row.names = FALSE)

# How to read back in:
#backin <- read.table(file = "activity_data_tidy.txt", sep = ",", header=T, stringsAsFactors=F)
# Test that this worked:
#backin[backin$activity_name == "WALKING" & backin$subjectid == 1,"fBodyGyrostdY"]
#[1] -0.03350816