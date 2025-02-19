<#
.SYNOPSIS
    This PowerShell script ensures that the system must be configured to audit Account Management - User Account Management failures. 

.NOTES
    Author          : Jack Okello
    LinkedIn        : linkedin.com/in/jack-okello
    GitHub          : github.com/jackokello
    Date Created    : 2025-18-02
    Last Modified   : 2025-18-02
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-AU-000035

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    Put any usage instructions here.
    Example syntax:
    PS C:\> .\STIG-ID-WN10-AU-000035.ps1 
#>

# Define the audit policy category and subcategory
$Category = "Account Management"
$SubCategory = "User Account Management"
$Setting = "Failure"

# Apply the setting using AuditPol
auditpol /set /subcategory:"$SubCategory" /failure:enable

# Verify the setting
$auditStatus = auditpol /get /subcategory:"$SubCategory"

# Display the result
Write-Output "Audit Policy Status for ${SubCategory}:"
Write-Output $auditStatus
