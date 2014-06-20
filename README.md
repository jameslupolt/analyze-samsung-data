# README for Run_analysis.R 

```Run_analysis.R``` creates a 'tidy' summary of a dataset collected from the accelerometers from the Samsung Galaxy S smartphone during experiments.

The purpose of this is to create a version of the dataset that is more readily understood and therefore quicker and easier to work with.

A full description of the source data is available at the site where the data was obtained: 

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

The original source data is here: 

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

## Details

```Run_analysis.R``` joins the following tables from the original dataset together:

**Training Dataset**  
train/y_train.txt  
train/X_train.txt  
subject_train.txt  

**Test Dataset**  
test/y_test.txt  
test/X_test.txt  
test/subject_test.txt  

The training and test datasets are merged together.

The following tables are used as sources of column names:

features.txt  
activity_labels.txt  

Column names are sanitized by removing punctuation marks so that they don’t have to be escaped in R code.

For each measurement, only columns showing a standard deviation or mean are retained. 

These are then averaged for each activity for each subject.

The tidy table is written to the file activity_data_tidy.txt.

This can be read into R as follows:

```# a <- read.table(file = "dataproj/activity_data_tidy.txt", sep = ",", header=T, stringsAsFactors=F)```

For more specific details about the script, see the comments and code in the script.

For descriptions of variables and the transformation process, please see the codebook.