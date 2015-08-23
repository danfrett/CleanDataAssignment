library(dplyr)

run_analysis <-function(){
      ## get test data
      file_name <- "X_test.txt"
      test_data <- read.table(file.path(getwd(), file_name), strip.white = TRUE, stringsAsFactors = FALSE)
      
      ## add training data
      file_name <- "X_train.txt"
      test_data <- rbind(read.table(file.path(getwd(), file_name), strip.white = TRUE, stringsAsFactors = FALSE))
      
      ## get test activities
      file_name <- "y_test.txt"
      test_activity <- read.table(file.path(getwd(), file_name), strip.white = TRUE, stringsAsFactors = FALSE)
      
      #add training activities and rename to get a name to merge on
      file_name <- "y_train.txt"
      test_activity <- rbind(read.table(file.path(getwd(), file_name), strip.white = TRUE, stringsAsFactors = FALSE))
      test_activity <- rename(test_activity, activity_id = V1)
      
      #get test subjects
      file_name <- "subject_test.txt"
      test_subjects <- read.table(file.path(getwd(), file_name), strip.white = TRUE, stringsAsFactors = FALSE)
      
      #add training subjects and change name to something meaningful
      file_name <- "subject_train.txt"
      test_subjects <- rbind(read.table(file.path(getwd(), file_name), strip.white = TRUE, stringsAsFactors = FALSE))
      test_subjects <- rename(test_subjects, subject_id = V1)
      
      #get column names and created piped concatonation to not have duplicates
      file_name <- "features.txt"
      col_names <- read.table(file.path(getwd(), file_name), strip.white = TRUE, stringsAsFactors = FALSE)
      name_vector <- paste(col_names$V2, col_names$V1, sep = "|")
      
      ## get activity names and rename to make legible and have something to merge on
      file_name <- "activity_labels.txt"
      activity_lbl <- read.table(file.path(getwd(), file_name), strip.white = TRUE, stringsAsFactors = FALSE)
      activity_lbl <- rename(activity_lbl, activity_id = V1)
      activity_lbl <- rename(activity_lbl, Activity = V2)
      
      ## apply the names to the data frame
      colnames(test_data) <- name_vector
      
      ## get the columns for mean and std and add subjects, activity_ids and get activity names
      big_data <- cbind(select(test_data, (contains("mean()"))),select(test_data, (contains("std()"))))
      big_data <- cbind(big_data, test_subjects)
      big_data <- cbind(big_data, test_activity)
      big_data <-merge(big_data, activity_lbl)
      
      ## clean up names as there are no more duplicates
      name_vector <- unlist(lapply(strsplit(names(big_data),"|", fixed = TRUE), function(x) x[1]))
      colnames(big_data) <- name_vector
      
      ## write the table as a tab delimmited txt file
      write.table(big_data, file.path(getwd(),"tidy_data.txt"), row.names = FALSE, sep = "\t")
      
}













getDT <- function(file_name){
      filepath <- file.path(getwd(), file_name)
      return(read.table(filepath, strip.white = TRUE, stringsAsFactors = FALSE))
}