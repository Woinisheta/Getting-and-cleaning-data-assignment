if(!file.exists("./data")){dir.create("./data")}
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileUrl,destfile="./data/Dataset.zip")

# in order to Unzip dataSet
unzip(zipfile="./data/Dataset.zip",exdir="./data")

# Reading trainings tables:
x_train <- read.table("./data/UCI HAR Dataset/train/X_train.txt")
y_train <- read.table("./data/UCI HAR Dataset/train/y_train.txt")
subject_train <- read.table("./data/UCI HAR Dataset/train/subject_train.txt")

# Reading testing tables:
x_test <- read.table("./data/UCI HAR Dataset/test/X_test.txt")
y_test <- read.table("./data/UCI HAR Dataset/test/y_test.txt")
subject_test <- read.table("./data/UCI HAR Dataset/test/subject_test.txt")

# Reading feature vector:
features <- read.table('./data/UCI HAR Dataset/features.txt')

# Reading activity labels:
activityLabels = read.table('./data/UCI HAR Dataset/activity_labels.txt')

head (x_test)
head (x_train)
head (y_test)
head (y_train)
names (activityLabels)
names (features)
names (subject_test)
names (subject_train)
View(activityLabels)

# giving variable/column names
colnames(x_train) <- features[,2] 
colnames(y_train) <-"activityId"
colnames(subject_train) <- "subjectId"

colnames(x_test) <- features[,2] 
colnames(y_test) <- "activityId"
colnames(subject_test) <- "subjectId"

colnames(activityLabels) <- c('activityId','activityType')

# merging the files together
#first train files all have similar observations
mrg_train <- cbind(y_train, subject_train, x_train)
#test files has also 2947 observations
mrg_test <- cbind(y_test, subject_test, x_test)
setAllInOne <- rbind(mrg_train, mrg_test)
View(setAllInOne)

# Extracts only the measurements on the mean and standard deviation for each measurement
# first reading columnames
colNames <- colnames(setAllInOne)
colNames

# Create vector for defining ID, mean and SD
mean_and_std <- (grepl("activityId" , colNames) | 
                   grepl("subjectId" , colNames) | 
                   grepl("mean.." , colNames) | 
                   grepl("std.." , colNames) 
)

mean_and_std

#making subsets

setForMeanAndStd <- setAllInOne[ , mean_and_std == TRUE]

#  Uses descriptive activity names to name the activities in the data set

setWithActivityNames <- merge(setForMeanAndStd, activityLabels,
                              by='activityId',
                              all.x=TRUE)

View (setWithActivityNames)

# Appropriately labels the data set with descriptive variable names.

# get column names
setWithActivityNamesCols <- colnames(setWithActivityNames)

# remove special characters
setWithActivityNamesCols <- gsub("[\\(\\)-]", "", setWithActivityNamesCols)

# expand abbreviations and clean up names
setWithActivityNamesCols <- gsub("^f", "frequencyDomain", setWithActivityNamesCols)
setWithActivityNamesCols <- gsub("^t", "timeDomain", setWithActivityNamesCols)
setWithActivityNamesCols <- gsub("Acc", "Accelerometer", setWithActivityNamesCols)
setWithActivityNamesCols <- gsub("Gyro", "Gyroscope", setWithActivityNamesCols)
setWithActivityNamesCols <- gsub("Mag", "Magnitude", setWithActivityNamesCols)
setWithActivityNamesCols <- gsub("Freq", "Frequency", setWithActivityNamesCols)
setWithActivityNamesCols <- gsub("mean", "Mean", setWithActivityNamesCols)
setWithActivityNamesCols <- gsub("std", "StandardDeviation", setWithActivityNamesCols)
setWithActivityNamesCols <- gsub("BodyBody", "Body", setWithActivityNamesCols)

# use new labels as column names
colnames(setWithActivityNames) <- setWithActivityNamesCols

View (setWithActivityNames)
names (setWithActivityNames)

# creates a second, independent tidy data set 
# with the average of each variable for each activity and each subject
secTidySet <- aggregate(. ~subjectId + activityId, setWithActivityNames, mean)
secTidySet <- secTidySet[order(secTidySet$subjectId, secTidySet$activityId),]

# Writing data set in txt file
write.table(secTidySet, "secTidySet.txt", row.name=FALSE)










