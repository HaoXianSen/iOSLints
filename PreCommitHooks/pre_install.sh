#!/bin/bash

echo "正在检查安装必要工具..."
# 检测是否安装了homebrew
if [ "$(command -v brew -v)" ]; then
    echo "homebrew 已经安装"
else 
    echo "正在安装brew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
   echo '安装完成homebrew 🍺🍺🍺'
   
fi

# 检测是否安装了pre-commit
if [ "$(command -v pre-commit)" ]; then
    echo "pre-commit 已经安装"
else
    echo "正在安装pre-commit"
    brew install pre-commit
    echo '安装完成pre-commit 🍺🍺🍺'
fi


if [ ! -f "../.pre-commit-config.yaml" ]; then
    echo "文件 \".pre-commit-config.yaml\" 不存在， 请添加.pre-commit-config.yaml"
    exit 1
fi

if [ "$(command -v clang-format --help)" ]; then
    echo "clang-format 已经安装"
else 
    echo "正在安装clang-format"
    exec brew install clang-format
    echo '安装完成clang-format 🍺🍺🍺'
fi

if [ "$(command -v oclint -v)" ]; then
    echo "oclint 已经安装"
else 
    echo "正在安装oclint"
    exec sudo chown -R "$(whoami):staff" ~/Library/Caches/Homebrew /usr/local/Caskroom/ & brew install --cask oclint
    echo '安装完成oclint 🍺🍺🍺'
fi


exec pre-commit install






