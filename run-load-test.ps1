#!/bin/bash

Write-Host "Current folder is $pwd"

./node_modules/artillery/bin/artillery run $env:ARTILLERYIO_FILE -e $env:ARTILLERY_ENVIRONMENT -o /tmp/$env:REPORT_FILENAME

# $fileBaseName = "$(basename -- $REPORT_FILENAME)"
# if ($RESULTS_FILE_SHARE){
#     reportFileOnFileShare = $RESULTS_FILE_SHARE/$fileBaseName
#     ./node_modules/artillery/bin/artillery report -o $reportFileOnFileShare
# }

write-host "Finished load test"

exit