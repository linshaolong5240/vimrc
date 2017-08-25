"{ mysetting
set nocompatible              " be iMproved, required
set encoding=utf-8
"no backup file
set nobackup
set nowritebackup
"set leader  key to space key
let mapleader="\<Space>"
"use the clipboard register '*'
set clipboard=unnamed
"黑色背景
set background=dark
" 总是显示状态栏
set laststatus=2
" 显示光标当前位置
set ruler
" 开启行号显示
set number
" 高亮显示当前行/列
set cursorline
"set cursorcolumn
"高亮搜索
set hlsearch

syntax on
"忽略大小写
set ignorecase 

" 禁止光标闪烁
set gcr=a:block-blinkon0
" 禁止显示滚动条
set guioptions-=l
set guioptions-=L
set guioptions-=r
set guioptions-=R
" 禁止显示菜单和工具条
set guioptions-=m
set guioptions-=T
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
set backspace=indent,eol,start

"}

if has('win32')
    call plug#begin('$HOME\vimfiles\plugged')
else
    call plug#begin('~/.vim/plugged')
endif

"for UI
Plug 'scrooloose/nerdtree'
Plug 'rafi/awesome-vim-colorschemes'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'Yggdroot/indentLine'
Plug 'mbriggs/mark.vim'
Plug 'luochen1990/rainbow'
Plug 'kshenoy/vim-signature'
Plug 'majutsushi/tagbar'
Plug 'justinmk/vim-syntax-extra'


"for search
Plug 'kien/ctrlp.vim'
Plug 'dyng/ctrlsf.vim'
Plug 'easymotion/vim-easymotion'

"for complete
Plug 'brookhong/cscope.vim'
Plug 'jsfaint/gen_tags.vim'
"Plug 'Valloric/YouCompleteMe'
Plug 'vim-scripts/AutoComplPop'
Plug 'davidhalter/jedi-vim'

"for edit
Plug 'terryma/vim-multiple-cursors'
Plug 'scrooloose/nerdcommenter'
Plug 'tpope/vim-surround'

"for align
Plug 'godlygeek/tabular'

"for web
Plug 'Valloric/MatchTagAlways'
Plug 'Glench/Vim-Jinja2-Syntax'
Plug 'mattn/emmet-vim'

call plug#end()

"AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
"AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
"airline setting
"{
set guifont=DejaVu_Sans_Mono_for_Powerline:h11

let g:airline#extensions#tagbar#enabled = 1
let g:airline#extensions#tabline#enabled = 1

let g:airline#extensions#tabline#buffer_idx_mode = 1
nmap <leader>1 <Plug>AirlineSelectTab1
nmap <leader>2 <Plug>AirlineSelectTab2
nmap <leader>3 <Plug>AirlineSelectTab3
nmap <leader>4 <Plug>AirlineSelectTab4
nmap <leader>5 <Plug>AirlineSelectTab5
nmap <leader>6 <Plug>AirlineSelectTab6
nmap <leader>7 <Plug>AirlineSelectTab7
nmap <leader>8 <Plug>AirlineSelectTab8
nmap <leader>9 <Plug>AirlineSelectTab9
nmap <leader>- <Plug>AirlineSelectPrevTab
nmap <leader>= <Plug>AirlineSelectNextTab

nmap <leader>b :bd<CR>

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
" powerline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''


"configure separators for the tabline only. >
let g:airline#extensions#tabline#left_sep = ''
let g:airline#extensions#tabline#left_alt_sep = ''
let g:airline#extensions#tabline#right_sep = ''
let g:airline#extensions#tabline#right_alt_sep = ''
"}
"
"AutoComplPop
let g:acp_behaviorKeywordLength = 1  

"CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC
"CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC
" 让配置变更立即生效
"colorscheme dracula
colorscheme gruvbox
"colorscheme molokai
"colorscheme Tomorrow-Night
"colorscheme Tomorrow-Night-Eighties
"colorscheme Tomorrow-Night-Bright
"colorscheme Twilight
"colorscheme wombat
"colorscheme wombat256mod
"colorscheme desert

"{cscope setting
"<C-]> 不会应为cscope 存在而直接跳转，会显示列表选择
set cscopetag " 使支持用 Ctrl+]  和 Ctrl+t 快捷键在代码间跳来跳去
"显示路径层数
set cspc=3
" 正向遍历同名标签
nmap <Leader>tn :tnext<CR>
" 反向遍历同名标签
nmap <Leader>tp :tprevious<CR>
nnoremap <leader>fa :call CscopeFindInteractive(expand('<cword>'))<CR>
nnoremap <leader>l :call ToggleLocationList()<CR>

" s: Find this C symbol
nnoremap  <leader>fs :call CscopeFind('s', expand('<cword>'))<CR>
" g: Find this definition
nnoremap  <leader>fg :call CscopeFind('g', expand('<cword>'))<CR>
" d: Find functions called by this function
nnoremap  <leader>fd :call CscopeFind('d', expand('<cword>'))<CR>
" c: Find functions calling this function
nnoremap  <leader>fc :call CscopeFind('c', expand('<cword>'))<CR>
" t: Find this text string
nnoremap  <leader>ft :call CscopeFind('t', expand('<cword>'))<CR>
" e: Find this egrep pattern
nnoremap  <leader>fe :call CscopeFind('e', expand('<cword>'))<CR>
" f: Find this file
nnoremap  <leader>ff :call CscopeFind('f', expand('<cword>'))<CR>
" i: Find files #including this file
nnoremap  <leader>fi :call CscopeFind('i', expand('<cword>'))<CR>
"}
"
"{ctags setting 
"nnoremap <F12> :!ctags -R --c++-kinds=+p --fields=+liaS --extra=+q .<CR>
"nnoremap <F12> :!ctags -R --langmap=c:.c.h --c-kinds=+p --fields=+liaS --extra=+q .<CR>
"nnoremap <F12> :!ctags -R --langmap=c:.c.h --c-kinds=+p+l+x+c+d+e+f+g+m+n+s+t+u+v --fields=+liaS --extra=+q --language-force=c .<CR>
"nnoremap <F12> :!ctags -R --c++-kinds=+p+l+x+c+d+e+f+g+m+n+s+t+u+v --fields=+liaS --extra=+q --language-force=c++ .<CR>
"}

"{CtrlP settings
let g:ctrlp_custom_ignore = {
            \ 'dir':  '\v[\/](bin|lst|venv|__pycache__)$',
            \ 'file': '\v\.(exe|so|dll)$',
            \ 'link': 'SOME_BAD_SYMBOLIC_LINKS',
            \ }
let g:ctrlp_match_window = 'bottom,order:btt,min:1,max:10,results:99'
"}

"{CtrlSFP settings
"let g:ctrlsf_position = 'bottom'
let g:ctrlsf_default_root = 'project+ww'
let g:ctrlsf_extra_backend_args = {
    \ 'ag': '--cc --cpp --python --html --css'
    \ }
nmap     <leader>sf <Plug>CtrlSFPrompt
vmap     <leader>sf <Plug>CtrlSFVwordPath
vmap     <leader>sF <Plug>CtrlSFVwordExec
nmap     <leader>sn <Plug>CtrlSFCwordPath
nmap     <leader>sp <Plug>CtrlSFPwordPath
nnoremap <leader>so :CtrlSFOpen<CR>
nnoremap <leader>st :CtrlSFToggle<CR>
inoremap <leader>st <Esc>:CtrlSFToggle<CR>
nmap     <leader>sl <Plug>CtrlSFQuickfixPrompt
vmap     <leader>sl <Plug>CtrlSFQuickfixVwordPath
vmap     <leader>sL <Plug>CtrlSFQuickfixVwordExec
let g:ctrlsf_mapping = {
            \ "next": "n",
            \ "prev": "N",
            \"split"   : "<leader>hs",
            \"vsplit"  : "<leader>vs",
            \ }

"Maps by default in CtrlSF window:

"<Enter>, <o>   Open file which contains the line under cursor.

"<C-O>          Open file in a horizontally split window.

"<p>            Open a preview window to view file.

"<P>            Open a preview window to view file and switch focus to it.

"<O>            Like <o>, but always leave CtrlSF window open.

"<T>            Like <t>, but focus CtrlSF window instead of opened new tab.

"<q>            Quit CtrlSF. Also close preview window if any.

"<C-J>          Move cursor to next match.

"<C-K>          Move cursor to previous match.

"Maps by default in preview window:

"<q>            Quit preview mode.
"}

"GGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGG
"GGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGG
"gen_tags settings
"{
let g:ctags_opts = '--langmap=c:.c.h --c-kinds=+p+l+x+c+d+e+f+g+m+n+s+t+u+v --fields=+liaS --extra=+q --language-force=c --exclude=Lst'
nnoremap <F12> :GenCtags<CR>
":ClearGTAGS
"ctrl+] is the default mapping support by Vim for definition
"The following mapping is set for GTAGS find function which use cscope interface (if_cscope).
"Ctrl+\ c    Find functions calling this function
"Ctrl+\ d    Find functions called by this function
"Ctrl+\ e    Find this egrep pattern
"Ctrl+\ f    Find this file
"Ctrl+\ g    Find this definition
"Ctrl+\ i    Find files #including this file
"Ctrl+\ s    Find this C symbol
"Ctrl+\ t    Find this text string
"
"MatchTagAlways
nnoremap <leader>% :MtaJumpToOtherTag<cr>
"
"{NERDTree settings
nnoremap <leader>e :NERDTreeToggle<CR>
let NERDTreeIgnore=['\.vim$', '\~$', 'venv$', '__pycache__$', 'migrations']
"}
"
"python-syntax
"{
let python_highlight_all = 1
"}

"{rainbow settings
let g:rainbow_active = 1 "0 if you want to enable it later via :RainbowToggle
"}

"SSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSS
"SSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSS
"
"signature 
" mx           Toggle mark 'x' and display it in the leftmost column
" dmx          Remove mark 'x' where x is a-zA-Z
" 
" m,           Place the next available mark
" m.           If no mark on line, place the next available mark. Otherwise, remove (first) existing mark.
" m-           Delete all marks from the current line
" m<Space>     Delete all marks from the current buffer
" ]`           Jump to next mark
" [`           Jump to prev mark
" ]'           Jump to start of next line containing a mark
" ['           Jump to start of prev line containing a mark
" `]           Jump by alphabetical order to next mark
" `[           Jump by alphabetical order to prev mark
" ']           Jump by alphabetical order to start of next line having a mark
" '[           Jump by alphabetical order to start of prev line having a mark
" m/           Open location list and display marks from current buffer
" 
" m[0-9]       Toggle the corresponding marker !@#$%^&*()
" m<S-[0-9]>   Remove all markers of the same type
" ]-           Jump to next line having a marker of the same type
" [-           Jump to prev line having a marker of the same type
" ]=           Jump to next line having a marker of any type
" [=           Jump to prev line having a marker of any type
" m?           Open location list and display markers from current buffer
" m<BS>        Remove all markers

"{tagbar setting
nnoremap <leader>tb :TagbarToggle<CR>
"}
"
"YYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYY
"YYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYY

let g:ycm_filetype_blacklist = {
\  'tagbar' : 1,
\  'nerdtree' : 1,
\}
" YCM need python2 or python3
"let g:ycm_path_to_python_interpreter='/usr/bin/python'
"let g:ycm_path_to_python_interpreter='C:/MySoftware/Python27/python'
"let g:ycm_path_to_python_interpreter='/usr/bin/python3'
"let g:ycm_path_to_python_interpreter='C:/Program Files/Python35-32/python'
"
" complete by python2 or python3
"let g:ycm_python_binary_path='/usr/bin/python'
"let g:ycm_python_binary_path='C:/MySoftware/Python27/python'
"let g:ycm_python_binary_path='/usr/bin/python3'
let g:ycm_python_binary_path='python'
if has('win32')
    let g:ycm_global_ycm_extra_conf='$HOME\.ycm_extra_conf.py'
endif
" disable boring syntax check
let g:ycm_show_diagnostics_ui=0
let g:ycm_register_as_syntastic_checker=0
let g:ycm_confirm_extra_conf=0

" complete strings and comments
let g:ycm_complete_in_strings=1
let g:ycm_complete_in_comments=1

let g:ycm_collect_identifiers_from_tags_files=1
let g:ycm_collect_identifiers_from_comments_and_strings=1
let g:ycm_seed_identifiers_with_syntax=1
" 输入第2个字符开始补全
let g:ycm_min_num_of_chars_for_completion=2
" 禁止缓存匹配项,每次都重新生成匹配项
let g:ycm_cache_omnifunc=0

" key mappings
nnoremap<leader>gl :YcmCompleter GoToDeclaration<CR>
nnoremap<leader>gf :YcmCompleter GoToDefinition<CR>
nnoremap<leader>gg :YcmCompleter GoToDefinitionElseDeclaration<CR>
"mac settting
if has('mac')
    "backspace set up for mac
    set backspace=indent,eol,start
endif

"custom key mapping
inoremap jj <Esc>
nnoremap <C-f> <C-d>
nnoremap <C-b> <C-u>
nnoremap <leader>h <C-w>h
nnoremap <leader>j <C-w>j
nnoremap <leader>k <C-w>k
nnoremap <leader>l <C-w>l
nnoremap <leader>w :w<CR>
nnoremap <leader>wa :wa<CR>
nnoremap <leader>q :q<CR>
nnoremap <leader>qa :qa<CR>
nnoremap <leader>w=  :resize +3<CR>
nnoremap <leader>w-  :resize -3<CR>
nnoremap <leader>,  :vertical resize -3<CR>
nnoremap <leader>.  :vertical resize +3<CR>
nnoremap <leader>nh :nohl<CR>
