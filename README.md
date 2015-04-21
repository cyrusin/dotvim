[TOC]
My vim
=======
This is my vim configuration and plugins.

files
-----
Copy the `_vimrc` to `.vimrc`, and mv it to your `$HOME`.

plugins
-------
Less is more.

Just use what you need.

So start with not too many plugins.

About Command-T
---------------
[Command-T website](https://wincent.com/products/command-t)

The version of command-t is important.

Make sure you get the right version(32bit/64bit).

Command-T是一个基于Ruby和C扩展实现的快速文件浏览的插件,类似TextMate的Go to  File（Command+T呼出）功能,或Eclipse的Open Resource（Command+Shift+r）功能，可以通过模糊匹配快速定位并打开文件.
从下载地址下载最新版本的vba文件，目前最新版本是1.4，所以安装文件是`command-t-1.4.vba`.

在`~/.vim/bundle`目录下创建文件夹command-t,用Vim打开`command-t-1.4.vba`, 执行`:UseVimball ~/.vim/bundle/command-t`.
进入ruby目录下编译C扩展:

```bash
    ~/.vim/bundle/command-t/ruby/command-t
    ruby extconf.rb
    make
```

Vim版本需要支持ruby扩展。我们可以在Vim中输入`:ruby 1`检查，如果出现`E319: Sorry, the command is not available in this version`就表示不支持.

如果出现上述情况，我们就需要自己去编译能够支持ruby的Vim,嫌麻烦的话可以直接安装`vim-nox`,自带Ruby支持:

在Ubuntu下安装命令如下:

```bash
    sudo apt-get install vim-nox.
```

执行`ruby extconf.rb`命令时如果出现找不到mkmf包的情况，说明你需要安装`ruby-dev`的包:

在Ubuntu下安装命令:

```bash
    sudo apt-get install ruby1.8-dev.
```

NERDTree
--------------

```bash
    cd .vim/bundle && git clone git://github.com/scrooloose/nerdtree.git
```

vim-powerline
--------------
Powerline是Vim的一个非常漂亮的状态栏插件,安装了Powerline之后,Vim底部将会出现一个增强型状态栏.

当Vim处于`NORMAL`、`INSERT`、`BLOCK`等状态时，状态栏会呈现不同的颜色，同时状态栏还会显示当前编辑文件的格式、文件类型(java、xml等)和光标位置等,喜欢的就装.

进入.vim/bundle目录,执行:

```bash
    git clone git://github.com/Lokaltog/vim-powerline.git
```

在`.vimrc`中设置状态栏主题:

```
    "powerline{
    set guifont=PowerlineSymbols\ for\ Powerline
    set nocompatible
    set t_Co=256
    let g:Powerline_symbols = 'fancy'
    "}
```

Taglist
-------------
首先是ctags的安装，推荐使用exuberant ctags，我们可以从其[官方网站](http://ctags.sourceforge.net/)上下载它的源码包,进行解压缩，编译，安装即可.

具体过程如下:

到解压后文件的路径,在编译前执行configure可执行文件，configure程序将检测系统配置情况:

```
    ./configure
```

完成配置以后会得到一个配置文件，用于make编译时使用.接下来使用make开始编译源代码:

```make
```

ps: 接下来的命令我们要使用到**root**权限，注意切换.

编译后我们使用ctags自带的创建目录命令来创建ctags的安装目录:

```
    ./makeinstalldirs
```

最后使用make install来进行安装:

```
    make install
```

下面我们来进行taglist的安装，同ctags的安装一样这里我们也是去其官方网站下载解压其源码包.
执行：`which ctags` 看看路径,在~/.vimrc中加入以下配置语句:

```
    let Tlist_Ctags_Cmd="/usr/local/bin/ctags"
```

在这里需要注意的是我们需要察看ctags可执行可执行路径到底是在哪里,我们可以进入到上述目录,一直找到具体的可执行的文件ctags,
并将其路径赋给`Tlist_Ctags_Cmd`(例如我的路径是`/usr/local/bin/ctags/ctags`).

Pydiction
------------
```bash
    cd ~/.vim/bundle
    git clone https://github.com/rkulla/pydiction.git
```
In your vimrc file, first add the following line to enable filetype plugins:

>filetype plugin on

then make sure you set g:pydiction_location to the full path of where you installed complete-dict. Ex:

>let g:pydiction_location = '/path/to/complete-dict'

for example, if you used Pathogen to install Pydiction, you would set this to:

>let g:pydiction_location = '/home/user/.vim/bundle/pydiction/complete-dict'

vim colortheme
---------------
vim的颜色主题在`/usr/share/vim/vim74/colors`文件夹里.

打开vim后在normal模式下输入`:colorscheme`查看当前的主题，修改主题使用命令`:colorscheme mycolor`,其中mycolor是你`usr/share/vim/vim73/colors`文件夹包含的文件名.也可以把这个命令写入`~/.vimrc`配置文件中，这样每次打开Vim都是你设定的主题.

pathogen
--------------
[website](https://github.com/tpope/vim-pathogen)

pathogen是管理插件的插件.

pathogen采用了bundle的概念来管理插件，如果你熟悉OSGi或OS X，那么对bundle就不会陌生.

pathogen在`.vim`目录下建立bundle文件,所有的插件都会在该目录下管理.当Vim启动时，会自动执行`runtimepath(rtp)`列表中所包含文件夹下的vim脚本,
pathogen会在启动时把`./vim/bundle`下的文件夹中的插件按照一定顺序递归加载到rtp中，这样Vim启动时，通过pathogen管理的插件就生效了.
有了pathogen之后，一般.vim文件夹下只有三个文件夹:`autoload、bundle和doc`，其他插件将被安装在bundle文件夹下.

Syntastic
------------------
First I'll show you how to install Tim Pope's Pathogen so that it's easy to install syntastic. 
Do this in your terminal so that you get the pathogen.vim file and the directories it needs:
```bash
    mkdir -p ~/.vim/autoload ~/.vim/bundle && \
    curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
```
Next you need to add this to your ~/.vimrc:

>execute pathogen#infect()

You now have pathogen installed and can put syntastic into ~/.vim/bundle like this:

```bash
    cd ~/.vim/bundle && \
    git clone https://github.com/scrooloose/syntastic.git
```

Quit vim and start it back up to reload it, then type:

>:Helptags

If you get an error when you do this, then you probably didn't install Pathogen right. 
Go back to **Step 1** and make sure you did the following:

- Created both the ~/.vim/autoload and ~/.vim/bundle directories.
- Added the execute pathogen#infect() line to your ~/.vimrc file
- Did the git clone of syntastic inside ~/.vim/bundle
- Have permissions to access all of these directories.

Syntastic has a large number of options that can be configured, and the defaults are not particularly well suitable for new users. 
It is recommended that you start by adding the following lines to your vimrc file, 
and return to them after reading the manual (see `:help syntastic` in Vim):
```
    set statusline+=%#warningmsg#
    set statusline+=%{SyntasticStatuslineFlag()}
    set statusline+=%*

    let g:syntastic_always_populate_loc_list = 1
    let g:syntastic_auto_loc_list = 1
    let g:syntastic_check_on_open = 1
    let g:syntastic_check_on_wq = 0
    let g:syntastic_python_checkers=['pyflakes'] "make sure you have installed 'pyflakes',not use pylint, because it is realy slow. 
    let g:syntastic_enable_ballons = 1
```

colorscheme: solarized
--------------------------------
Installation:

```
    $ cd ~/.vim/bundle
    $ git clone git://github.com/altercation/vim-colors-solarized.git
```

Modify `.vimrc`

put the following two lines in your `.vimrc`:

```
    syntax enable
    set background=dark
    colorscheme solarized
```
or:

```
    syntax enable
    set background=light
    colorscheme solarized
```

I like to have a different background in GUI and terminal modes, so I can use the following if-then.

However,I find vim's background autodetection to be pretty good and, at least with MacVim, 
I can leave this background value assignment out entirely and get the same results.

```
    if has('gui_running')
    set background=light
    else
    set background=dark
    endif
```

see [the Solarized homepage](http://ethanschoonover.com/solarized) for screenshots which will help you select either the light or dark background.

IMPORTANT NOTE FOR TERMINAL USERS:
- If you are going to use Solarized in Terminal mode (i.e. `not in a GUI version like gvim or macvim`), 
  please please please consider setting your terminal emulator's colorscheme to used the Solarized palette.
  I've included palettes for some popular terminal emulator as well as Xdefaults in the official Solarized download available
  from Solarized homepage. 
- If you use Solarized without these colors, Solarized will need to be told to degrade its colorscheme to a set compatible
  with the limited 256 terminal palette (whereas by using the terminal's 16 ansi color values, you can set the correct,
  specific values for the Solarized palette).
- If you do use the custom terminal colors, solarized.vim should work out of the box for you.
- If you are using a terminal emulator that supports 256 colors and don't want to use the custom Solarized terminal colors,
  you will need to use the degraded 256 colorscheme. 
  To do so, simply add the following line before the colorschem solarized line: `let g:solarized_termcolors=256`

Again, I recommend just changing your terminal colors to Solarized values either manually or via
one of the many terminal schemes available for import.

You Complete Me
----------------------
1. `cd .vim/bundle/`
2. `git clone  git@github.com:cyrusin/YouCompleteMe.git`
3. Install development tools and CMake: `sudo apt-get install build-essential cmake`
4. Make sure you have Python headers installed: `sudo apt-get install python-dev`
5. `cd .vim/bundle/YouCompleteMe; git submodule update --init --recursive`
6. `cd .vim/bundle/YouCompleteMe; ./install.sh --clang-completer`
7. wait.......until all done
8. fix your `.vimrc`, add `let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_global_ycm_extra_conf'`
9. enjoy it .......

source: http://valloric.github.io/YouCompleteMe/

vim-markdown
-------------
I am using Pathogen, so just do this:

```bash
    cd ~/.vim/bundle
    git clone https://github.com/plasticboy/vim-markdown.git
```

details: [vim-markdown](https://github.com/plasticboy/vim-markdown)
