My vim
=======
    This is my vim configuration and plugins.

files
-----
    Copy the _vimrc to .vimrc, and mv it to your $HOME.

plugins
-------
    Less is more.
    Just use what you need.
    So start with not too many plugins.
About Command-T
---------------
    https://wincent.com/products/command-t
    The version of command-t is important.
    Make sure you get the right version(32bit/64bit).
    Command-T是一个基于Ruby和C扩展实现的快速文件浏览的插件，类似TextMate的Go to     File（Command+T呼出）功能，或Eclipse的Open Resource（Command+Shift+r）功能，可以通过模糊匹配快速定位并打开文件。
    
    从下载地址下载最新版本的vba文件，目前最新版本是1.4，所以安装文件是command-t-1.4.vba
    在~/.vim/bundle目录下创建文件夹command-t
    用Vim打开command-t-1.4.vba
    执行:UseVimball ~/.vim/bundle/command-t

    进入ruby目录下编译C扩展

      cd ~/.vim/bundle/command-t/ruby/command-t
      ruby extconf.rb
      make

    Vim版本需要支持ruby扩展。我们可以在Vim中输入:ruby 1检查，如果出现E319: Sorry, the command is not available in this version就表示不支持。

    如果出现上述情况，我们就需要自己去编译能够支持ruby的Vim，嫌麻烦的话可以直接安装vim-nox，自带Ruby支持，在Ubuntu下安装命令如下：sudo apt-get install vim-nox。

    执行ruby extconf.rb命令时如果出现找不到mkmf包的情况，说明你需要安装ruby-dev的包，在Ubuntu下安装命令如下：sudo apt-get install ruby1.8-dev。
NERDTree
--------------
    cd .vim/bundle && git clone git://github.com/scrooloose/nerdtree.git
vim-powerline
--------------
    Powerline是Vim的一个非常漂亮的状态栏插件，安装了Powerline之后，Vim底部将会出现一个增强型状态栏，当Vim处于NORMAL、INSERT、BLOCK等状态时，状态栏会呈现不同的颜色，同时状态栏还会显示当前编辑文件的格式（uft-8等）、文件类型（java、xml等）和光标位置等，喜欢的就装。
    
    进入.vim/bundle目录
    执行git clone git://github.com/Lokaltog/vim-powerline.git

    在.vimrc中设置状态栏主题

     "powerline{
     set guifont=PowerlineSymbols\ for\ Powerline
     set nocompatible
     set t_Co=256
     let g:Powerline_symbols = 'fancy'
     "}
