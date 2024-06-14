" 添加本地插件路径，适用于neoVim0.95,telescope-fzf-native.nvim 插件的libfzf.so 文件如果不适配版本，可能需要手动在对应文件夹make clean && make 生成一下
call plug#begin('~/.local/share/nvim/plug')
Plug '~/.local/share/nvim/plug/cscope_maps.nvim'
Plug '~/.local/share/nvim/plug/which-key'
Plug '~/.local/share/nvim/plug/telescope.nvim'
Plug '~/.local/share/nvim/plug/telescope-fzf-native.nvim', { 'do': 'make' }
Plug '~/.local/share/nvim/plug/plenary.nvim'
Plug '~/.local/share/nvim/plug/fzf-lua'
Plug '~/.local/share/nvim/plug/nvim-web-devicons'
Plug '~/.local/share/nvim/plug/nvim-lspconfig'
Plug '~/.local/share/nvim/plug/lspsaga.nvim'
Plug '~/.local/share/nvim/plug/Mark--Karkat'
Plug '~/.local/share/nvim/plug/rainbow'
"Plug '~/.local/share/nvim/plug/vim-gutentags'
Plug '~/.local/share/nvim/plug/taglist.vim'
Plug '~/.local/share/nvim/plug/tagbar'
Plug '~/.local/share/nvim/plug/cSyntaxAfter'
Plug '~/.local/share/nvim/plug/vim-powerline'
Plug '~/.local/share/nvim/plug/vim-tomorrow-theme'
Plug '~/.local/share/nvim/plug/a.vim'
Plug '~/.local/share/nvim/plug/std_c'
Plug '~/.local/share/nvim/plug/gruvbox'
Plug '~/.local/share/nvim/plug/fzf.vim'
Plug '~/.local/share/nvim/plug/fzf', { 'do': { -> fzf#install() } }
Plug '~/.local/share/nvim/plug/nvim-treesitter', {'do': ':TSUpdate'}
Plug '~/.local/share/nvim/plug/asynctasks.vim'
Plug '~/.local/share/nvim/plug/asyncrun.vim'
Plug '~/.local/share/nvim/plug/vim-hidecomments'
Plug '~/.local/share/nvim/plug/vim-startify'
Plug '~/.local/share/nvim/plug/vim-surround'
Plug '~/.local/share/nvim/plug/vim-comment-enhancer'
call plug#end()


" vim-comment-enhancer 设置全局变量 comment_author
let g:author = "w12043"



colorscheme Tomorrow-Night-Eighties

nnoremap <Leader>hc :HideComments<CR>
"  运行时自动打开高度为 6 的 quickfix 窗口，不然你看不到任何输出，除非你自己手动用 :copen 打开它
let g:asyncrun_open = 6
let g:asyncrun_rootmarks = ['.git', '.svn', '.root', '.project', '.hg']
let g:asynctasks_term_pos = 'tab'
"asyncrun 
" 自动打开 quickfix window ，高度为 6
let g:asyncrun_open = 6
" 任务结束时候响铃提醒
let g:asyncrun_bell = 1
" 设置 F12 打开/关闭 Quickfix 窗口
nnoremap <F12> :call asyncrun#quickfix_toggle(6)<cr>

" 设置 F7 打开/关闭 Quickfix 窗口
nnoremap <F7> :e ++enc=utf-8<CR>:set noreadonly<CR>
let g:python3_host_prog = '/home/w12043/python39/bin/python3'

" -----------------------------------------------------------------------------
"  < 编码配置 >
" -----------------------------------------------------------------------------
" 注：使用utf-8格式后，软件与程序源码、文件路径不能有中文，否则报错
set nu
set encoding=utf-8                                    "设置gvim内部编码
set fileencoding=utf-8                                "设置当前文件编码
set fileencodings=ucs-bom,utf-8,gbk,gb18030,latin1,big5"设置支持打开的文件的编码
" 文件格式，默认 ffs=dos,unix
set fileformat=unix                                   "设置新文件的<EOL>格式
set fileformats=unix,dos,mac                          "给出文件的<EOL>格式类型
set ignorecase                                        "搜索模式里忽略大小写
set smartcase                                         "如果搜索模式包含大写字符，不使用 'ignorecase' 选项，只有在输入搜索模式并且打开 'ignorecase' 选项时才会使用
" 注：上面配置中的"<Leader>"在本软件中设置为"\"键（引号里的反斜杠），如<Leader>t
" 指在常规模式下按"\"键加"t"键，这里不是同时按，而是先按"\"键后按"t"键，间隔在一
" 秒内，而<Leader>cs是先按"\"键再按"c"又再按"s"键
" quickfix快捷键
set mouse=r
nmap <F5> :cnext <CR>
nmap <F4> :cprev <CR>
nmap <F8> :e! <CR>
nmap <F10> :set mouse=v <CR>
nmap <F9> :set mouse=r <CR>
nmap <C-p> :tabnext <CR>
" -----------------------------------------------------------------------------



" 当文件在外部被修改，自动更新该文件
set autoread

" -----------------------------------------------------------------------------
"  < 编写文件时的配置 >
" -----------------------------------------------------------------------------
filetype on                                           "启用文件类型侦测
filetype plugin on                                    "针对不同的文件类型加载对应的插件
filetype plugin indent on                             "启用缩进
set smartindent                                       "启用智能对齐方式
set expandtab                                         "将Tab键转换为空格
set tabstop=4                                         "设置Tab键的宽度
set shiftwidth=4                                      "换行时自动缩进4个空格
set smarttab                                          "指定按一次backspace就删除shiftwidth宽度的空格

" 常规模式下输入 tb 调用插件，如果有打开 TagList 窗口则先将其关闭
nmap tb :TagbarToggle<CR>
let g:tagbar_width=30                       "设置窗口宽度
let g:tagbar_left=1                         "在左侧窗口中显示



" 将rg作为fzf.vim搜索工具
let $FZF_DEFAULT_COMMAND = 'rg --files --hidden --follow --no-ignore-vcs'

" 打开搜索结果时调用rg进行搜索
let $FZF_DEFAULT_OPTS = '--preview-window "right:60%:hidden" --preview "rg --ignore-case --pretty -f {}"'

nnoremap <Leader>ev :edit $MYVIMRC<CR>
nnoremap <Leader>sv :source $MYVIMRC<CR>
nnoremap <leader>fo :Files<CR>
nnoremap <leader>fif :Rg<CR>
nmap <C-p> :Telescope find_files<CR>
nmap <C-e> :Buffers<CR>
nnoremap <C-t> :Tags<CR>
let g:fzf_action = { 'ctrl-e': 'edit' }

let g:rg_command = '
  \ rg --column --line-number --no-heading --fixed-strings --ignore-case --no-ignore --hidden --follow --color "always"
  \ -g "*.{js,json,php,md,styl,jade,html,config,py,cpp,c,go,hs,rb,conf,h}"
  \ -g "!{.git,node_modules,vendor,.svn,.diff}/*" '

command! -bang -nargs=* F call fzf#vim#grep(g:rg_command .shellescape(<q-args>), 1, <bang>0)


" telescope设置 用于查找文件和查找文本
nnoremap <leader>ff :Telescope find_files<CR>
nnoremap <leader>fg :Telescope live_grep<CR>
nnoremap <leader>fb :Telescope buffers<CR>
nnoremap <leader>fh :Telescope help_tags<CR>
nnoremap <leader>fr :Telescope resume<CR>


" 配置 Telescope
lua << EOF
local actions = require('telescope.actions')
local action_state = require('telescope.actions.state')

require('telescope').setup{
  defaults = {
    -- 默认搜索参数
    vimgrep_arguments = {
      'rg',
      '--color=never',
      '--no-heading',
      '--with-filename',
      '--line-number',
      '--column',
      '--ignore-case' -- 忽略大小写
    },
    -- 模糊匹配配置
    file_ignore_patterns = {},
    prompt_prefix = '> ',
    selection_caret = '> ',
    entry_prefix = '  ',
    initial_mode = 'insert',
    selection_strategy = 'reset',
    sorting_strategy = 'descending',
    layout_strategy = 'horizontal',
    layout_config = {
      horizontal = {
        mirror = false,
      },
      vertical = {
        mirror = false,
      },
    },
    file_sorter = require'telescope.sorters'.get_fuzzy_file,
    file_previewer = require'telescope.previewers'.vim_buffer_cat.new,
    grep_previewer = require'telescope.previewers'.vim_buffer_vimgrep.new,
    qflist_previewer = require'telescope.previewers'.vim_buffer_qflist.new,
    -- Generic sorter that uses fzf
    generic_sorter = require'telescope.sorters'.get_generic_fuzzy_sorter,
    -- 补全引擎
    path_display = {},
    winblend = 0,
    -- border = {},
    -- borderchars = { '-', '|', '-', '|', '+', '+', '+', '+' },
    color_devicons = true,
    use_less = true,
    set_env = { ['COLORTERM'] = 'truecolor' }, -- default = nil,
    -- 在这里添加 mappings 配置
    
  },
  extensions = {
    fzf = {
      fuzzy = true,                    -- 开启模糊匹配
      override_generic_sorter = true,  -- 使用 fzf 排序器替代默认排序器
      override_file_sorter = true,     -- 使用 fzf 排序器替代文件排序器
      case_mode = "ignore_case",       -- 忽略大小写
    }
  }
}

-- 加载 fzf 拓展
require('telescope').load_extension('fzf')
EOF



" cscope_maps 插件配置，之前的cscope neovim不支持了，用这个来代替
lua << EOF
require("cscope_maps").setup({
    disable_maps = false, 
    prefix = "<leader>s",
    -- cscope related defaults
    cscope = {
        -- location of cscope db file
        db_file = "./cscope.out",
        -- cscope executable
        exec = "gtags-cscope", -- "cscope" or "gtags-cscope"
        -- choose your fav picker
        picker = "quickfix", -- "telescope", "fzf-lua" or "quickfix"
        -- size of quickfix window
		qf_window_size = 5, -- any positive integer
        -- position of quickfix window
		qf_window_pos = "bottom", -- "bottom", "right", "left" or "top"
        -- "true" does not open picker for single result, just JUMP
        skip_picker_for_single_result = true, -- "false" or "true" quickfix只有一个结果时直接跳到文件
        -- these args are directly passed to "cscope -f <db_file> <args>"
        db_build_cmd_args = { "-bqkv" },
        -- statusline indicator, default is cscope executable
        statusline_indicator = nil,
        -- try to locate db_file in parent dir(s)
        project_rooter = {
            enable = false, -- "true" or "false"
            -- change cwd to where db_file is located
            change_cwd = false, -- "true" or "false"
        },
    }
})

EOF

"使用 :Cs 命令作为 :Cscope find 的快捷方式
command! -nargs=+ Cs Cscope find <args>

"快捷键设置
nmap <C-\>s :Cscope find s <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>g :Cscope find g <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>c :Cscope find c <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>t :Cscope find t <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>e :Cscope find e <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>f :Cscope find f <C-R>=expand("<cfile>")<CR><CR>
nmap <C-\>i :Cscope find i ^<C-R>=expand("<cfile>")<CR>$<CR>
nmap <C-\>d :Cscope find d <C-R>=expand("<cword>")<CR><CR>


" 定义一个变量来存储 conceallevel 的当前状态
let g:conceal_is_active = v:false

" 定义一个函数来切换注释的显示和隐藏
function! ToggleComments()
  " 切换状态
  let g:conceal_is_active = !g:conceal_is_active
  if g:conceal_is_active
    " 隐藏注释
    setlocal conceallevel=2
    " 匹配 C/C++ 风格的单行和多行注释
    syntax match Comment "\/\*\_.\{-}\*\/\|\/\/.*" conceal
  else
    " 显示注释
    setlocal conceallevel=0
    syntax clear Comment
  endif
endfunction

" 设置快捷键 F2 来调用这个函数
nnoremap <F2> :call ToggleComments()<CR>

" 初始化用于追踪变量名的全局数组
let g:which_key_vars = []

" 定义一个函数来设置全局变量 g:author，并追踪变量名
function! SetGlobalAuthor()
    let g:author = input('Please enter the author name: ')
    call add(g:which_key_vars, 'g:author')
endfunction

" 定义一个函数来设置全局变量 g:PN，并追踪变量名
function! SetGlobalPN()
    let g:PN = input('Please enter the PN: ')
    call add(g:which_key_vars, 'g:PN')
endfunction

" 定义一个函数来设置全局变量 g:Des，并追踪变量名
function! SetGlobalDes()
    let g:Des = input('Please enter the Description: ')
    call add(g:which_key_vars, 'g:Des')
endfunction

" 定义一个函数来显示 which-key 中设置过的全局变量
function! ShowGlobalWhichKeyVars()
    " 遍历追踪数组，并显示每个变量的值
    for var_name in g:which_key_vars
        execute 'echo "' . var_name . ' = " . ' . var_name
    endfor
endfunction


" 使用 which-key 设置快捷键
lua << EOF
require("which-key").register({
  ["<leader>1"] = { ":call SetGlobalAuthor()<CR>", "Set Author Name" },
  ["<leader>2"] = { ":call SetGlobalPN()<CR>", "Set PN" },
  ["<leader>3"] = { ":call SetGlobalDes()<CR>", "Set Description" },
  ["<leader>0"] = { ":call ShowGlobalWhichKeyVars()<CR>", "Show Which-Key Global Variables" },
})
EOF

