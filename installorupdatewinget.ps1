function Get-InstalledWingetVersion {
  try {
    $wingetVersion = winget --version 2>$null
    if ($wingetVersion) {
      Write-Host "Winget is installed. Version: $wingetVersion"
      return $wingetVersion
    } else {
      Write-Host "Winget is not installed on this system." -ForegroundColor Red
      return $null
    }
  } catch {
    Write-Host "Error checking Winget installation." -ForegroundColor Red
    return $null
  }
}

function Get-LatestWingetVersion {
  $url = "https://api.github.com/repos/microsoft/winget-cli/releases/latest"
  $releaseInfo = Invoke-RestMethod -Uri $url
  $latestVersion = $releaseInfo.tag_name -replace "v", "" # Remove the 'v' from the version
  Write-Host "Latest Winget version on GitHub: $latestVersion"
  return $latestVersion
}

function Install-LatestWinget {
  $downloadUrl = Get-LatestWingetRelease
  if ($downloadUrl) {
    $wingetInstallerPath = "$env:TEMP\winget-latest.msixbundle"
    Write-Host "Downloading the latest Winget release from GitHub..."
    Invoke-WebRequest -Uri $downloadUrl -OutFile $wingetInstallerPath
    Write-Host "Installing Winget..."
    Add-AppxPackage -Path $wingetInstallerPath
    Write-Host "Winget installation completed."
  }
}

function Get-LatestWingetRelease {
  $url = "https://api.github.com/repos/microsoft/winget-cli/releases/latest"
  $releaseInfo = Invoke-RestMethod -Uri $url
  $latestAsset = $releaseInfo.assets | Where-Object { $_.name -like "*.msixbundle" }
  if ($latestAsset -ne $null) {
    return $latestAsset.browser_download_url
  } else {
    Write-Host "Error: Could not find the latest Winget release on GitHub." -ForegroundColor Red
    return $null
  }
}

function Update-LatestWinget {
  $installedVersion = Get-InstalledWingetVersion
  $latestVersion = Get-LatestWingetVersion
  if ($installedVersion -ne $null -and $latestVersion -ne $null) {
    if ($installedVersion -lt $latestVersion) {
      Write-Host "A newer version of Winget is available. Installing version $latestVersion..."
      Install-LatestWinget
    } else {
      Write-Host "You already have the latest version of Winget installed."
    }
  } else {
    Write-Host "Installing the latest version of Winget from GitHub..."
    Install-LatestWinget
  }
}