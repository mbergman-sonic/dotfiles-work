# =========================
# Work Zsh Configuration
# WSL2 · Ubuntu 24.04
# =========================

# ---- History ----
HISTFILE="$HOME/.zsh_history"
HISTSIZE=10000
SAVEHIST=10000
setopt HIST_IGNORE_ALL_DUPS
setopt INC_APPEND_HISTORY
setopt SHARE_HISTORY

# ---- Behavior ----
setopt AUTO_CD
setopt CORRECT
setopt NO_BEEP

# ---- Performance ----
autoload -Uz compinit
compinit -C

# Remove Windows path pollution (WSL work sanity)
export PATH=$(echo "$PATH" | tr ':' '\n' | grep -v '/mnt/c' | tr '\n' ':')

# ---- Zinit ----
## OLD source ~/.zinit/bin/zinit.zsh
source "$HOME/.local/share/zinit/zinit.git/zinit.zsh"

zinit light zsh-users/zsh-autosuggestions
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-syntax-highlighting
zinit light junegunn/fzf

# ---- Prompt ----
eval "$(starship init zsh)"

# ---- Aliases (Work-safe) ----
alias ls="eza --icons"
alias ll="eza -la --icons"
alias cat="bat"
alias grep="rg"

alias gs="git status"
alias gl="git log --oneline --graph --decorate"

# WSL helpers
alias open="explorer.exe"
alias clip="clip.exe"

# ---- Dotfiles helper ----
alias dot='git --git-dir=$HOME/.dotfiles --work-tree=$HOME'


# Load a few important annexes, without Turbo
# (this is currently required for annexes)
zinit light-mode for \
    zdharma-continuum/zinit-annex-as-monitor \
    zdharma-continuum/zinit-annex-bin-gem-node \
    zdharma-continuum/zinit-annex-patch-dl \
    zdharma-continuum/zinit-annex-rust

### End of Zinit's installer chunk
