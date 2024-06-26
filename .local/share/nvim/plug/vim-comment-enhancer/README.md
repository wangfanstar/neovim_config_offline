# vim-comment-enhancer

## 简介

这是一个Vim插件，可以帮助你快速地给选中的代码块添加注释，包括添加、删除和修改的标记。这对于代码审查和版本控制非常有用。

## 安装

推荐使用[vim-plug](https://github.com/junegunn/vim-plug)来安装此插件。

1. 在你的`init.vim`或`.vimrc`文件中添加以下行：

```vim
Plug 'wangfanstar/vim-comment-enhancer'
```

2. 然后执行`:PlugInstall`。

## 使用

- 选择代码块，然后按`Ctrl+a`来添加“Added by”注释。
- 按`Ctrl+d`来添加“Deleted by”注释。
- 按`Ctrl+o`来添加“Modified by”注释。

## 配置

你可以通过设置全局变量`g:author`来自定义注释中的作者名字，例如：

```vim
let g:author = "你的名字"
```

---

# vim-comment-enhancer

## Introduction

This Vim plugin facilitates the quick addition of comments to selected blocks of code, including markers for added, deleted, and modified code. This is highly useful for code review and version control purposes.

## Installation

It is recommended to use [vim-plug](https://github.com/junegunn/vim-plug) for installing this plugin.

1. Add the following line to your `init.vim` or `.vimrc` file:

```vim
Plug 'wangfanstar/vim-comment-enhancer'
```

2. Then, run `:PlugInstall`.

## Usage

- Select a block of code and press `Ctrl+a` to add an "Added by" comment.
- Press `Ctrl+d` to add a "Deleted by" comment.
- Press `Ctrl+o` to add a "Modified by" comment.

## Configuration

You can customize the author name in the comments by setting the global variable `g:author`, for example:

```vim
let g:author = "Your Name"
```

---

请确保将`your-github-username/vim-comment-enhancer`替换为你的GitHub用户名和仓库名。这个README提供了基本的安装和使用说明，以及如何配置插件的简单指南。