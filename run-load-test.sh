

artillery run -e $ARTILLERY_ENVIRONMENT -o /tmp/$REPORT_FILENAME

$fileBaseName = $(basename $REPORT_FILENAME)
if ($RESULTS_FILE_SHARE){
    reportFileOnFileShare = $($RESULTS_FILE_SHARE/$($fileBaseName))
    artillery report -o $reportFileOnFileShare
}
 

