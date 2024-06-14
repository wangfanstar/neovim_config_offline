" 获取当前工作目录的完整路径
let current_directory = getcwd()

" 使用正则表达式截取前三级目录
let prefix_path = substitute(current_directory, '$\/[^\/]*$\{3\}.*', '\1\2\3', '')

" 拼接自定义配置文件路径
let custom_config_file = prefix_path . '/init_usr.vim'

" 检查自定义配置文件是否存在
if filereadable(custom_config_file)
  " 载入自定义配置文件
  execute 'source ' . custom_config_file
  echom 'Use custom config file : ' . custom_config_file
else
  " 输出调试信息，当前自定义配置文件不存在
  execute 'source ' . '~/.config/nvim/init_default.vim'
  echom 'Use default config file init_default.vim'
  
  " 继续当前 init.vim 的设置
  " 在此处添加你的默认配置
" 公共自定义init.vim结束
endif
