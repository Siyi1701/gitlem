# 检查 M365 用户许可证分配
param(
    [string]$UserPrincipalName
)

Write-Output "Checking license for: $UserPrincipalName"
# 实际逻辑后续补充

if (-not $UserPrincipalName) {
    Write-Error "UserPrincipalName is required"
    exit 1
}
# TODO: add real license check logic
