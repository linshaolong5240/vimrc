set nocompatible
set encoding=utf-8

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
"Plugin 'tpope/vim-fugitive'

"Plugin 'vim-scripts/AutoComplPop'
Plugin 'flazz/vim-colorschemes'
Plugin 'kien/ctrlp.vim'
Plugin 'dyng/ctrlsf.vim'
Plugin 'vim-scripts/cscope.vim'
"Plugin 'simplyzhao/cscope_maps.vim'
Plugin 'easymotion/vim-easymotion'
Plugin 'Yggdroot/indentLine'
Plugin 'mbriggs/mark.vim'
Plugin 'vim-scripts/minibufexplorerpp'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/nerdtree'
Plugin 'luochen1990/rainbow'
Plugin 'wesleyche/SrcExpl'
Plugin 'tpope/vim-surround'
Plugin 'majutsushi/tagbar'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'justinmk/vim-syntax-extra'
Plugin 'Valloric/YouCompleteMe'
"Plugin 'rdnetto/YCM-Generator'
"
"Plugin 'spolu/dwm.vim'

"for python
Plugin 'davidhalter/jedi'
"for web
Plugin 'mattn/emmet-vim'
Plugin 'Glench/Vim-Jinja2-Syntax'

"Theme
Plugin 'dracula/vim'




" plugin from http://vim-scripts.org/vim/scripts.html
"Plugin 'L9'
" Git plugin not hosted on GitHub
"Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
"Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
"Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
"Plugin 'ascenator/L9', {'name': 'newL9'}

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
"
"
"
"{Theme setting
color dracula
"colorscheme molokai
"colorscheme Tomorrow-Night
"colorscheme Tomorrow-Night-Eighties
"colorscheme Tomorrow-Night-Bright
"colorscheme Twilight
"colorscheme wombat
"colorscheme wombat256mod
"colorscheme desert
"}
"{cscve setting
nnoremap <leader>fa :call cscope#findInteractive(expand('<cword>'))<CR>
nnoremap <leader>l :call ToggleLocationList()<CR>
"}
"{CtrlP settings
set wildignore+=*/*env,
let g:ctrlp_match_window = 'bottom,order:btt,min:1,max:10,results:99'
"}
"
"{CtrlSFP settings
""let g:ctrlsf_position = 'bottom'
let g:ctrlsf_default_root = 'project+ww'
let g:ctrlsf_extra_backend_args = {
    \ 'ag': '--cc --cpp --python'
    \ }
nmap     <C-s>f <Plug>CtrlSFPrompt
vmap     <C-s>f <Plug>CtrlSFVwordPath
vmap     <C-s>F <Plug>CtrlSFVwordExec
nmap     <C-s>n <Plug>CtrlSFCwordPath
nmap     <C-s>p <Plug>CtrlSFPwordPath
nnoremap <C-s>o :CtrlSFOpen<CR>
nnoremap <C-s>t :CtrlSFToggle<CR>
inoremap <C-s>t <Esc>:CtrlSFToggle<CR>
nmap     <C-s>l <Plug>CtrlSFQuickfixPrompt
vmap     <C-s>l <Plug>CtrlSFQuickfixVwordPath
vmap     <C-s>L <Plug>CtrlSFQuickfixVwordExec
let g:ctrlsf_mapping = {
            \ "next": "n",
            \ "prev": "N",
            \"split"   : "<leader>hs",
            \"vsplit"  : "<leader>vs",
            \ }

"Maps by default in CtrlSF window:
"
""<Enter>, <o>   Open file which contains the line under cursor.

"<C-O>          Open file in a horizontally split window.
"
""<p>            Open a preview window to view file.

"<P>            Open a preview window to view file and switch focus to it.
"
""<O>            Like <o>, but always leave CtrlSF window open.

"<T>            Like <t>, but focus CtrlSF window instead of opened new tab.
"
""<q>            Quit CtrlSF. Also close preview window if any.

"<C-J>          Move cursor to next match.
"
""<C-K>          Move cursor to previous match.

"Maps by default in preview window:
"
""<q>            Quit preview mode.
"}
"
"{NERDTree settings
nnoremap <C-e> :NERDTreeToggle<CR>
"}
"
"{ OmniCppComplete setting
"nnoremap <F12> :!ctags -R --c++-kinds=+p --fields=+liaS --extra=+q .<CR>
"nnoremap <F12> :!ctags -R --langmap=c:.c.h --c-kinds=+p --fields=+liaS --extra=+q .<CR>
"nnoremap <F12> :!ctags -R --c-kinds=+p+l+x+c+d+e+f+g+m+n+s+t+u+v --fields=+liaS --extra=+q --language-force=c .<CR>
"nnoremap <F12> :!ctags -R --c++-kinds=+p+l+x+c+d+e+f+g+m+n+s+t+u+v --fields=+liaS --extra=+q --language-force=c++ .<CR>
"}
"{rainbow settings
let g:rainbow_active = 1 "0 if you want to enable it later via :RainbowToggle
"}
"{Tagbar setting
noremap <leader>tb :TagbarToggle<CR>
"}
"{YouCompleteMe setting
let g:ycm_server_python_interpreter = 'python'
let g:ycm_python_binary_path = 'python3'
let g:ycm_auto_trigger = 1 "YCM on/off
let g:ycm_autoclose_preview_window_after_completion=1
let g:ycm_seed_identifiers_with_syntax=1    " 语法关键字补全
let g:ycm_complete_in_comments = 1 "在注释输入中补全
nnoremap <leader>jd :YcmCompleter GoToDefinitionElseDeclaration<CR>
"}
"
"{my setting
set nobackup
"use the clipboard register '*'
set clipboard=unnamed
" 总是显示状态栏
set laststatus=2
" 显示光标当前位置
set ruler
" 开启行号显示
set number
" 高亮显示当前行/列
set cursorline
set cursorcolumn
set hlsearch

syntax on
set ignorecase 

" 禁止光标闪烁
" set gcr=a:block-blinkon0
" 禁止显示滚动条
set guioptions-=l
set guioptions-=L
set guioptions-=r
set guioptions-=R
" 禁止显示菜单和工具条
" set guioptions-=m
" set guioptions-=T
" 禁止折行
set nowrap
"indent setting
filetype indent on
" 将制表符扩展为空格
 set expandtab
" 设置编辑时制表符占用空格数
 set tabstop=4
" 设置格式化时制表符占用空格数
 set shiftwidth=4
" 让 vim 把连续数量的空格视为一个制表符
set softtabstop=4

"key mapping
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
nnoremap <leader>w :w<CR>
"}
"
"{mac setting
"backspace set up for mac
set backspace=indent,eol,start
"}
