#!/usr/bin/env bash
# Symlink dotfiles into $HOME, backing up anything already there.
set -euo pipefail

DOTFILES="${DOTFILES:-$HOME/.dotfiles}"
BACKUP="$HOME/.dotfiles-backup-$(date +%s)"

link() {
  local src="$1" dst="$2"
  if [[ -e "$dst" && ! -L "$dst" ]]; then
    mkdir -p "$BACKUP"
    mv "$dst" "$BACKUP/"
    echo "backed up $dst"
  fi
  ln -sfn "$src" "$dst"
  echo "linked  $dst -> $src"
}

link "$DOTFILES/zsh/zshrc"          "$HOME/.zshrc"
link "$DOTFILES/zsh/zshenv"         "$HOME/.zshenv"
link "$DOTFILES/nvim"               "$HOME/.config/nvim"
link "$DOTFILES/tmux/tmux.conf"     "$HOME/.tmux.conf"
link "$DOTFILES/git/gitconfig"      "$HOME/.gitconfig"
link "$DOTFILES/git/gitignore"      "$HOME/.gitignore_global"

echo
echo "Done. Backups (if any) in: $BACKUP"
