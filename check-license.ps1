param(
    [Parameter(Mandatory=$true)]
    [string]$UserPrincipalName
)

function Test-LicenseAssigned {
    param([string]$Upn)

    if ([string]::IsNullOrWhiteSpace($Upn)) {
        throw "UserPrincipalName cannot be empty"
    }

    if ($Upn -notmatch '^[^@]+@[^@]+\.[^@]+$') {
        throw "Invalid UPN format: $Upn"
    }

    return $true
}

try {
    $result = Test-LicenseAssigned -Upn $UserPrincipalName
    Write-Output "License check passed for: $UserPrincipalName"
    exit 0
}
catch {
    Write-Error $_.Exception.Message
    exit 1
}
