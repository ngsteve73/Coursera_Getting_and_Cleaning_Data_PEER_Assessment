require(plyr)

# Setup directories and files
dataset_dir <- "UCI HAR Dataset"
activity_labels_file <- paste(dataset_dir,"activity_labels.txt", sep="/")
features_file <- paste(dataset_dir,"features.txt", sep="/")
dataset_train_dir <- paste(dataset_dir,"train", sep="/")
dataset_test_dir <- paste(dataset_dir,"test", sep="/")
subject_train_file <- paste(dataset_train_dir,"subject_train.txt", sep="/")
x_train_file <- paste(dataset_train_dir,"X_train.txt", sep="/")
y_train_file <- paste(dataset_train_dir,"y_train.txt", sep="/")
subject_test_file <- paste(dataset_test_dir,"subject_test.txt", sep="/")
x_test_file <- paste(dataset_test_dir,"X_test.txt", sep="/")
y_test_file <- paste(dataset_test_dir,"y_test.txt", sep="/")

# Load raw data
activity_labels <- read.table(activity_labels_file, col.names=c("ActivityID","Activity"))
features <- read.table(features_file, col.names=c("FeatureID","Feature"))
subject_train <- read.table(subject_train_file, col.names=c("SubjectID"))
x_train <- read.table(x_train_file, col.names=features$Feature, check.names = FALSE, colClasses="numeric")
y_train <- read.table(y_train_file, col.names=c("ActivityID"))
subject_test <- read.table(subject_test_file, col.names=c("SubjectID"))
x_test <- read.table(x_test_file, col.names=features$Feature, check.names = FALSE, colClasses="numeric")
y_test <- read.table(y_test_file, col.names=c("ActivityID"))

######################################################################
## 1. Merges the training and the test sets to create one data set. ##
######################################################################

train_table <- cbind(y_train,subject_train,x_train)
test_table <- cbind(y_test,subject_test,x_test)
merge_table <- rbind(train_table,test_table)

################################################################################################
## 2. Extracts only the measurements on the mean and standard deviation for each measurement. ##
################################################################################################
selectednames <- grepl("Activity|Subject|(std\\(\\)|mean\\(\\))", names(merge_table))
merge_mean_std_table<- merge_table[,selectednames]

###############################################################################
## 3. Uses descriptive activity names to name the activities in the data set ##
###############################################################################

merge_mean_std_table <- merge(activity_labels,merge_mean_std_table)[,-1]

###########################################################################
## 4. Appropriately labels the data set with descriptive variable names. ##
###########################################################################

# Save original names
old_names <- names(merge_mean_std_table)
# Remove parentheses
names(merge_mean_std_table) <- gsub('\\(|\\)|-',"",names(merge_mean_std_table), perl = TRUE)

# names(merge_mean_std_table) <- make.names(names(merge_mean_std_table))
# Make clearer names
names(merge_mean_std_table) <- gsub('Acc',"Acceleration",names(merge_mean_std_table))
names(merge_mean_std_table) <- gsub('GyroJerk',"AngularAcceleration",names(merge_mean_std_table))
names(merge_mean_std_table) <- gsub('Gyro',"AngularSpeed",names(merge_mean_std_table))
names(merge_mean_std_table) <- gsub('Mag',"Magnitude",names(merge_mean_std_table))
names(merge_mean_std_table) <- gsub('^t',"TimeDomain",names(merge_mean_std_table))
names(merge_mean_std_table) <- gsub('^f',"FrequencyDomain",names(merge_mean_std_table))
names(merge_mean_std_table) <- gsub('mean',"Mean",names(merge_mean_std_table))
names(merge_mean_std_table) <- gsub('std',"StandardDeviation",names(merge_mean_std_table))
names(merge_mean_std_table) <- gsub('Freq\\.',"Frequency",names(merge_mean_std_table))
names(merge_mean_std_table) <- gsub('Freq$',"Frequency",names(merge_mean_std_table))
names(merge_mean_std_table) <- gsub('BodyBody',"Body",names(merge_mean_std_table))

######################################################################################################
## 5. Creates a tidy data set with the average of each variable for each activity and each subject. ##
######################################################################################################

tidy_dataset <- ddply(merge_mean_std_table, .(SubjectID,Activity), numcolwise(mean))
write.table(tidy_dataset, file = "tidy_dataset.txt", row.names=FALSE)

# (Optional) Write old and new names to markdown file
# new_names <- names(merge_mean_std_table)
# old_len <- max(nchar(names(merge_table)))
# new_len <- max(nchar(new_names))
# format <- paste("| %-3s | %-",old_len,"s | %-",new_len,"s |", sep="")
# heading <- sprintf(format,"No.","OLD NAME","NEW NAME")
# separator <- paste("|:----|:",paste(rep("-",old_len),collapse=""),"-|:",paste(rep("-",new_len),collapse=""),"-|", sep="")
# body <- sprintf(format,seq(1,length(old_names)),old_names,new_names)
# excludednames <- names(merge_table[,!selectednames])
# body2 <- sprintf(format,seq(length(old_names)+1,length(old_names)+length(excludednames)),excludednames,rep("----------NOT SELECTED----------",length(excludednames)))
# write(c(heading,separator,body,body2),file="names.md")

# (Optional) Write old names, new names and description to markdown file names.md
# Will be copied manually to the CodeBook.md to describe each variable in the tidy data set

new_names <- names(merge_mean_std_table)
desc_names <- new_names
prefix <- rep("",length(new_names))
suffix <- rep("",length(new_names))
prefix[grepl("Mean",desc_names)] = "The mean of the "
desc_names <- gsub("Mean","",desc_names)
prefix[grepl("StandardDeviation",desc_names)] = "The standard deviation of the "
desc_names <- gsub("StandardDeviation","",desc_names)
suffix[grepl("X",desc_names)] = "along the X-axis "
desc_names <- gsub("X","",desc_names)
suffix[grepl("Y",desc_names)] = "along the Y-axis "
desc_names <- gsub("Y","",desc_names)
suffix[grepl("Z",desc_names)] = "along the Z-axis "
desc_names <- gsub("Z","",desc_names)
selected <- grepl("TimeDomain",desc_names)
suffix[selected] = paste(suffix[selected],"in the time domain ", sep="")
desc_names <- gsub("TimeDomain","",desc_names)
selected <- grepl("FrequencyDomain",desc_names)
suffix[selected] = paste(suffix[selected],"in the frequency domain ", sep="")
desc_names <- gsub("FrequencyDomain","",desc_names)
desc_names <- paste(prefix,desc_names,suffix)
desc_names <- gsub('Activity',"the activity performed by the person. WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING",desc_names)
desc_names <- gsub('SubjectID',"the subject ID of the person performing the task: 1 to 30",desc_names)
desc_names <- gsub("Body","body ",desc_names)
desc_names <- gsub("Acceleration","acceleration ",desc_names)
desc_names <- gsub("Gravity","gravity ",desc_names)
desc_names <- gsub("Jerk","jerk ",desc_names)
desc_names <- gsub("Angular","angular ",desc_names)
desc_names <- gsub("Speed","speed ",desc_names)
desc_names <- gsub("Magnitude","magnitude ",desc_names)
old_len <- max(nchar(names(merge_table)))
new_len <- max(nchar(new_names))
format <- paste("| %-3s | %-",old_len,"s | %-",new_len,"s | %s |", sep="")
heading <- sprintf(format,"No.","OLD NAME","NEW NAME", "DESCRIPTION")
separator <- paste("|:----|:",paste(rep("-",old_len),collapse=""),"-|:",paste(rep("-",new_len),collapse=""),"-|:-------------|", sep="")
body <- sprintf(format,seq(1,length(old_names)),old_names,new_names,desc_names)
excludednames <- names(merge_table[,!selectednames])
body2 <- sprintf(format,seq(length(old_names)+1,length(old_names)+length(excludednames)),excludednames,rep("----------NOT SELECTED----------",length(excludednames)),"|--------------|")
write(c(heading,separator,body,body2),file="names.md")
