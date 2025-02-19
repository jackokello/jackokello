<#
.SYNOPSIS
    This PowerShell script modifies the registry key responsible for controlling camera access from the lock screen.

.NOTES
    Author          : Jack Okello
    LinkedIn        : linkedin.com/in/jack-okello
    GitHub          : github.com/jackokello
    Date Created    : 2025-18-02
    Last Modified   : 2025-18-02
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-CC-000005

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    Put any usage instructions here.
    Example syntax:
    PS C:\> .\STIG-ID-WN10-CC-0000050.ps1 
#>
# Define registry path and property
$RegPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Personalization"
$RegName = "NoLockScreenCamera"
$RegValue = 1  # 1 = Disabled, 0 = Enabled

# Check if the registry path exists, create it if not
if (-not (Test-Path $RegPath)) {
    New-Item -Path $RegPath -Force | Out-Null
}

# Set the registry value
Set-ItemProperty -Path $RegPath -Name $RegName -Value $RegValue -Type DWord

# Verify the setting
$Result = Get-ItemProperty -Path $RegPath -Name $RegName
Write-Output "Camera access from lock screen is set to: $($Result.NoLockScreenCamera) (1 = Disabled)"
