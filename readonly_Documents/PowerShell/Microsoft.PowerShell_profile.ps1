Set-PSReadLineOption -EditMode Vi
Set-PSReadLineOption -ViModeIndicator Cursor
Set-Alias v nvim
Set-PSReadLineOption -PredictionSource History

# echo $variable
# Make Tab behave like Zsh/completion menu; by default similar behavior on hitting ctrl+space
Set-PSReadlineKeyHandler -Key Tab -Function MenuComplete

# fzf integration
# run this command in pwsh
# Install-Module -Name PSFzf -Scope CurrentUser
# 
# uncomment this
# Import-Module PSFzf
# Set-PsFzfDefaultOptions -NonInteractive

function cd1 {
    $bookmarkFile = "D:\d\nav-win"

    if (Test-Path $bookmarkFile) {
        $target = Get-Content $bookmarkFile | fzf --reverse
        
        if ($target) {
            Set-Location $target
        }
    } else {
        Write-Host "Error: $bookmarkFile not found." -ForegroundColor Red
    }
}

$env:PATH += ";D:\d\scripts\"
