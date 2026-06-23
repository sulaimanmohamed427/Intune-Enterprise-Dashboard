# Intune Enterprise Dashboard

Enterprise-grade Intune reporting tool using Microsoft Graph API.

## Features
- Microsoft 365 Login (Graph API)
- Intune Device Reporting
- Compliance Policy Reporting
- HTML Dashboard Export
- Clean Enterprise UI

## Setup

1. Register Azure App
2. Add permissions:
   - DeviceManagementManagedDevices.Read.All
   - DeviceManagementConfiguration.Read.All
3. Add Client ID, Secret, Tenant ID in config.ps1

## Run

```powershell
.\main.ps1
