<#
.SYNOPSIS
    This PowerShell script ensures that Windows 10 must be configured to audit other Logon/Logoff Events Failures.

.NOTES
    Author          : Jack Okello
    LinkedIn        : linkedin.com/in/jack-okello
    GitHub          : github.com/jackokello
    Date Created    : 2025-18-02
    Last Modified   : 2025-18-02
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-AU-000565

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    Put any usage instructions here.
    Example syntax:
    PS C:\> .\STIG-ID-WN10-AU-000565.ps1 
#>
# Define the audit policy subcategory
$SubCategory = "Other Logon/Logoff Events"

# Apply the setting to enable failure auditing
auditpol /set /subcategory:"$SubCategory" /failure:enable

# Verify the setting
$auditStatus = auditpol /get /subcategory:"$SubCategory"

# Display the result
Write-Output "Audit Policy Status for '$SubCategory':"
Write-Output $auditStatus
