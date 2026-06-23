function Generate-HTMLReport {
    param(
        $Devices,
        $CompliancePolicies,
        $OutputPath
    )

    $deviceCount = $Devices.Count
    $policyCount = $CompliancePolicies.Count

    $html = @"
<html>
<head>
<title>Intune Enterprise Dashboard</title>
<style>
body { font-family: Arial; background:#0f172a; color:#fff; }
.header { padding:20px; background:#1e293b; text-align:center; }
.card { background:#111827; padding:20px; margin:10px; border-radius:10px; display:inline-block; width:45%; }
.table { width:100%; border-collapse: collapse; margin-top:20px; }
th, td { border:1px solid #334155; padding:8px; }
th { background:#1e293b; }
</style>
</head>

<body>

<div class="header">
<h1>Microsoft Intune Enterprise Dashboard</h1>
<p>Generated Report</p>
</div>

<div class="card">
<h2>Total Devices</h2>
<h1>$deviceCount</h1>
</div>

<div class="card">
<h2>Compliance Policies</h2>
<h1>$policyCount</h1>
</div>

<h2 style="padding-left:10px;">Device List</h2>
<table class="table">
<tr>
<th>Device Name</th>
<th>User</th>
<th>OS</th>
<th>Compliance</th>
</tr>
"@

    foreach ($d in $Devices) {
        $html += "<tr>
        <td>$($d.deviceName)</td>
        <td>$($d.userPrincipalName)</td>
        <td>$($d.operatingSystem)</td>
        <td>$($d.complianceState)</td>
        </tr>"
    }

    $html += @"
</table>

</body>
</html>
"@

    $html | Out-File -Encoding UTF8 $OutputPath
}
