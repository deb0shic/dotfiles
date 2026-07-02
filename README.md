# dotfiles

My personal setup — zsh, neovim, tmux, git. macOS on Apple Silicon.

Nothing revolutionary here, just what I actually use every day. Copy anything useful; ignore the rest.

## Layout

```
.
├── zsh/          zshrc, aliases, functions, prompt
├── nvim/         lazy.nvim + a handful of plugins
├── tmux/         status line, keybindings
├── git/          gitconfig, gitignore_global
├── scripts/      one-off shell helpers on $PATH
└── install.sh    symlinks everything into $HOME
```

## Install

```bash
git clone https://github.com/deb0shic/dotfiles.git ~/.dotfiles
cd ~/.dotfiles
./install.sh
```

The script backs up any existing dotfiles into `~/.dotfiles-backup-<timestamp>` before symlinking, so it will not eat your current setup.

## What is in here

**zsh** — Pure prompt-inspired minimal prompt written from scratch (no oh-my-zsh, no starship). Fast startup: ~40ms on my M2. History dedup, fzf-based `Ctrl-R`, direnv hook.

**nvim** — Lazy.nvim as the plugin manager. Telescope, treesitter, LSP via Mason, formatting via conform.nvim. Colorscheme is `rose-pine`. No transparency, no cursorline. See `nvim/lua/plugins/` for the full list.

**tmux** — 256-color, mouse on, prefix rebound to `C-Space`. Status bar shows just the session name, window list, and time. Nothing else.

**git** — `pull.rebase = true`, `rerere.enabled = true`, delta as the diff pager, and a set of aliases I use dozens of times a day (`git s`, `git lg`, `git undo`).

## Requirements

- `brew` — for the actual package installs (`brew bundle` from `Brewfile`)
- `git` — obviously
- `zsh` >= 5.9
- `nvim` >= 0.10

## License

MIT

