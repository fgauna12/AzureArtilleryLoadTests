function Upload-Results {
    param(
        $StorageAccountName,
        $StorageAccountKey,
        $LoadTestName,
        $ResultsFile
    )

    Write-Host "Starting to upload results file"

    $ctx = New-AzStorageContext `
        -StorageAccountName $StorageAccountName `
        -StorageAccountKey $StorageAccountKey

    Write-Host "Creating storage container"

    New-AzStorageContainer `
        -Name $LoadTestName `
        -PublicAccess Blob `
        -Context $ctx 

    Write-Host "Uploading results file"

    Set-AzStorageblobcontent `
        -File $ResultsFile `
        -Container $LoadTestName `
        -Blob "$LoadTestName-$(Get-Date -Format 'yyyyMMddmmss')-results.html" `
        -Context $ctx 
}