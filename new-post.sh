#!/bin/bash

# 检查是否提供了文章标题
if [ -z "$1" ]; then
    echo "请提供文章标题"
    echo "使用方法: ./new-post.sh '文章标题'"
    exit 1
fi

# 创建新文章
hugo new content posts/$(date +%Y-%m-%d)-$(echo $1 | tr '[:upper:]' '[:lower:]' | tr ' ' '-').md --kind post

echo "文章已创建！"
echo "现在您可以编辑文章内容了。"
echo "编辑完成后，运行以下命令来预览："
echo "hugo server -D"
