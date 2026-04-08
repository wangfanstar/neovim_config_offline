#!/bin/bash

# 解析命令行参数
project=$(pwd | awk -F'/' '{print $NF}')
if [ "$project" = "$(basename "$HOME")" ]; then
    echo "Error: you should be in the project folder."
    exit 1
fi

echo "Current project: $project"
echo "Current directory: $(pwd)"

# 创建项目根目录标记
[[ -d ".root" ]] || mkdir .root

# 生成 cscope 文件列表
find . -type f \( -name "*.[ch]" -o -name "*.conf" \) > cscope.files

# 生成 cscope 数据库
cscope -b -q -k -i cscope.files

# 生成 ctags 标签
ctags --c-kinds=+defgmstuv --fields=+iaS --extras=+q -L cscope.files
