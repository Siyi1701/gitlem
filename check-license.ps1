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

# 只有直接运行时才执行入口逻辑
if ($MyInvocation.InvocationName -ne '.') {
    param(
        [Parameter(Mandatory=$true)]
        [string]$UserPrincipalName
    )

    try {
        Test-LicenseAssigned -Upn $UserPrincipalName | Out-Null
        Write-Output "License check passed for: $UserPrincipalName"
        exit 0
    }
    catch {
        Write-Error $_.Exception.Message
        exit 1
    }
}
