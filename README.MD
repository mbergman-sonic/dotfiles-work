# Quick Start — Work Dotfiles (WSL2 · Ubuntu)

This quick start provides the **fastest supported path** to set up the work dotfiles environment on **Ubuntu 20.04 or 24.04 running under WSL2**.

---

## 1. Prerequisites

- Windows running **WSL2**
- Ubuntu **20.04 LTS** or **24.04 LTS**
- Internet access

Install minimal required packages:

```bash
sudo apt update
sudo apt install -y git curl ca-certificates
```

---

## 2. Clone the Dotfiles Repository (Bare Repo)

Clone the repository using **HTTPS**:

```bash
git clone --bare https://github.com/<ORG>/dotfiles-work.git ~/.dotfiles
```

Create the helper alias:

```bash
alias dot='git --git-dir=$HOME/.dotfiles --work-tree=$HOME'
```

Check out the tracked files into your home directory:

```bash
dot checkout
```

Hide untracked home files from git status:

```bash
dot config --local status.showUntrackedFiles no
```

---

## 3. Run the Bootstrap Script

Install all required tools and handle Ubuntu-version differences automatically:

```bash
./bootstrap/ubuntu.sh
```

This script is the **only supported method** for installing dependencies.

---

## 4. Set Zsh as the Default Shell

```bash
chsh -s $(which zsh)
```

Close **all** WSL terminal windows and reopen Ubuntu.

---

## 5. Authenticate to GitHub (HTTPS)

GitHub access is handled via the GitHub CLI (`gh`).

```bash
gh auth login
```

Choose:
- GitHub.com
- HTTPS
- Browser-based authentication

Verify authentication:

```bash
gh auth status
```

---

## 6. Install Nerd Font (Windows Host)

This environment requires Nerd Font support for prompt icons.

### Required Font

- **JetBrainsMono Nerd Font**

### Install on Windows

1. Download from:
   https://github.com/ryanoasis/nerd-fonts/releases
2. Extract `JetBrainsMono.zip`
3. Select all `.ttf` files
4. Right-click → **Install for all users**

### Configure Windows Terminal

In **Windows Terminal → Settings → Ubuntu profile**:

- Font face: `JetBrainsMono Nerd Font`
- Font size: 11–13 (recommended)
- Disable “Automatically detect paths”
- Starting directory:

```
\\wsl$\Ubuntu-20.04\home\<username>
```

---

## 7. (Optional) Generate SSH Key

SSH keys are required for server and internal system access (not for GitHub).

```bash
ssh-keygen -t ed25519 -C "work-wsl"
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_ed25519
```

---

## Done ✅

You should now have:

- Zsh as your default shell
- Starship prompt with icons
- GitHub access via HTTPS
- A completed, standardized work environment

If anything appears missing, re-run:

```bash
./bootstrap/ubuntu.sh
```