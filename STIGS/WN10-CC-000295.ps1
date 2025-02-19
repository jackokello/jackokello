<#
.SYNOPSIS
    This PowerShell script modifies the registry key responsible for RSS feed attachment downloads.

.NOTES
    Author          : Jack Okello
    LinkedIn        : linkedin.com/in/jack-okello
    GitHub          : github.com/jackokello
    Date Created    : 2025-18-02
    Last Modified   : 2025-18-02
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-CC-000295

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    Put any usage instructions here.
    Example syntax:
    PS C:\> .\STIG-ID-WN10-CC-000295.ps1 
#>

# Define the registry path and value name
$RegistryPath = "HKCU:\Software\Microsoft\Office\Common\RSS"
$ValueName = "DisableEnclosureDownload"
$ValueData = 1

# Ensure the registry path exists
if (!(Test-Path $RegistryPath)) {
    New-Item -Path $RegistryPath -Force | Out-Null
}

# Set the registry value to prevent attachment downloads from RSS feeds
Set-ItemProperty -Path $RegistryPath -Name $ValueName -Value $ValueData -Type DWord

# Verify the setting
$CurrentSetting = Get-ItemProperty -Path $RegistryPath -Name $ValueName
Write-Output "RSS attachment downloads are set to: $($CurrentSetting.DisableEnclosureDownload)"
