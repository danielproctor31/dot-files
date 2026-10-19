oh-my-posh init pwsh --config "$HOME/.config/powershell/catppuccin.omp.json" | Invoke-Expression

Import-Module Terminal-Icons

Set-PSReadLineOption -PredictionSource History
Set-PSReadLineOption -PredictionViewStyle ListView