# Work Dotfiles (WSL2 · Ubuntu)

This repository provides a **standardized work environment** for Linux machines running under **WSL2**, with first‑class support for:

- ✅ Ubuntu **24.04 LTS** (authoring / primary)
- ✅ Ubuntu **20.04 LTS** (supported compatibility target)

The setup is designed to be:
- Predictable
- Enterprise‑friendly
- Fast
- Easy to replicate
- Compatible with restricted corporate networks

---

## What This Repo Configures

- Zsh as the interactive shell
- Zinit for Zsh plugin management
- Starship prompt
- Shared shell aliases and defaults
- Global Git configuration
- Global Git ignore rules
- HTTPS‑based GitHub authentication via `gh`
- A repeatable bootstrap process

This repo **does not** store secrets, SSH keys, or credentials.

---

## Supported Platforms

Validated on:

- Ubuntu 24.04 LTS (WSL2)
- Ubuntu 20.04 LTS (WSL2)

> Ubuntu 24.04 is considered the **source‑of‑truth environment**.  
> Ubuntu 20.04 mirrors behavior via controlled compatibility logic.

---

## Important GitHub / Network Note

On many corporate networks:
- SSH to GitHub (`git@github.com`) is blocked
- SSH payloads may be blocked even on port 443

As a result, **GitHub access uses HTTPS authenticated via GitHub CLI (`gh`)**.

SSH keys are still required and used for:
- Cloud servers
- Bastion hosts
- Internal systems

This is expected and intentional.

---

## Repository Model (Bare Repo Pattern)

This repo uses a **bare Git repository with `$HOME` as the work tree**.

- Git data lives in: `~/.dotfiles`
- Versioned files live directly in: `$HOME`
- No symlinks are used

All Git operations are performed using the `dot` alias:

```bash
alias dot='git --git-dir=$HOME/.dotfiles --work-tree=$HOME'
