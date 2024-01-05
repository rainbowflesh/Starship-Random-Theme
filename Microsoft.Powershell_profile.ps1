$starships = "$HOME\.config\starships\"

$files = Get-ChildItem $starships | Where-Object { $_.PSIsContainer -eq $false }
$fileCount = $files.Count
if ($fileCount -gt 0) {
    $randomIndex = Get-Random -Minimum 0 -Maximum $fileCount
    $randomFile = $files[$randomIndex].Name
    Write-Host " [starship] Random theme $randomFile loaded"
}

$ENV:STARSHIP_CONFIG = "$starships\$randomFile"
Invoke-Expression (&starship init powershell)