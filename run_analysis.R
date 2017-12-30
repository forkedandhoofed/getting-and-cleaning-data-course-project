### Make sure the original datasets are present in your workspace as "UCI HAR Dataset"

# Preamble ----------------------------------------------------------------
library(reshape2)


# Entering Paths to Relevant Files ----------------------------------------


testXpath <- "./UCI HAR Dataset/test/X_test.txt"
testYpath <- "./UCI HAR Dataset/test/y_test.txt"
subjectTestPath <- "./UCI HAR Dataset/test/subject_test.txt"

trainXpath <- "./UCI HAR Dataset/train/X_train.txt"
trainYpath <- "./UCI HAR Dataset/train/y_train.txt"
subjectTrainPath <- "./UCI HAR Dataset/train/subject_train.txt"

featuresPath <- "./UCI HAR Dataset/features.txt"
activitiesPath <- "./UCI HAR Dataset/activity_labels.txt"



# Reading Relevant Files into R -------------------------------------------



testX <- read.table(testXpath, header = FALSE)
testY <- read.table(testYpath, header = FALSE)
subjectTest <- read.table(subjectTestPath, header = FALSE)

trainX <- read.table(trainXpath, header = FALSE)
trainY <- read.table(trainYpath, header = FALSE)
subjectTrain <- read.table(subjectTrainPath, header = FALSE)

features <- read.table(featuresPath)
features <- features[, 2]

activityLabel <- read.table(activitiesPath)


# Merging Dataset & Selecting Variables -----------------------------------

subject <- append(subjectTest[[1]], subjectTrain[[1]])
activity <- factor(append(testY[[1]], trainY[[1]]), levels = activityLabel[, 1], labels = activityLabel[, 2])

mergedData <- cbind(as.factor(subject), activity, rbind(testX, trainX))
colnames(mergedData) <- c("subject", "activity", as.character(features))

cleanData <- mergedData[, c(1, 2, 2 + grep(".*mean.*|.*std.*", as.character(features)))]
write.table(cleanData, "./tidydata.txt")


# Create New, Independent Table -------------------------------------------

meltTidyData <- melt(cleanData, id = colnames(cleanData)[1:2], measure.vars = colnames(cleanData)[3:length(colnames(cleanData))])

meanTidyData <- dcast(meltTidyData, subject + activity ~ variable, mean)
colnames(meanTidyData) <- c(colnames(meanTidyData)[1:2], paste0("mean-", colnames(meanTidyData)[3:dim(meanTidyData)[2]]))

write.table(meanTidyData, "./meantidydata.txt", row.names = FALSE)
