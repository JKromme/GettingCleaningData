<!DOCTYPE html>
<!-- saved from url=(0014)about:internet -->
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<meta http-equiv="x-ua-compatible" content="IE=9" >

<title></title>

<style type="text/css">
body, td {
   font-family: sans-serif;
   background-color: white;
   font-size: 12px;
   margin: 8px;
}

tt, code, pre {
   font-family: 'DejaVu Sans Mono', 'Droid Sans Mono', 'Lucida Console', Consolas, Monaco, monospace;
}

h1 { 
   font-size:2.2em; 
}

h2 { 
   font-size:1.8em; 
}

h3 { 
   font-size:1.4em; 
}

h4 { 
   font-size:1.0em; 
}

h5 { 
   font-size:0.9em; 
}

h6 { 
   font-size:0.8em; 
}

a:visited {
   color: rgb(50%, 0%, 50%);
}

pre {	
   margin-top: 0;
   max-width: 95%;
   border: 1px solid #ccc;
   white-space: pre-wrap;
}

pre code {
   display: block; padding: 0.5em;
}

code.r, code.cpp {
   background-color: #F8F8F8;
}

table, td, th {
  border: none;
}

blockquote {
   color:#666666;
   margin:0;
   padding-left: 1em;
   border-left: 0.5em #EEE solid;
}

hr {
   height: 0px;
   border-bottom: none;
   border-top-width: thin;
   border-top-style: dotted;
   border-top-color: #999999;
}

@media print {
   * { 
      background: transparent !important; 
      color: black !important; 
      filter:none !important; 
      -ms-filter: none !important; 
   }

   body { 
      font-size:12pt; 
      max-width:100%; 
   }
       
   a, a:visited { 
      text-decoration: underline; 
   }

   hr { 
      visibility: hidden;
      page-break-before: always;
   }

   pre, blockquote { 
      padding-right: 1em; 
      page-break-inside: avoid; 
   }

   tr, img { 
      page-break-inside: avoid; 
   }

   img { 
      max-width: 100% !important; 
   }

   @page :left { 
      margin: 15mm 20mm 15mm 10mm; 
   }
     
   @page :right { 
      margin: 15mm 10mm 15mm 20mm; 
   }

   p, h2, h3 { 
      orphans: 3; widows: 3; 
   }

   h2, h3 { 
      page-break-after: avoid; 
   }
}

</style>





</head>

<body>
<p>CODEBOOK
Coursera: Getting and Cleaning Data</p>

<p>Author: Jeroen Kromme
Date: 11-08-2014</p>

<p>Input files:</p>

<pre><code>## -  cleanDataset.txt 
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
</code></pre>

<pre><code>## -  activity_labels.txt 
## -  features.txt 
## -  features_info.txt 
## -  README.txt 
## -  test 
## -  train
</code></pre>

<pre><code>## -  Inertial Signals 
## -  subject_train.txt 
## -  X_train.txt 
## -  y_train.txt
</code></pre>

<pre><code>## -  Inertial Signals 
## -  subject_test.txt 
## -  X_test.txt 
## -  y_test.txt
</code></pre>

<p>Analysis script:</p>

<ul>
<li>run_analysis.R</li>
</ul>

<p>Goal of script:
Tidy up data so it is unified workable dataset on which analyses can easily performed.</p>

<p>Tidy data has:</p>

<ul>
<li>each variable in a seperate column</li>
<li>each observation in a seperate row</li>
<li>there should be one table for each kind of variable</li>
<li>include variable names</li>
<li>variable names should be readable</li>
<li>general data should be saved in one file per table</li>
</ul>

<p>Actions in script:</p>

<ul>
<li>Load Packages</li>
<li>Load data</li>
<li>Naming variables (bulletpoint 4)</li>
<li>Union datasets (bulletpoint 1)</li>
<li>Only means and standard deviations (bulletpoint 2)</li>
<li>Merge activity names to increase readibilty (bulletpoint 3)</li>
<li>Join xdata and ydata </li>
<li>Tidy-up names</li>
<li>Mean of each activity per subject (bulletpoint 5)</li>
<li>Write files</li>
</ul>

<p>Output files:</p>

<ul>
<li>cleanDataset.csv</li>
<li>dataset_tidy.csv</li>
</ul>

<p>Variables in cleanDataset:</p>

<pre><code>## 
## -  subjectId : id of subject , type = character
## -  activityName : name of activity , type = character
## -  timeBodyAccAvg.X : mean of body of acceleration of X , type = character
## -  timeBodyAccAvg.Y : mean of body of acceleration of Y , type = character
## -  timeBodyAccAvg.Z : mean of body of acceleration of Z , type = character
## -  timeBodyAccStd.X : Standard deviation of body of acceleration of X , type = character
## -  timeBodyAccStd.Y : Standard deviation of body of acceleration of Y , type = character
## -  timeBodyAccStd.Z : Standard deviation of body of acceleration of Z , type = character
## -  timeGravityAccAvg.X : mean of gravity ofacceleration of X , type = character
## -  timeGravityAccAvg.Y : mean of gravity ofacceleration of Y , type = character
## -  timeGravityAccAvg.Z : mean of gravity ofacceleration of Z , type = character
## -  timeGravityAccStd.X : Standard deviation of gravity ofacceleration of X , type = character
## -  timeGravityAccStd.Y : Standard deviation of gravity ofacceleration of Y , type = character
## -  timeGravityAccStd.Z : Standard deviation of gravity ofacceleration of Z , type = character
## -  timeBodyAccJerkAvg.X : mean of body of acceleration jerk of X , type = character
## -  timeBodyAccJerkAvg.Y : mean of body of acceleration jerk of Y , type = character
## -  timeBodyAccJerkAvg.Z : mean of body of acceleration jerk of Z , type = character
## -  timeBodyAccJerkStd.X : Standard deviation of body of acceleration jerk of X , type = character
## -  timeBodyAccJerkStd.Y : Standard deviation of body of acceleration jerk of Y , type = character
## -  timeBodyAccJerkStd.Z : Standard deviation of body of acceleration jerk of Z , type = character
## -  timeBodyGyroAvg.X : mean of body of gyro of X , type = character
## -  timeBodyGyroAvg.Y : mean of body of gyro of Y , type = character
## -  timeBodyGyroAvg.Z : mean of body of gyro of Z , type = character
## -  timeBodyGyroStd.X : Standard deviation of body of gyro of X , type = character
## -  timeBodyGyroStd.Y : Standard deviation of body of gyro of Y , type = character
## -  timeBodyGyroStd.Z : Standard deviation of body of gyro of Z , type = character
## -  timeBodyGyroJerkAvg.X : mean of body of gyro jerk of X , type = character
## -  timeBodyGyroJerkAvg.Y : mean of body of gyro jerk of Y , type = character
## -  timeBodyGyroJerkAvg.Z : mean of body of gyro jerk of Z , type = character
## -  timeBodyGyroJerkStd.X : Standard deviation of body of gyro jerk of X , type = character
## -  timeBodyGyroJerkStd.Y : Standard deviation of body of gyro jerk of Y , type = character
## -  timeBodyGyroJerkStd.Z : Standard deviation of body of gyro jerk of Z , type = character
## -  timeBodyAccMagAvg : mean of body of magnitude of acceleration  , type = character
## -  timeBodyAccMagStd : Standard deviation of body of magnitude of acceleration  , type = character
## -  timeGravityAccMagAvg : mean of gravity ofmagnitude of acceleration  , type = character
## -  timeGravityAccMagStd : Standard deviation of gravity ofmagnitude of acceleration  , type = character
## -  timeBodyAccJerkMagAvg : mean of body of magnitude of acceleration jerk  , type = character
## -  timeBodyAccJerkMagStd : Standard deviation of body of magnitude of acceleration jerk  , type = character
## -  timeBodyGyroMagAvg : mean of body of magnitude of gyro  , type = character
## -  timeBodyGyroMagStd : Standard deviation of body of magnitude of gyro  , type = character
## -  timeBodyGyroJerkMagAvg : mean of body of magnitude of gyro jerk  , type = character
## -  timeBodyGyroJerkMagStd : Standard deviation of body of magnitude of gyro jerk  , type = character
## -  frequencyBodyAccAvg.X : mean of body of acceleration of X , type = character
## -  frequencyBodyAccAvg.Y : mean of body of acceleration of Y , type = character
## -  frequencyBodyAccAvg.Z : mean of body of acceleration of Z , type = character
## -  frequencyBodyAccStd.X : Standard deviation of body of acceleration of X , type = character
## -  frequencyBodyAccStd.Y : Standard deviation of body of acceleration of Y , type = character
## -  frequencyBodyAccStd.Z : Standard deviation of body of acceleration of Z , type = character
## -  frequencyBodyAccJerkAvg.X : mean of body of acceleration jerk of X , type = character
## -  frequencyBodyAccJerkAvg.Y : mean of body of acceleration jerk of Y , type = character
## -  frequencyBodyAccJerkAvg.Z : mean of body of acceleration jerk of Z , type = character
## -  frequencyBodyAccJerkStd.X : Standard deviation of body of acceleration jerk of X , type = character
## -  frequencyBodyAccJerkStd.Y : Standard deviation of body of acceleration jerk of Y , type = character
## -  frequencyBodyAccJerkStd.Z : Standard deviation of body of acceleration jerk of Z , type = character
## -  frequencyBodyGyroAvg.X : mean of body of gyro of X , type = character
## -  frequencyBodyGyroAvg.Y : mean of body of gyro of Y , type = character
## -  frequencyBodyGyroAvg.Z : mean of body of gyro of Z , type = character
## -  frequencyBodyGyroStd.X : Standard deviation of body of gyro of X , type = character
## -  frequencyBodyGyroStd.Y : Standard deviation of body of gyro of Y , type = character
## -  frequencyBodyGyroStd.Z : Standard deviation of body of gyro of Z , type = character
## -  frequencyBodyAccMagAvg : mean of body of magnitude of acceleration  , type = character
## -  frequencyBodyAccMagStd : Standard deviation of body of magnitude of acceleration  , type = character
## -  frequencyBodyBodyAccJerkMagAvg : mean of body of magnitude of acceleration jerk  , type = character
## -  frequencyBodyBodyAccJerkMagStd : Standard deviation of body of magnitude of acceleration jerk  , type = character
## -  frequencyBodyBodyGyroMagAvg : mean of body of magnitude of gyro  , type = character
## -  frequencyBodyBodyGyroMagStd : Standard deviation of body of magnitude of gyro  , type = character
## -  frequencyBodyBodyGyroJerkMagAvg : mean of body of magnitude of gyro jerk  , type = character
## -  frequencyBodyBodyGyroJerkMagStd : Standard deviation of body of magnitude of gyro jerk  , type = character
</code></pre>

</body>

</html>

