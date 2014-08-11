# Coursera: Getting and Cleaning Data

# Author: Jeroen Kromme
# Date: 11-08-2014
# Load Packages
if (!require("plyr")) {install.packages("plyr")}
if (!require("reshape2")) {install.packages("reshape2")}

# List files
list.files(".")
list.files("./data")

# Load data
activity <- read.table('./data/activity_labels.txt')
names(activity) <-c('ID', 'activityName')
activity

features <- read.table('./data/features.txt')
names(features) <- c('ID', 'featureName')
head(features)

list.files("./data/train")
xtrain <- read.table('./data/train/X_train.txt')
ytrain <- read.table('./data/train/y_train.txt')
subject_train <- read.table('./data/train/subject_train.txt')

list.files("./data/test")
xtest <- read.table('./data/test/X_test.txt')
ytest <- read.table('./data/test/y_test.txt')
subject_test <- read.table('./data/test/subject_test.txt')

# Naming variables (bulletpoint 4)
names(xtrain) <- features$featureName
names(xtest) <- features$featureName
names(subject_train) <- 'subjectId'
names(subject_test) <- 'subjectId'

# Union datasets (bulletpoint 1)
xdata <- rbind(xtrain, xtest)
ydata <- rbind(ytrain, ytest)
subject <- rbind(subject_train, subject_test)

# Only means and standard deviations (bulletpoint 2)
meansAndSDs <- xdata[ , grep(".*mean\\(\\)|.*std\\(\\)", features$featureName)]

# Merge activity names to increase readibilty (bulletpoint 3)
ydata <- merge(ydata,activity, by.x='V1', by.y='ID', all =T)
ydata$V1 <- NULL

# Join xdata and ydata 
dataset <- cbind(subject, ydata, meansAndSDs)
head(dataset)


# Tidy-up names
dataset_names <- names(dataset)
dataset_names <- sub('-std\\(\\)', 'Std', dataset_names)
dataset_names <- sub('-mean\\(\\)', 'Avg', dataset_names)
dataset_names <- sub('tBody', 'timeBody', dataset_names)
dataset_names <- sub('fBody', 'frequencyBody', dataset_names)
dataset_names <- sub('tGravity', 'timeGravity', dataset_names)
dataset_names <- sub('fGravity', 'frequencyGravity', dataset_names)
names(dataset) <- dataset_names

# Mean of each activity per subject (bulletpoint 5)
dataset_melt <- melt(dataset, id.vars=c("subjectId", "activityName"), na.rm=TRUE)
dataset_tidy <- dcast(dataset_melt, subjectId + activityName ~ variable, mean)

# Write files
write.csv(dataset, 'cleanDataset.csv')
write.csv(dataset_tidy, 'dataset_tidy.csv')

