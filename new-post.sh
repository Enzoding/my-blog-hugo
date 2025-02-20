#!/bin/bash

# 检查是否提供了文章标题
if [ -z "$1" ]; then
    echo "请提供文章标题"
    echo "使用方法: ./new-post.sh '文章标题'"
    exit 1
fi

# 生成文件名
filename=$(date +%Y-%m-%d)-$(echo $1 | tr '[:upper:]' '[:lower:]' | tr ' ' '-').md

# 创建新文章
hugo new content/posts/$filename --kind post

echo "文章已创建！"
echo "您可以编辑文章内容了。"
echo "编辑完成后，您有两个选择："
echo "1. 本地预览（推荐）："
echo "   hugo server -D"
echo ""
echo "2. 直接提交发布："
echo "   git add content/posts/$filename"
echo "   git commit -m \"post: 添加新文章 - $1\""
echo "   git push origin main"
echo ""
echo "注意：提交到 main 分支后，GitHub Actions 会自动将 draft: true 改为 false 并发布文章"

# 询问是否要立即提交
read -p "是否要立即提交这篇文章？(y/n) " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]
then
    git add "content/posts/$filename"
    git commit -m "post: 添加新文章 - $1"
    git push origin main
    echo "文章已提交，GitHub Actions 将自动处理发布流程"
fi
