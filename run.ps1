param(
    # Location
    [Parameter()]
    [string]
    $Location = "eastus",
    # Environment
    [Parameter(Mandatory = $true)]
    [string]
    $Environment,
    # The name of the load test
    [Parameter(Mandatory = $true)]
    [string]
    $LoadTestName,
    # Test Mode
    [Parameter()]
    [switch]
    $Test
)

$resourceGroupName = "$Environment-$LoadTestName-loadtest-rg"

Write-Host "Creating resource group"

New-AzResourceGroup -Location $Location -Name $resourceGroupName | Out-Null

Write-Host "Starting load test using Azure Container Instance"

if ($Test) {
    Test-AzResourceGroupDeployment `
        -ResourceGroupName $resourceGroupName `
        -TemplateFile "armdeploy.json" `
        -Mode Incremental `
        -name $LoadTestName `
        -timeStamp "$(Get-Date -Format 'yyyyMMddmmss')" `
        -artillery-environment $Environment `
        -artillery-file "load.yml"
}
else {
    New-AzResourceGroupDeployment `
        -ResourceGroupName "$Environment-$LoadTestName-loadtest-rg" `
        -TemplateFile "armdeploy.json" `
        -Mode Incremental `
        -Force `
        -name $LoadTestName `
        -timeStamp "$(Get-Date -Format 'yyyyMMddmmss')" `
        -artillery-environment $Environment `
        -artillery-file "load.yml"
}