Write-Output "`n==> Bootstrapping dependencies..."

# Setup path variables
$binPath = Split-Path -Path $PSCommandPath -Parent
$scriptPath = Split-Path -Path $binPath -Parent
$basePath = Split-Path -Path $scriptPath -Parent

# Ensure PowerShell is installed
if (-not (Get-Command pwsh -ErrorAction SilentlyContinue)) {
  Write-Output "==> Installing PowerShell..."
  winget install Microsoft.PowerShell --exact
}

# Install PSScriptAnalyzer
Write-Output "==> Installing PSScriptAnalyzer..."
Install-Module -Name PSScriptAnalyzer -Scope CurrentUser -Force
if (-not (Get-Module -ListAvailable -Name PSScriptAnalyzer)) {
  throw "PSScriptAnalyzer installation failed"
}

function Install-WinGetPackage {
  param (
    [Parameter(Mandatory = $true)]
    [string]
    $Name
  )
  Write-Output "===> Installing '$Name' using winget"
  # Enforce use of exact package name as name matching can cause issues if multiple matches found
  winget install $Name --exact
}

# Install any required winget packages
$packagesFilePath = "$basePath\winget-packages"
if (Test-Path -Path "$packagesFilePath" -PathType Leaf) {
  Write-Output "`n==> Installing winget packages..."
  $packageList = Get-Content -Path "$packagesFilePath"
  if ($packageList.Count -eq 1) {
    # A single item is treated as a string not an array
    Install-WinGetPackage -Name $packageList
  } else {
    For ($index = 0; $index -lt $packageList.Count; $index++) {
      $package = $packageList[$index];
      Install-WinGetPackage -Name $package
    }
  }
}
