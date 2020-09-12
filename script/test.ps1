param(
    [Parameter(Mandatory=$false, Position=0, ValueFromRemainingArguments,
    HelpMessage="Enter one or more specific tests")]
    [string[]]
    $Test
)

$scriptPath = Split-Path -Path $PSCommandPath -Parent

Write-Output "`n==> Running tests..."
Write-Output "Tests started at $(Get-Date)"
if ($PSBoundParameters.ContainsKey('Test')) {
    & "$scriptPath\bin\checkScripts.ps1" $Test
} else {
    & "$scriptPath\bin\checkScripts.ps1"
}
Write-Output "Tests finished at $(Get-Date)"

if ($LastExitCode) {
    Write-Output "checkScripts failed with exit code: $LastExitCode"
    Exit $LastExitCode
}
