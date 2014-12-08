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
Pydiction
------------
    cd ~/.vim/bundle
    git clone https://github.com/rkulla/pydiction.git
    Configuration

In your vimrc file, first add the following line to enable filetype plugins:

filetype plugin on

then make sure you set g:pydiction_location to the full path of where you installed complete-dict. Ex:

let g:pydiction_location = '/path/to/complete-dict'

for example, if you used Pathogen to install Pydiction, you would set this to:

let g:pydiction_location = '/home/user/.vim/bundle/pydiction/complete-dict'

and the dictionary will be available to all of your virtualenv's as well.

You can change the height of the completion menu by setting g:pydiction_menu_height in your vimrc:

let g:pydiction_menu_height = 3

The default menu height is 8, meaning 8 items at a time will be shown. Some people prefer more or less and you can make it as large as you want since it will automatically know where to position the menu to be visible.

If you want to configure other things, such as how to get Pydiction to work with other plugins like SnipMate or the color of the menu, see the Tips section of this documentation.
Usage (Plugin)

In Vim's INSERT mode, type part of a Python keyword, module name, attribute or method, then hit TAB:

raw<Tab>

will bring up a menu of possibilities, such as:

raw_input(
raw_unicode_escape_decode(
raw_unicode_escape_encode(

Pressing Tab again scrolls down the menu so you can select something else. Then type a popup-menu key:

<Space>              -- Accept current match and insert a space.
CTRL-Y               -- Accept current match and and don't insert a space.
<Enter>              -- Accept current match and insert a newline.
<ESC> or CTRL-E      -- Close the menu and do not accept any match.

You can also now use Shift-Tab to Tab backwards through the popup menu.

Typing:

os.p<Tab>

pops up:

os.pardir
os.path
os.pathconf(
os.pathconf_names
os.pathsep
os.pipe(
...

Typing:

co<Tab>

pops up:

continue
coerce(
compile(
...

Typing:

dj[Tab]

pops up:

django
django.db
django.utils
django.conf
django.template
...

Typing:

def __i<Tab>

pops up:

def __init__(
def __iter__(

You can complete modules that were imported via from module import submodule. For example:

from xml.parsers import expat
expat.P<Tab>

expands to:

expat.ParserCreate(

Python's newer import module as X syntax isn't supported by default, since it would be impossible for Pydiction to know what you'll alias a module to. However, you can either add the alias to complete-dict or just use pythoncomplete.vim's Omnicompletition by typing <C-X><C-O>. You can also use the omni-completion to complete other things that aren't in the complete-dict dictionary, such as variables:

i = 3
i.b<Ctrl-x><Ctrl-o>   # expands to: i.bit_length(

The same goes for relative import syntax. I have included a few common Django relative import words such as .models .views and .forms and you can add more.

See my Tips section below for more.

If you feel you're getting different results in your completion menu, it's probably because you don't have Vim set to ignore case. You can remedy this with ":set noic". It also helps to type at least 2 letters before hitting Tab, to help Vim narrow down what you mean to complete.
Usage (Dictionary generator)

You can skip this section if you don't plan to add more modules to complete-dict yourself. Consult complete-dict to see if it already has the modules you intend to use.

This is the Python script used to create the "complete-dict" Vim dictionary file. I have curated and bundled a default complete-dict for your use. I created it using a Linux system, so there won't be many real win32 specific modules in it. You're free to run pydiction.py to add or upgrade as many modules as you need. The dictionary file will still work if you're using windows, but it won't complete win32 related modules unless you tell it to.

USAGE: At a command prompt, run:

$ python pydiction.py <module> [<module> ...] [-v]

(You need to have at least python 2.x installed.)

Say you wanted to add a module called "mymodule" to complete-dict. Do the following:

$ python pydiction.py mymodule

You can input more than one module name on the command-line by separating them with spaces:

$ python pydiction.py mymodule1 mymodule2 mymodule3

The -v option will just write the results to stdout (standard output) instead of the complete-dict file:

$ ./pydiction.py -v datetime math

If the backup file "complete-dict.last" doesn't exist in the current directory, pydiction.py will create it for you. You should always keep a backup of your last working dictionary in case anything goes wrong, as it can get tedious having to recreate the file from scratch.

If complete-dict.last already exists, the script will ask if you want to overwrite your old backup with the new backup.

If you try to add a module that already exists in complete-dict, Pydiction will tell you it already exists, so don't worry about adding duplicates. In fact you can't add duplicates because every time pydiction.py runs it looks for and removes any duplicates in the file.

When pydiction.py adds new modules to complete-dict, it does so in two phases. First it adds the fully-qualified name of the module. For example:

module.attribute
module.method(

then it adds the non-fully qualified name:

attribute
method(

this allows you to complete your python code in the way that you imported it. E.g.:

import module

or:

from module import method

Say you want to complete "pygame.display.set_mode". If you imported Pygame using "import pygame", then you can Tab-complete using:

pygame.di<Tab>

to expand to "pygame.display.". Then type:

se<Tab>

to expand to "pygame.display.set_mode("

Now say you imported using "from pygame import display". To expand to "display.set_mode(" type:

display.se<Tab>

And if you imported using "from pygame.display import set_mode" type:

se<Tab>

Keep in mind that if you don't use fully-qualified module names then you might get a lot of possible menu options popping up, so you may want to use more than just two letters before you hit Tab, to try to narrow down the list.

As of Pydiction 1.1 there is also limited support for string type method completion. For example:

"".jo<Tab>"

will expand to:

"".join(

make sure you type at least two letters of the method name if this doesn't seem to work.

This only works for quoted strings, ie:

'foo bar'.st<Tab>

to get:

'foo bar'.startswith(

but you can't do:

s = 'foo bar'

s.st<Tab>

if you want that behavior you can still use Vim 7's omni-completion:

s.st<Ctrl-x><Ctrl-o>

which will also give you a preview window describing the methods as well as the argument list the methods take, e,g:

startswith(prefix[, start[, end]])
strip([chars])

To Tab-complete your own personal modules, you can put your functions in a separate file to be reused, as you normally would. For example, say you put the following function in a file called "myFoo.py":

def myBar():
    print "hi"

you would then need to add myFoo to complete-dict by doing:

$ ./pydiction.py myFoo

now you can complete myFoo.myBar() by doing:

myFoo.my<Tab>

Note: You don't have to restart Vim after you update complete-dict nor do you have to use the pydiction.py script to add stuff to it; it's just a text file that you can also manually edit.
