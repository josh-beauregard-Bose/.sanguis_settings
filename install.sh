#!/bin/bash

P="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

if [ -e ~/.szhrc ]
then
  ZSHDATA=`cat ~/.zshrc`
  mv $HOME/.zshrc $HOME/.zshrc_old
  rm $HOME/.zshrc
fi

echo $ZSHDATA >> $P/zshrc

# create symlinks
# todo: add ifs
ln -s $P/vimrc $HOME/.vimrc
ln -s $P/.vim $HOME/.vim
ln -s $P/zshrc $HOME/.zshrc
ln -s $P/tmux.conf $HOME/.tmux.conf
ln -s $P/gitconfig $HOME/.gitconfig
ln -s $P/prezto $HOME/.zprezto

update_ss
setup prezto
setopt EXTENDED_GLOB
for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do
  ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
done
source $HOME/.zshrc
