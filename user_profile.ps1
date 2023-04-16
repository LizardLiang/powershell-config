# Prompt
Import-Module posh-git
oh-my-posh init pwsh --config "$(scoop prefix oh-my-posh)\themes\slimfat.omp.json"  | Invoke-Expression

# Load prompt setting
#function Get-ScriptDirectory { Split-Path $MyInvocation.ScriptName }
#$PROMPT_CONFIG = Join-Path (Get-ScriptDirectory) 'lizard.omg.json'
#oh-my-posh --init --shell pwsh --config $PROMPT_CONFIG | Invoke-Expression

# Icons
Import-Module Terminal-icons

# PSReadline
Set-PSReadLineOption -EditMode Emacs
Set-PSReadLineOption -BellStyle None
Set-PSReadLineKeyHandler -Chord 'Ctrl+d' -Function DeleteChar
Set-PSReadLineOption -PredictionSource History
Set-PSReadLineOption -PredictionViewStyle ListView

# Fzf
Import-Module PSFzf
Set-PsFzfOption -PSReadLineChordProvider 'Ctrl+f' -PSReadLineChordReverseHistory 'Ctrl+r'

#ZLocation
Import-Module ZLocation

# Alias
Set-Alias vim nvim
Set-Alias ll ls
Set-Alias g git
Set-Alias st 'git status'
Set-Alias gcz 'git cz'
Set-Alias grep findstr
Set-Alias tig 'C:\Program Files\Git\usr\bin\tig.exe'
Set-Alias less 'C:\Program Files\Git\usr\bin\less.exe'
Set-Alias cc 'Set-Clipboard'

# Utilities
function which ($command) {
  Get-Command -Name $command -ErrorAction SilentlyContinue |
    Select-Object -ExpandProperty Path -ErrorAction SilentlyContinue
}
