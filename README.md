My vim
=======
This is my vim `configuration` and `plugins`.
Use "vundle" to manage the plugins.Make sure the version of vim > 7.3.

Vim 7.4
----------
Run: `vim --version` to check the version of vim. To install vim7.4

On MacOS:
Run:

```bash
    brew update
    brew install vim
```

to install vim7.4.
Then add alias in your shell config:
if use `zsh`, add "alias vim={vim7.4 bin installed before by brew}" to use vim7.4 instead of the default vim7.3.

On Ubuntu:
use `apt-get` or just compile from the source code of vim to install vim7.4

Install Vundle
--------------
Run:

```bash
    git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
```

Then add this to your `.vimrc`:

```bash
    set nocompatible              " required
    filetype off                  " required

    " set the runtime path to include Vundle and initialize
    set rtp+=~/.vim/bundle/Vundle.vim
    call vundle#begin()

    " alternatively, pass a path where Vundle should install plugins
    "call vundle#begin('~/some/path/here')

    " let Vundle manage Vundle, required
    Plugin 'gmarik/Vundle.vim'

    " Add all your plugins here (note older versions of Vundle used Bundle instead of Plugin)
    " All of your Plugins must be added before the following line
    call vundle#end()            " required
    filetype plugin indent on    " required
```

After install Vundle, when you want to install other plugins, just put`Plugin '...'` in your `.vimrc`.
Then open vim, and run `:PluginInstall` to install them.

Config
-----
Copy the `_vimrc` to `.vimrc`, and move it to your `$HOME`.

Plugins
-------
Less is more.

Just use what you need.

So start with not too many plugins.

NERDTree
--------------
Add:

```bash
    Plugin 'scrooloose/nerdtree'
```
to your `.vimrc`.

Powerline
--------------
Add:

```bash
    Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
```

to your `.vimrc`.
注意：仅仅添加配置不够，需要下载响应字体使得powerline使用patched的字体，否则无法显示箭头等特效。
首先, 下载相关字体文件,运行:

```bash
    git clone git@github.com:powerline/fonts.git
```
然后进入目录,运行:

```bash
    ./install.sh
```
随后，如果用MacOS, 可以打开iTerm2的配置，将字体切换为带powerline的。如：`Droid Sans Mono for Powerline`.
注意，可以在设置字号的时候，让normal字号比non-ascii字号大一个数，这样powerline的显示条里箭头不会伸出来。

CtrP
------
类似Command-T的快速搜索工具, 使用`Control+P`启动模糊匹配。

```bash
   Plugin 'kien/ctrlp.vim'
```

Taglist
-------------
首先是`ctags`的安装，推荐使用`exuberant ctags`，我们可以从其[官方网站](http://ctags.sourceforge.net/)上下载它的源码包,进行解压缩，编译，安装即可.

具体过程如下:

到解压后文件的路径,在编译前执行configure可执行文件，configure程序将检测系统配置情况:

```
    ./configure
```

完成配置以后会得到一个配置文件，用于make编译时使用.接下来使用make开始编译源代码:

```
    make
```

ps: 接下来的命令我们要使用到**root**权限，注意切换.

编译后我们使用ctags自带的创建目录命令来创建ctags的安装目录:

```
    ./makeinstalldirs
```

最后使用`make install`来进行安装:

```
    make install
```

下面我们来进行taglist的安装，同ctags的安装一样这里我们也是去其官方网站下载解压其源码包.
执行：`which ctags` 看看路径,在`~/.vimrc`中加入以下配置语句:

```
    let Tlist_Ctags_Cmd="/usr/local/bin/ctags"
```

在这里需要注意的是我们需要察看ctags可执行可执行路径到底是在哪里,我们可以进入到上述目录,一直找到具体的可执行的文件ctags,
并将其路径赋给`Tlist_Ctags_Cmd`(例如我的路径是`/usr/local/bin/ctags/ctags`).


Flake-8
---------

```bash
    Plugin 'nvie/vim-flake8'
```
Then you should have `flake8` installed in you os:

```bash
    pip install flake8
```
 
Pydiction
------------

```bash
    Plugin 'vim-scripts/Pydiction'
```

In your vimrc file, first add the following line to enable filetype plugins:

```bash
    filetype plugin on
```

Then make sure you set `g:pydiction_location` to the full path of where you installed complete-dict. Ex:

```bash
    let g:pydiction_location = '/path/to/complete-dict'
```

Syntastic
------------------

```bash
    Plugin 'scrooloose/syntastic'
```

Quit vim and start it back up to reload it, then type:

```bash
    :Helptags
```

Syntastic has a large number of options that can be configured, and the defaults are not particularly well suitable for new users. 
It is recommended that you start by adding the following lines to your vimrc file, 
and return to them after reading the manual (see `:help syntastic` in Vim):

```bash
    set statusline+=%#warningmsg#
    set statusline+=%{SyntasticStatuslineFlag()}
    set statusline+=%*

    let g:syntastic_always_populate_loc_list = 1
    let g:syntastic_auto_loc_list = 1
    " 打开文件时不做语义检查，否则影响打开速度，在vim中通过:SyntasticCheck命令手动检查
    let g:syntastic_check_on_open = 0
    let g:syntastic_check_on_wq = 0
    "make sure you have installed 'pyflakes', do not use pylint, because it is realy slow. 
    " let g:syntastic_python_checkers=['pyflakes']
    let g:syntastic_enable_ballons = 1
```

Syntastic默认使用`flake8`来检查Python代码的语义，所以之前安装`vim-flake8`时已经安装了flake8，在.vimrc中没有必要再声明python-chekers了。
针对某个文件可以通过`:SyntasticInfo`查看当前文件类型支持的checker以及我们声明的checker是哪些。

Colorscheme: Solarized
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
On MacOS and use vundle:

```bash
    Plugin 'Valloric/YouCompleteMe'
```

Then open vim and Run:

```bash
    :PluginInstall
```

如果安装过程较长，且卡在某个地方无法完成，可以暂停进程，之后进入YCM的目录，在目录里通过检查git仓库的完整性来补充未完成的安装。运行以下命令即可:

```bash
    git submodule update --init --recursive
```

Then install cmake:

```bash
    brew install cmake
```

安装Cmake后，进入YCM的目录里，运行如下命令安装必要的C库(用于C系语言的补全):

```bash
    ./install.py --clang-completer
```

安装完成后，打开vim，若不报错，则安装成功。

On Ubuntu:

1. `cd .vim/bundle/`
2. `git clone  git@github.com:cyrusin/YouCompleteMe.git`
3. Install development tools and CMake: `sudo apt-get install build-essential cmake`
4. Make sure you have Python headers installed: `sudo apt-get install python-dev`
5. `cd .vim/bundle/YouCompleteMe; git submodule update --init --recursive`
6. `cd .vim/bundle/YouCompleteMe; ./install.sh --clang-completer`
7. wait.......until all done
8. fix your `.vimrc`, add `let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_global_ycm_extra_conf'`
9. enjoy it .......

Virtual-env: put this in your `.vimrc`, let vim and ycm knows your virtual-env config:

```bash
    "python with virtualenv support
    py << EOF
    import os
    import sys
    if 'VIRTUAL_ENV' in os.environ:
        project_base_dir = os.environ['VIRTUAL_ENV']
        activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
        execfile(activate_this, dict(__file__=activate_this))
    EOF
```

source: http://valloric.github.io/YouCompleteMe/

Tagbar
---------

On Mac:

不使用macOS自带的ctags(/usr/bin/ctags)，使用brew安装ctags:

```bash
    brew install ctags
```

使用brew安装的软件都在`/usr/local/bin`里，确保你的PATH环境变量里`/usr/local/bin`被放在开始的位置。

将如下的配置加入`.vimrc`:

```bash
    Plugin 'majutsushi/tagbar'
```

运行:

```bash
    :PluginInstall
```

将tagbar的配置加入`.vimrc`:

```bash
   let g:tagbar_ctags_bin='/usr/local/bin/ctags' " 使用brew安装的ctags
   let g:tagbar_left = 1 " 位于左侧
```

Vim-go
-----------
source: https://github.com/fatih/vim-go

Add this to `.vimrc`:

```bash
    Plugin 'fatih/vim-go'
```
Then run ":GoInstallBinaries" in vim, this will cost a long time to install all plugins, and vim will display some error infos, don't care about them and just wait vim to finish the installing.

If you have Syntastic installed, add this config to make vim-go work well with Syntastic:

```bash
    collect errors when use multple checkers
    let g:syntastic_aggregate_errors = 1
    " 以下是兼容vim-go
    let g:syntastic_go_checkers = ['go', 'gofmt', 'golint']
    let g:syntastic_mode_map = { 'mode': 'active', 'passive_filetypes': ['go'] }
```

为了保证打开和关闭文件的速度，打开和关闭文件时不自动进行语法检查，通过在vim里先`:w`保存文件后，运行`:SyntasticCheck`来检查语法。

语法高亮:

```bash
    let g:go_highlight_functions = 1
    let g:go_highlight_methods = 1
    let g:go_highlight_fields = 1
    let g:go_highlight_types = 1
    let g:go_highlight_operators = 1
    let g:go_highlight_build_constraints = 1
```

其他按需打开:

```bash
    let g:go_fmt_command = "goimports" " 保存文件(:w :wq)时自动插入包、自动格式化代码
    " let g:go_fmt_fail_silently = 1 " By default vim-go shows errors for the fmt command, to disable it
    " let g:go_fmt_autosave = 0 " Disable auto fmt on save
    " let g:go_get_update = 0 " Disable updating dependencies when installing/updating binaries
    " When use Syntastic, the location list window that contains the output of commands such as :GoBuild and :GoTest might not appear.
    " To resolve this:
    let g:go_list_type = "quickfix"
```

vim-go安装的各插件位于`$GOBIN`里，如果这个没配，默认是`$GOPATH/bin`，各插件的用法:

- 新起一行输入fmt.，然后ctrl+x, ctrl+o，Vim 会弹出补齐提示下拉框，不过并非实时跟随的那种补齐，这个补齐是由gocode提供的。
- 输入一行代码：time.Sleep(time.Second)，执行:GoImports，Vim会自动导入time包。
- 将光标移到Sleep函数上，执行:GoDef或命令模式下敲入gd，Vim会打开$GOROOT/src/time/sleep.go中 的Sleep函数的定义。执行:b 1返回到hellogolang.go。
- 执行:GoLint，运行golint在当前Go源文件上。
- 执行:GoDoc，打开当前光标对应符号的Go文档。
- 执行:GoVet，在当前目录下运行go vet在当前Go源文件上。
- 执行:GoRun，编译运行当前main package。
- 执行:GoBuild，编译当前包，这取决于你的源文件，GoBuild不产生结果文件。
- 执行:GoInstall，安装当前包。
- 执行:GoTest，测试你当前路径下地`_test.go`文件。
- 执行:GoCoverage，创建一个测试覆盖结果文件，并打开浏览器展示当前包的情况。
- 执行:GoErrCheck，检查当前包种可能的未捕获的errors。使用`errcheck`。
- 执行:GoFiles，显示当前包对应的源文件列表。
- 执行:GoDeps，显示当前包的依赖包列表。
- 执行:GoImplements，显示当前类型实现的interface列表。
- 执行:GoRename [to]，将当前光标下的符号替换为[to]。
