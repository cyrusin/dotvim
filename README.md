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
Taglist
-------------
    首先是ctags的安装，推荐使用exuberant ctags，我们可以从其官方网站（http://ctags.sourceforge.net/）上下载它的源码包，进行解压缩，编译，安装即可。
具体过程如下：
    cd 到解压后文件的路径
    //在编译前执行configure可执行文件，configure程序将检测系统配置情况
    ./configure
    //完成配置以后会得到一个配置文件，用于make编译时使用
    //接下来使用make开始编译源代码  
    make
    ps:接下来的命令我们要使用到root权限，注意切换
    //编译后我们使用ctags自带的创建目录命令来创建ctags的安装目录
    ./makeinstalldirs
    //最后使用make install来进行安装
    make install
    下面我们来进行taglist的安装，同ctags的安装一样这里我们也是去其官方网站下载解压其源码包。
    执行：which ctags 看看路径
    在~/.vimrc中加入以下配置语句：

    let Tlist_Ctags_Cmd="/usr/local/bin/ctags"

    在这里需要注意的是我们需要察看ctags可执行可执行路径到底是在哪里，我们可以进入到上述目录，一直找到具体的可执行的文件ctags，并将其路径赋给Tlist_Ctags_Cmd（例如我的路径是/usr/local/bin/ctags/ctags）
