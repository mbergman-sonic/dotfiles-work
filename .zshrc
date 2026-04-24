# =========================
# Work Zsh Configuration
# WSL2 · Ubuntu 24.04 & Ubuntu 20.04
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

# ---- SSH Agent ----
if ! pgrep -u "$USER" ssh-agent >/dev/null 2>&1; then
  eval "$(ssh-agent -s)" >/dev/null
  ssh-add ~/.ssh/id_ed25519 >/dev/null 2>&1
fi

# ---- WSL PATH cleanup ----
if [[ "$PATH" == *"/mnt/c/"* ]]; then
  export PATH=$(echo "$PATH" | tr ':' '\n' | grep -v '^/mnt/c/' | paste -sd:)
fi

# ---- Zinit ----
if [[ -f "$HOME/.local/share/zinit/zinit.git/zinit.zsh" ]]; then
  source "$HOME/.local/share/zinit/zinit.git/zinit.zsh"
else
  echo "⚠️  Zinit not installed. Run bootstrap/ubuntu.sh"
fi

zinit light zsh-users/zsh-autosuggestions
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-syntax-highlighting
zinit light junegunn/fzf

# Zinit annexes
zinit light zdharma-continuum/zinit-annex-as-monitor
zinit light zdharma-continuum/zinit-annex-bin-gem-node
zinit light zdharma-continuum/zinit-annex-patch-dl
zinit light zdharma-continuum/zinit-annex-rust

# ---- Prompt ----
eval "$(starship init zsh)"

# ---- Aliases (Work-safe) ----
if command -v eza >/dev/null 2>&1; then
  alias ls="eza --icons"
  alias ll="eza -la --icons"
else
  alias ls="ls --color=auto"
  alias ll="ls -lah --color=auto"
fi

alias cat="batcat"
alias bat="batcat"
alias grep="rg"

alias gs="git status"
alias gl="git log --oneline --graph --decorate"

# WSL helpers
alias open="explorer.exe"
alias clip="clip.exe"

# ---- Dotfiles helper ----
alias dot='git --git-dir=$HOME/.dotfiles --work-tree=$HOME'