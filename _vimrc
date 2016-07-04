""更新时间：2012/12/15

"" Vundle & Plugins
" Start
set nocompatible "关闭兼容vi，启用vim模式
filetype off                  " required by Vundle

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" Add all your plugins here (note older versions of Vundle used Bundle instead of Plugin)
Plugin 'scrooloose/nerdtree'
Plugin 'kien/ctrlp.vim'
Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
Plugin 'nvie/vim-flake8'
Plugin 'vim-scripts/Pydiction'
" Plugin 'vim-scripts/indentpython.vim'
Plugin 'scrooloose/syntastic'
Plugin 'Valloric/YouCompleteMe'
Plugin 'majutsushi/tagbar'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " load filetype plugins + indentation  
" End


"" 基本配置
" set nocompatible "关闭兼容vi，启用vim模式
set showcmd	"display incomplete commands
" filetype plugin indent on	"load filetype plugins + indentation
set showmatch	"代码匹配，如(),{},[]等
set fileencodings=utf-8,gbk "打开文件时使用utf-8或gbk


"" 语法高亮与主题色
syntax enable " 打开语法高亮
syntax on " 允许按指定主题语法高亮，而非默认高亮主题


"" Whitespace and indentation
set ai " 自动缩进 same level indent
set smartindent " next level indent
set tabstop=4 shiftwidth=4 " tab=4 spaces
set expandtab " 制表符扩展为空格
set backspace=indent,eol,start " backspace through everything in insert mode


"" searching
set hlsearch	" highlight matches
set incsearch	" incremental search(实时搜索)
set ignorecase	" searches are case insensitive
set smartcase	" but when they contain at least one capital letter,use this


"" 代码折叠(za:open or close current fold; zM:close all folds; zR:open all folds)
" 各种折叠方式不兼容
" set foldmethod=syntax "按语法高亮项目进行折叠
" set foldmethod=manual 手动建立折叠
set foldmethod=indent "相同缩紧距离的行构成折叠(主要针对Python)
" set foldmethod=expr 给出每行的折叠
" set foldmethod=marker 标志用于折叠
" set foldmethod=diff 没有改变的文本构成折叠
"" 启动vim时不要自动折叠代码
set foldlevel=100


"" 根据需要增加
set nowrap " 不折行
set laststatus=2 " 显示状态行
" set cursorline 为光标所在行加下划线
set number " 显示行号
" set autoread 文件在Vim以外修改过，自动重新读入
" set helplang=cn 帮助系统设成中文

"" virtual-env
"python with virtualenv support, make vim and YCM know your VIRTUAL_ENV config
py << EOF
import os
import sys
if 'VIRTUAL_ENV' in os.environ:
  project_base_dir = os.environ['VIRTUAL_ENV']
  activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
  execfile(activate_this, dict(__file__=activate_this))
EOF


"" Plugins
"mapleader
let mapleader="," "some plugins often use some leader keys, we use ','. For example: '<leader>jd' equals to ',jd'

" PyDiction
let g:pydiction_location='~/.vim/bundle/Pydiction/complete-dict'
let g:pydiction_menu_height = 10

" YouCompleteMe
nnoremap <leader>jd :YcmCompleter GoToDefinitionElseDeclaration<CR>

" Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0 " 打开文件时不要语义检查，否则影响打开速度, 在vim中通过:SyntasticCheck命令手动检查
let g:syntastic_check_on_wq = 0
let g:syntastic_enable_ballons = 1

" Tagbar
let g:tagbar_ctags_bin='/usr/local/bin/ctags' " 使用自己安装的ctags
let g:tagbar_left = 1 " 位于项目左侧
