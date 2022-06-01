$random = Get-Random
$storageAccountName='storage' + [string]$random
$resourceGroupName='s1161088'
$region='westeurope'
$shareName='myshare'
$tableName='table01'
$ContainerName='quickstartblobs'

$storageAccount = New-AzStorageAccount -ResourceGroupName $ResourceGroupName `
    -Name $storageAccountName `
    -Location $region `
    -SkuName Standard_LRS `
    -Kind StorageV2

$ctx = $storageAccount.Context

New-AzStorageContainer -Name $ContainerName -Context $ctx -Permission Blob

New-AzRmStorageShare `
    -StorageAccount $storageAccount `
    -Name $shareName `
    -EnabledProtocol SMB `
    -QuotaGiB 1024 | Out-Null

New-AzStorageTable -Name $tableName -Context $ctx