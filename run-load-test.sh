#!/bin/bash

echo $pwd
./node_modules/artillery/bin/artillery run -e $ARTILLERY_ENVIRONMENT -o /tmp/$REPORT_FILENAME

# $fileBaseName = "$(basename -- $REPORT_FILENAME)"
# if ($RESULTS_FILE_SHARE){
#     reportFileOnFileShare = $RESULTS_FILE_SHARE/$fileBaseName
#     ./node_modules/artillery/bin/artillery report -o $reportFileOnFileShare
# }
 
exit 1