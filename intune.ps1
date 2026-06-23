function Get-IntuneDevices {
    param($Token)

    $headers = @{
        Authorization = "Bearer $Token"
    }

    $uri = "https://graph.microsoft.com/v1.0/deviceManagement/managedDevices"

    $response = Invoke-RestMethod -Headers $headers -Uri $uri -Method Get
    return $response.value
}

function Get-IntuneCompliance {
    param($Token)

    $headers = @{
        Authorization = "Bearer $Token"
    }

    $uri = "https://graph.microsoft.com/v1.0/deviceManagement/deviceCompliancePolicies"

    $response = Invoke-RestMethod -Headers $headers -Uri $uri -Method Get
    return $response.value
}
