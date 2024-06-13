#!/bin/bash

# 获取当前工作目录的名称
project=$(pwd | awk -F'/' '{print $NF}')

echo "Current project ${project}"

# 确保当前目录存在
cd "${PWD}" || { echo "Directory ${PWD} not found"; exit 1; }

# 查找当前目录下所有的.c、.h和.conf文件
echo "Generating gtags.files"
find "${PWD}" -type f \( -name "*.[ch]" -o -name "*.conf" \) > gtags.files

# 使用gtags生成标签
echo "Generating GTAGS"
gtags -f gtags.files
