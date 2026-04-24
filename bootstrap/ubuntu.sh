#!/usr/bin/env bash
set -e

UBUNTU_VERSION=$(lsb_release -rs)

sudo apt update

# Core packages (work baseline)
sudo apt install -y \
  zsh git curl wget \
  fzf fd-find ripgrep \
  bat \
  netcat-openbsd

# eza only on >= 22.04
if [[ "$UBUNTU_VERSION" != "20.04" ]]; then
  sudo apt install -y eza
fi

# gh CLI (official repo, all versions)
if ! command -v gh >/dev/null; then
  curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg |
    sudo dd of=/usr/share/keyrings/githubcli-archive-keyring.gpg
  sudo chmod go+r /usr/share/keyrings/githubcli-archive-keyring.gpg
  echo \
    "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] \
    https://cli.github.com/packages stable main" |
    sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null
  sudo apt update
  sudo apt install -y gh
fi

# Starship
if ! command -v starship >/dev/null; then
  curl -sS https://starship.rs/install.sh | sh -s -- -y
fi
