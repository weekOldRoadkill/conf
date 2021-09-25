" Plugins
call plug#begin("~/.vim/plugged")

Plug 'flazz/vim-colorschemes'
Plug 'sheerun/vim-polyglot'
Plug 'stefanos82/nelua.vim'
Plug 'vimsence/vimsence'

call plug#end()




" Compatibility Options
autocmd FileType * let g:vimrc=1 | source ~/.vimrc
if exists("g:vimrc")
set nocompatible




" Coloring Options
syntax on

colorscheme crayon
hi StatusLine ctermfg=11
hi CursorLineNr ctermfg=8
hi StatusLineNC ctermfg=8
hi CursorLine ctermfg=None
hi StatusLineTerm ctermbg=0 ctermfg=11
hi StatusLineTermNC ctermbg=0 ctermfg=8




" General Options
set scrolloff=512
set softtabstop=4
set history=2048
set laststatus=2
set shiftwidth=4
set autoindent
set cursorline
set noshowmode
set splitright
set expandtab
set tabstop=4
set hlsearch
set wildmenu
set hidden
set number




" Modes
let modes={
    \ "n"   : "NORMAL",
    \ "no"  : "NORMAL OPERATOR PENDING",
    \ "v"   : "VISUAL",
    \ "V"   : "V-LINE",
    \ ""  : "V-BLOCK",
    \ "s"   : "SELECT",
    \ "S"   : "S-LINE",
    \ ""  : "S-BLOCK",
    \ "i"   : "INSERT",
    \ "R"   : "REPLACE",
    \ "Rv"  : "V-REPLACE",
    \ "c"   : "COMMAND",
    \ "cv"  : "VIM EX",
    \ "ce"  : "EX",
    \ "r"   : "PROMPT",
    \ "rm"  : "MORE",
    \ "r?"  : "CONFIRM",
    \ "!"   : "SHELL",
    \ "t"   : "TERMINAL"
\}




" Status Line
set statusline=
set statusline+=\ %{modes[mode()]}  " Mode
set statusline+=\ %f                " File
set statusline+=\ %y                " File Type
set statusline+=\ [%n]%m%r%w        " Buffer Info
set statusline+=\ %=                " Separator
set statusline+=\ %{&encoding}      " File Encoding
set statusline+=\ [%{&ff}]          " File Format
set statusline+=\ %{&tabstop}       " Tab Size
set statusline+=\ 0x%02B            " Character
set statusline+=\ %p%%              " Percentage
set statusline+=\ %l:%v\            " Position




" Keybinds
tnoremap <C-Right> <C-W>:bnext<Enter>
tnoremap <C-Left> <C-W>:bprev<Enter>
nnoremap <C-Right> :bnext<Enter>
nnoremap <C-Left> :bprev<Enter>

tnoremap <A-Right> <C-W>:wincmd l<Enter>
tnoremap <A-Left> <C-W>:wincmd h<Enter>
nnoremap <A-Right> :wincmd l<Enter>
nnoremap <A-Left> :wincmd h<Enter>

tnoremap <S-Right> <C-W>:tabn<Enter>
tnoremap <S-Left> <C-W>:tabp<Enter>
nnoremap <S-Right> :tabn<Enter>
nnoremap <S-Left> :tabp<Enter>

nnoremap <S-Down> :m .+1<Enter>
nnoremap <S-Up> :m .-2<Enter>

endif
