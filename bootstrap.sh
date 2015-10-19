#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE}")";

# 更新
# git pull origin master;

path=`pwd -P`;
home=`echo $HOME`;
vim=`which vim`

# 主函数
function doIt() {

  echo 'Copying files and directories...'
  for i in `ls | grep -v -E 'README.md|bootstrap.sh'`; do
  # for i in *; do
    origin="${path}/$i"
    target="${home}/.$i"

    if [ -f $target ]; then
      mv $target "$target.bak"
    fi

    ln -sf $origin $target
  done


  # VIM 安装 vundle 插件
  echo 'Installing gmarik/vundle for vim...'
  git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/vundle


  # VIM 安装 plugins
  $vim -c "PluginInstall!" -c "q" -c "q"


  # Done
  echo 'Done!'


  # Source
	source ~/.bash_profile;
}

# 执行
doIt;

# 解除
unset doIt;
