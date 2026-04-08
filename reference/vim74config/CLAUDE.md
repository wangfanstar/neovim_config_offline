# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

This is a **portable Vim 7.4 IDE configuration package** for Windows (Gvim) and Linux (Vim/Gvim), optimized for C, C++, and Java development. It is a configuration/deployment package, not a software project with a build system or test suite.

## Deployment

**Windows:**
- Copy the downloaded files to the user directory (e.g., `C:\Users\<name>\`)
- The `vimrc.txt` file maps to `_vimrc`, and `.vim/` maps to `vimfiles/`
- Optionally add `vim74/` directory to the system `PATH` to enable ctags/cscope
- Run `gvim.exe` from the `vim74/` directory

**Linux (Ubuntu):**
- Install Vim (`apt-get install vim`), ctags, and cscope via package manager
- Copy `.vim/` → `~/.vim/` and rename `vimrc.txt` → `~/.vimrc`

**Fonts:** Install `user_fonts/YaHei Consolas Hybrid.ttf` (primary) and `DejaVuSansMono.ttf` before launching Gvim.

## Architecture

### Key Files
- `vimrc.txt` — Single 1033-line master configuration file (maps to `_vimrc` on Windows, `.vimrc` on Linux)
- `.vim/bundle/` — 27 Vundle-managed plugins (pre-installed, no compilation needed)
- `.vim/colors/` — 5 color schemes; default is `Tomorrow-Night-Eighties`
- `vim74/` — Official Vim 7.4 runtime, bundled `ctags.exe`, `cscope.exe`, `diff.exe`
- `user_fonts/` — TTF fonts for Gvim

### vimrc.txt Structure
The configuration file is organized in sections:
1. **OS/GUI detection** — Sets `g:iswindows`, `g:islinux`, `g:isGUI` flags used throughout
2. **Default configs** — Windows Gvim (mswin.vim) vs Linux Vim/Gvim paths
3. **Encoding** — UTF-8 default with GBK/CP936 fallback for Chinese Windows
4. **Editor settings** — Tab=4, smart indent, 80-column marker
5. **Plugin configs** — One section per plugin (27 plugins)
6. **Key mappings** — All custom bindings in one place at the end

### Plugin Categories
- **Navigation:** NERDTree (F2), SrcExpl (F3), CtrlP (Ctrl+P/B/M), Tagbar (`tb`), Taglist (`tl`)
- **Completion:** neocomplcache, OmniCppComplete, vim-javacompleteex
- **Code tools:** cscope (F4/F5 prev/next), ctags, ccvext (auto-generate tags), syntastic
- **Editing:** auto-pairs, snipmate, vim-surround, Align, NERDCommenter, emmet-vim
- **UI:** vim-powerline, indentLine, Mark--Karkat, ZoomWin

### Key Bindings Reference
| Key | Action |
|-----|--------|
| F2 | NERDTree toggle |
| F3 | SrcExpl toggle |
| F4 / F5 | Cscope prev/next result |
| F9 | Save + compile + link + run |
| Ctrl+F9 | Compile only |
| Ctrl+F10 | Link only |
| F11 | Fullscreen (Windows Gvim) |
| Ctrl+P/B/M | CtrlP file/buffer/MRU search |
| Ctrl+K/J/H/L | Window navigation |
| `tb` / `tl` | Tagbar / Taglist toggle |

### Compilation System
`vimrc.txt` contains `Compile()`, `Link()`, and `Run()` Vimscript functions that invoke GCC/G++ with Windows GBK charset flags (`-fexec-charset=gbk`) or `javac`/`java`. These are triggered via F9/Ctrl+F9/Ctrl+F10 and handle C, C++, and Java files by detecting `&filetype`.
