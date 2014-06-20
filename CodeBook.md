#Codebook.MD

**The following section repeats what is stated in the codebook for the original dataset.**

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

tBodyAcc-XYZ  
tGravityAcc-XYZ  
tBodyAccJerk-XYZ  
tBodyGyro-XYZ  
tBodyGyroJerk-XYZ  
tBodyAccMag  
tGravityAccMag  
tBodyAccJerkMag  
tBodyGyroMag  
tBodyGyroJerkMag  
fBodyAcc-XYZ  
fBodyAccJerk-XYZ  
fBodyGyro-XYZ  
fBodyAccMag  
fBodyAccJerkMag  
fBodyGyroMag  
fBodyGyroJerkMag  

The set of variables that were estimated from these signals are: 

mean(): Mean value  
std(): Standard deviation  
mad(): Median absolute deviation   
max(): Largest value in array  
min(): Smallest value in array  
sma(): Signal magnitude area  
energy(): Energy measure. Sum of the squares divided by the number of values.  
iqr(): Interquartile range  
entropy(): Signal entropy  
arCoeff(): Autorregresion coefficients with Burg order equal to 4  
correlation(): correlation coefficient between two signals  
maxInds(): index of the frequency component with largest magnitude  
meanFreq(): Weighted average of the frequency components to obtain a mean frequency  
skewness(): skewness of the frequency domain signal  
kurtosis(): kurtosis of the frequency domain signal  
bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.  
angle(): Angle between two vectors.

Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:

gravityMean  
tBodyAccMean  
tBodyAccJerkMean  
tBodyGyroMean  
tBodyGyroJerkMean  


**In the tidy dataset, all of these variables have been discarded per the assignment requirements except for mean() and std(). The additional vectors that were obtained by averaging the signals in a signal window sample were also discarded since they are related to the angle() variable, which has been discarded.**

**The complete list of variables of each feature vector in the tidy dataset is as follows**:

subjectid            <— This is from the only column in the subject_test.txt and subject_train.txt in the original dataset  
activity_name        <— This is from the second column of the file activity_labels.txt in the original dataset  

**The remaining variables were named according to the values in features.txt and used to label the test and training data. Punctuation marks were removed from the variable/column names so that the user doesn’t have to deal with escaping characters.**

tBodyAccmeanX         
tBodyAccmeanY  
tBodyAccmeanZ  
tBodyAccstdX  
tBodyAccstdY  
tBodyAccstdZ  
tGravityAccmeanX  
tGravityAccmeanY  
tGravityAccmeanZ  
tGravityAccstdX  
tGravityAccstdY  
tGravityAccstdZ  
tBodyAccJerkmeanX  
tBodyAccJerkmeanY  
tBodyAccJerkmeanZ  
tBodyAccJerkstdX  
tBodyAccJerkstdY  
tBodyAccJerkstdZ  
tBodyGyromeanX  
tBodyGyromeanY  
tBodyGyromeanZ  
tBodyGyrostdX  
tBodyGyrostdY  
tBodyGyrostdZ  
tBodyGyroJerkmeanX  
tBodyGyroJerkmeanY  
tBodyGyroJerkmeanZ  
tBodyGyroJerkstdX  
tBodyGyroJerkstdY  
tBodyGyroJerkstdZ  
tBodyAccMagmean  
tBodyAccMagstd  
tGravityAccMagmean  
tGravityAccMagstd  
tBodyAccJerkMagmean  
tBodyAccJerkMagstd  
tBodyGyroMagmean  
tBodyGyroMagstd  
tBodyGyroJerkMagmean  
tBodyGyroJerkMagstd  
fBodyAccmeanX  
fBodyAccmeanY  
fBodyAccmeanZ  
fBodyAccstdX  
fBodyAccstdY  
fBodyAccstdZ  
fBodyAccJerkmeanX  
fBodyAccJerkmeanY  
fBodyAccJerkmeanZ  
fBodyAccJerkstdX  
fBodyAccJerkstdY  
fBodyAccJerkstdZ  
fBodyGyromeanX  
fBodyGyromeanY  
fBodyGyromeanZ  
fBodyGyrostdX  
fBodyGyrostdY  
fBodyGyrostdZ  
fBodyAccMagmean  
fBodyAccMagstd  
fBodyBodyAccJerkMagmean  
fBodyBodyAccJerkMagstd  
fBodyBodyGyroMagmean  
fBodyBodyGyroMagstd  
fBodyBodyGyroJerkMagmean  
fBodyBodyGyroJerkMagstd  

The analysis script, run_analysis.R, is further documented with comments.
