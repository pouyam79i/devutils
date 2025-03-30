# Config your vim

Here I have setup for myself which supports langs and tools I daily use.


### 0- set vim as default

    sudo update-alternatives --config editor

### 1- install Vim Plug

    https://github.com/junegunn/vim-plug

### 2- rename config.vimrc to .vimrc and put it your $HOME

### 3- run this command inside vim

    :PlugInstall

### 4- install other deps

    go install golang.org/x/tools/gopls@latest

    sudo apt install hadolint

    sudo apt install shellcheck

    go install mvdan.cc/sh/v3/cmd/shfmt@latest

    npm install -g typescript eslint

    npm install -g stylelint

    npm install -g htmlhint
