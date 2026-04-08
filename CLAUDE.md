# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

This is a **Neovim offline configuration distribution** targeting Linux environments with Neovim 0.95+. It bundles plugins and a prebuilt binary so Neovim can be fully set up without internet access. The primary use case is C/C++ development.

## Repository Layout

- `.config/nvim/` — Neovim config files
  - `init.vim` — Entry point: checks for a project-local `init_usr.vim` in parent directories (up to 3 levels up), falls back to `init_default.vim`
  - `init_default.vim` — Full configuration: plugin declarations (vim-plug), keybindings, LSP, Telescope, cscope_maps, treesitter
  - `init_usr.vim` — Optional user/project overrides (not committed; placed in project roots)
- `.local/share/nvim/plug/` — All plugins bundled locally (no network fetch at runtime)
- `nvim-linux64/` — Prebuilt Neovim binary (`bin/nvim`) and runtime files
- `script/` — Shell utilities for indexing C/C++ projects

## Plugin Setup

Plugins are managed by **vim-plug** and sourced from `~/.local/share/nvim/plug/` (local paths only). One plugin requires compilation after install:

```bash
# If telescope-fzf-native.nvim's libfzf.so is incompatible with the Neovim version:
cd ~/.local/share/nvim/plug/telescope-fzf-native.nvim
make clean && make
```

## C/C++ Code Indexing Scripts

Run these from the root of a C/C++ project before using cscope or tag navigation:

```bash
# Generate cscope database (searches *.c, *.h, *.conf; creates .root/ marker)
bash /path/to/repo/script/cscopeall.sh

# Generate GNU Global TAGS database
bash /path/to/repo/script/gtagsall.sh
```

`cscope_maps.nvim` is configured to use `gtags-cscope` as its cscope executable, with the database at `./cscope.out`.

## Key Architecture Decisions

**Config loading chain:** `init.vim` extracts a path prefix from `getcwd()` (strips the last path component) and looks for `init_usr.vim` there. This allows project-specific overrides without modifying the shared default config.

**Offline-first:** All plugins are under `.local/share/nvim/plug/` as local Plug paths. The `fzf` and `nvim-treesitter` plugins have `do` hooks but only run on `:PlugInstall`, not at startup.

**cscope backend:** Uses `gtags-cscope` (GNU Global) rather than native cscope, providing better incremental update support. Keybindings use `<C-\>` prefix; the `:Cs` command aliases `:Cscope find`.

**Python3 host:** Hardcoded to `/home/w12043/python39/bin/python3` — change `g:python3_host_prog` in `init_default.vim` or override in `init_usr.vim` if the path differs.

## Key Keybindings (from init_default.vim)

| Key | Action |
|-----|--------|
| `<C-p>` | Telescope find files |
| `<C-e>` | FZF buffer list |
| `<C-t>` | FZF tags |
| `<leader>ff/fg/fb/fh/fr` | Telescope find files/grep/buffers/help/resume |
| `<leader>fo` / `<leader>fif` | FZF files / Rg search |
| `<C-\>s/g/c/t/e/f/i/d` | Cscope: symbol/definition/callers/text/egrep/file/includes/called |
| `tb` | Toggle Tagbar (left side, width 30) |
| `<F2>` | Toggle comment visibility (conceal) |
| `<F4>/<F5>` | Previous/next quickfix error |
| `<F7>` | Reload file as UTF-8 |
| `<F8>` | Force reload file (`e!`) |
| `<F9>/<F10>` | Mouse mode: `r` / `v` |
| `<F12>` | Toggle quickfix window (height 6) |
| `<leader>ev / sv` | Edit / source vimrc |
| `<leader>hc` | Hide comments |

## External Tool Dependencies

The following must be present on the target Linux system:

- `ripgrep` (`rg`) — used by FZF and Telescope for file/text search
- `gtags-cscope` and `gtags` — for C/C++ symbol indexing via `cscope_maps.nvim`
- `cscope` — fallback indexer (used by `cscopeall.sh`)
- Python 3.9+ at the path set in `g:python3_host_prog`
- C compiler toolchain — only needed to rebuild `telescope-fzf-native.nvim`
