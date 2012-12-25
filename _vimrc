""更新时间：2012/12/15

set nocompatible "关闭兼容vi，启用vim模式

set showcmd	"display incomplete commands
filetype plugin indent on	"load filetype plugins + indentation
set showmatch	"代码匹配，如(),{},[]等
set fileencodings=utf-8,gbk "打开文件时使用utf-8或gbk

""语法高亮与主题色
syntax enable "打开语法高亮
syntax on "允许按指定主题语法高亮，而非默认高亮主题
color morning "指定配色方案

""Whitespace and indentation
set ai "自动缩进 same level indent
set smartindent "next level indent
set tabstop=4 shiftwidth=4 "tab=4 spaces
set expandtab
set backspace=indent,eol,start "backspace through everything in insert mode

""searching
set hlsearch	"highlight matches
set incsearch	"incremental search(实时搜索)
set ignorecase	"searches are case insensitive
set smartcase	"but when they contain at least one capital letter,use this

""代码折叠(za:open or close current fold; zM:close all folds; zR:open all folds)
"set foldmethod=syntax "按语法高亮项目进行折叠
"set foldmethod=manual 手动建立折叠
set foldmethod=indent "相同缩紧距离的行构成折叠(主要针对Python)
"set foldmethod=expr 给出每行的折叠
"set foldmethod=marker 标志用于折叠
"set foldmethod=diff 没有改变的文本构成折叠
""启动vim时不要自动折叠代码
set foldlevel=100

""根据需要增加
"set nowrap 不折行
set laststatus=2 "显示状态行
"set cursorline 为光标所在行加下划线
"set number 显示行号
"set autoread 文件在Vim以外修改过，自动重新读入
"set helplang=cn 帮助系统设成中文


""plugins
call pathogen#infect() "use pathogen plugin
"powerline{
set guifont=PowerlineSymbols\ for\ Powerline
set t_Co=256
let g:Powerline_symbols = 'unicode'
"}
"Taglist{
let Tlist_Ctags_Cmd="/usr/bin/ctags-exuberant"
"}
"turn on Omni completion{
autocmd FileType c set ofu=ccomplete#Complete
autocmd FileType python set ofu=pythoncomplete#Complete
autocmd FileType javascript set ofu=javascriptcomplete#CompleteJS
autocmd FileType html set ofu=htmlcomplete#CompleteTags
autocmd FileType css set ofu=csscomplete#CompleteCSS
autocmd FileType xml set ofu=xmlcomplete#CompleteTags
"}
"PyDiction{
let g:pydiction_location = '~/.vim/bundle/pydiction-1.2/complete-dict'
let g:pydiction_menu_height = 20
"}
"PEP8{
let g:pep8_map = '<leader>8'
"}