# Prompt
Import-Module posh-git
oh-my-posh init pwsh --config "C:\Program Files (x86)\oh-my-posh\themes\slimfat.omp.json"  | Invoke-Expression

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
Set-Alias v vim
Set-Alias ll ls
Set-Alias g git
Set-Alias gcz 'C:\Program Files\Git\cmd\git.exe cz'
Set-Alias grep findstr
Set-Alias tig 'C:\Program Files\Git\usr\bin\tig.exe'
Set-Alias less 'C:\Program Files\Git\usr\bin\less.exe'
Set-Alias cc 'Set-Clipboard'

# Git alias
function git-log-graph  { g log --graph --decorate --oneline }
Set-Alias -Name glg -Value git-log-graph

function git-diff { git diff }
Set-Alias -Name gd -Value git-diff

function git-checkout { git checkout $args }
Set-Alias -Name gco -Value git-checkout

function git-fetch { git fetch }
Set-Alias -Name gf -Value git-fetch

function git-pull { git pull $args }
Set-Alias -Name gpl -Value git-pull

del alias:gp -Force
function git-push { git push $args }
Set-Alias -Name gp -Value git-push

function git-branch { git branch $args }
Set-Alias -Name gb -Value git-branch

function git-status { git status }
Set-Alias -Name gs -Value git-status

del alias:gc -Force
function git-commit { git commit $args }
Set-Alias -Name gc -Value git-commit

function back-dir { cd .. }
Set-Alias -Name .. -Value back-dir

Set-Alias -Name lg -Value lazygit

# Utilities
function which ($command) {
  Get-Command -Name $command -ErrorAction SilentlyContinue |
    Select-Object -ExpandProperty Path -ErrorAction SilentlyContinue
}

function cr () {
  Get-ChildItem -Recurse | ForEach-Object {
    if ($_ -is [System.IO.FileInfo]) {
      (Get-Content $_.FullName) -replace '\r\n', '\r' | Set-Content -NoNewLine $_.FullName
    }
  }
}


