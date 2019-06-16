. ./upload-results.ps1

Write-Host "Invoking Artillery to run load test $env:LOAD_TEST_NAME with file $env:ARTILLERYIO_FILE"

$outputFile = "/tmp/$env:REPORT_NAME.json"
$resultsFile = "/tmp/$env:REPORT_NAME.html"

./node_modules/artillery/bin/artillery run $env:ARTILLERYIO_FILE -e $env:ARTILLERY_ENVIRONMENT -o $outputFile

Write-Host "Creating results file"

./node_modules/artillery/bin/artillery report -o $resultsFile $outputFile

if ($env:AZ_STORAGE_ACCOUNT){
    Write-Host "Uploading results to blob storage"

    Upload-Results `
        -StorageAccountName $env:AZ_STORAGE_ACCOUNT `
        -StorageAccountKey $env:AZ_STORAGE_KEY `
        -LoadTestName $env:LOAD_TEST_NAME `
        -ResultsFile $resultsFile
}



write-host "Finished load test"

exit