<#
.SYNOPSIS
    This PowerShell script ensures the system must be configured to audit Account Logon - Credential Validation failures.

.NOTES
    Author          : Jack Okello
    LinkedIn        : linkedin.com/in/jack-okello
    GitHub          : github.com/jackokello
    Date Created    : 2025-18-02
    Last Modified   : 2025-18-02
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-AU-000005

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    Put any usage instructions here.
    Example syntax:
    PS C:\> .\STIG-ID-WN10-AU-0000050.ps1 
#>

# Define the audit policy subcategory
$SubCategory = "Credential Validation"

# Apply the setting to enable failure auditing
auditpol /set /subcategory:"$SubCategory" /failure:enable

# Verify the setting
$auditStatus = auditpol /get /subcategory:"$SubCategory"

# Display the result correctly
Write-Output ("Audit Policy Status for " + $SubCategory + ":")
Write-Output $auditStatus
