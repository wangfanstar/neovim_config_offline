#!/bin/bash

# 解析命令行参数
project=$(pwd | awk -F'/' '{print $NF}')
if [ "$project" = "$(basename "$HOME")" ]; then
    echo "Error: you should be in the project folder."
    exit 1
fi

echo "Current project: $project"


# 创建.cscope文件保存目录
[[ -d ".root" ]] || mkdir .root

function generate_cscope_files() {
    # 使用当前目录下的文件生成cscope.files
    find . -name "*.[ch]" -o -name "*.conf" > cscope.files

    echo "cscope -Rbkq"
}

echo "Current directory: $(pwd)"

generate_cscope_files

# 在当前目录运行cscope命令
cscope -b -q -k