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
Set-Alias gcz 'C:\Program Files\Git\cmd\git.exe cz'
Set-Alias grep findstr
Set-Alias tig 'C:\Program Files\Git\usr\bin\tig.exe'
Set-Alias less 'C:\Program Files\Git\usr\bin\less.exe'
Set-Alias cc 'Set-Clipboard'

function git-log-graph  { g log --graph --decorate --oneline }
Set-Alias -Name glg -Value git-log-graph

function git-diff { git diff }
Set-Alias -Name gd -Value git-diff

function git-checkout { git checkout }
Set-Alias -Name gco -Value git-checkout

function git-fetch { git fetch }
Set-Alias -Name gf -Value git-fetch

function git-pull { git pull $args }
Set-Alias -Name gpl -Value git-pull

del alias:gp -Force
function git-push { git push $args }
Set-Alias -Name gp -Value git-push

function git-branch { git branch }
Set-Alias -Name gb -Value git-branch

function git-status { git status }
Set-Alias -Name gs -Value git-status

del alias:gc -Force
function git-commit { git commit }
Set-Alias -Name gc -Value git-commit

function back-dir { cd .. }
Set-Alias -Name .. -Value back-dir

# Utilities
function which ($command) {
  Get-Command -Name $command -ErrorAction SilentlyContinue |
    Select-Object -ExpandProperty Path -ErrorAction SilentlyContinue
}
