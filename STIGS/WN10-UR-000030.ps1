<#
.SYNOPSIS
    This PowerShell script ensures that the Back up files and directories user right must only be assigned to the Administrators group.

.NOTES
    Author          : Jack Okello
    LinkedIn        : linkedin.com/in/jack-okello
    GitHub          : github.com/jackokello
    Date Created    : 2025-18-02
    Last Modified   : 2025-18-02
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-UR-000030

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    Put any usage instructions here.
    Example syntax:
    PS C:\> .\STIG-ID-WN10-UR-000030.ps1 
#>
# Define the privilege and allowed group
$Privilege = "SeBackupPrivilege"
$AllowedGroup = "*S-1-5-32-544"  # SID for Administrators group

# Apply the setting using secedit
$TempFile = "$env:TEMP\secpol.inf"
secedit /export /cfg $TempFile /quiet

# Read the current security policy
$Policy = Get-Content $TempFile

# Modify the SeBackupPrivilege setting
$NewPolicy = $Policy -replace "($Privilege\s*=\s*)([^\r\n]*)", "`$1$AllowedGroup"

# Save the updated policy
$NewPolicy | Set-Content $TempFile

# Apply the updated security settings
secedit /configure /db "$env:windir\security\local.sdb" /cfg $TempFile /quiet
gpupdate /force

# Cleanup
Remove-Item $TempFile -Force

Write-Output "SeBackupPrivilege has been restricted to Administrators only."
