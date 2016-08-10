# CleanDataAssignment
Assignment for Coursework

## Raw Files
You need these files in your working directory:

*  X_test.txt  - part 1 of the data (sensor readings)
*  X_train.txt - part 2 of the data (sensor readings)
*  y_test.txt - part 1 of the activities associated with the data
*  y_train.txt - part 2 of the activities associated with the data
*  subject_test.txt - part 1 of the subjects associated with the data
* subject_train.txt - part 2 of the activites associated with the data
*   activity_labels.txt - a glossary lookup of the activities' names
*   features.txt - the column names of the X data


You can then run **run\_analysis.R** which will create a **tidy\_data.txt** in your working directory.

## What run\_analysis.R does
1.  loads and merges the X data
2. loads and merges the y activities data
3. loads and merges the subjects data
4. loads and amend column names
5. loads activity labels
6. attaches column names to X data
6. selects only columns with "mean" or "std" from the X data and merge with activites and subject data
7. cleans up column names
8. groups results by subject/activity
9. calculates averages of all readings by subject/activity
10.  writes results to a file called **tidy\_data.txt**


A list of columns in the output is in **Codebook.md**
