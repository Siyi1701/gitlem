BeforeAll {
    . "$PSScriptRoot/../check-license.ps1"
}

Describe "Test-LicenseAssigned" {
    It "returns true for valid UPN" {
        Test-LicenseAssigned -Upn "user@contoso.com" | Should -Be $true
    }

    It "throws for empty UPN" {
        { Test-LicenseAssigned -Upn "" } | Should -Throw
    }

    It "throws for invalid UPN format" {
        { Test-LicenseAssigned -Upn "not-an-email" } | Should -Throw
    }
}
