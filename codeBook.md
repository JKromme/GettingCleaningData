CODEBOOK
Coursera: Getting and Cleaning Data

Author: Jeroen Kromme
Date: 11-08-2014

Input files:

```
## -  cleanDataset.txt 
## -  codeBook.html 
## -  codeBook.md 
## -  codeBook.rmd 
## -  data 
## -  dataset_tidy.csv 
## -  GaCD Assignment.Rproj 
## -  getdata_projectfiles_UCI HAR Dataset.zip 
## -  Human+Activity+Recognition+Using+Smartphones.htm 
## -  readme.html 
## -  readme.md 
## -  readme.rmd 
## -  run_analysis.R
```

```
## -  activity_labels.txt 
## -  features.txt 
## -  features_info.txt 
## -  README.txt 
## -  test 
## -  train
```

```
## -  Inertial Signals 
## -  subject_train.txt 
## -  X_train.txt 
## -  y_train.txt
```

```
## -  Inertial Signals 
## -  subject_test.txt 
## -  X_test.txt 
## -  y_test.txt
```

Analysis script:
- run_analysis.R

Goal of script:
Tidy up data so it is unified workable dataset on which analyses can easily performed.

Tidy data has:
- each variable in a seperate column
- each observation in a seperate row
- there should be one table for each kind of variable
- include variable names
- variable names should be readable
- general data should be saved in one file per table

Actions in script:
- Load Packages
- Load data
- Naming variables (bulletpoint 4)
- Union datasets (bulletpoint 1)
- Only means and standard deviations (bulletpoint 2)
- Merge activity names to increase readibilty (bulletpoint 3)
- Join xdata and ydata 
- Tidy-up names
- Mean of each activity per subject (bulletpoint 5)
- Write files

Output files:
- cleanDataset.csv
- dataset_tidy.csv

Variables in cleanDataset:

```
## Warning: cannot open file 'cleanDataset.csv': No such file or directory
```

```
## Error: cannot open the connection
```

```
## Error: object 'dataset' not found
```


