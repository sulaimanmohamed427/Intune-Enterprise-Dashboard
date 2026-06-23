. .\config.ps1
. .\auth.ps1
. .\intune.ps1
. .\report.ps1

Write-Host "Logging into Microsoft Graph..." -ForegroundColor Cyan

$token = Get-GraphToken -TenantId $TenantId -ClientId $ClientId -ClientSecret $ClientSecret

Write-Host "Fetching Intune Devices..." -ForegroundColor Green
$devices = Get-IntuneDevices -Token $token

Write-Host "Fetching Compliance Policies..." -ForegroundColor Green
$policies = Get-IntuneCompliance -Token $token

Write-Host "Generating HTML Dashboard..." -ForegroundColor Yellow
Generate-HTMLReport -Devices $devices -CompliancePolicies $policies -OutputPath $OutputPath

Write-Host "Report Generated at $OutputPath" -ForegroundColor Cyan
