"===============================================================================
" VIMRC
" Author: Adam William Kuipers
" Version: 2011.08.02.01
"===============================================================================

fun! MySys()
    return "linux"
endfun

"===============================================================================
" Variables
"===============================================================================

" Set 'no compatable' to ward off unexpected things that your distro might have
" made, as well as sanely reset options when re-sourcing .vimrc
set nocompatible

" Enable error files & error jumping. 
set cf

" Mouse
set mouse=a

" Tabs
set expandtab
set shiftwidth=2
set tabstop=2

" Yanks go on clipboard instead
set clipboard+=unnamed

" Beter command-line completion
set wildmode=longest:full
set wildmenu

" Allow backspacing over autoindent, linebreaks and start of insert actions
set backspace=indent,eol,start

" No more error bells
set noerrorbells

" Reset the terminal code for the visual bell. If the visualbell is set and this
" line is also included, vim will neither flash nore beep, if visualbell is
" unsel, this does nothing
"set t_vb=

" fix backspacing in insert mode
set bs=2

" Line Wrapping
set nowrap

" Wrap a word
set linebreak 

" Autoindenting
set ai
set si

" set background
set background=dark

" Status Line
if has('statusline')
    set laststatus=2
    set statusline+=\ [%{getcwd()}]
    set showcmd
    set ruler
    set statusline=[%n]\ %<%.99f\ %h%w%m%r%y%{exists('g:loaded_fugitive')?fugitive#statusline():''}%{exists('g:loaded_rvm')?rvm#statusline():''}%=%-16(\ %l,%c-%v\ %)%P
endif

"Default file types 
set ffs=unix,dos,mac

" Powerline
let g:Powerline_symbols = 'fancy'
set encoding=utf-8
"===============================================================================
" Formatting Options
"===============================================================================

behave xterm

" Attempt to determine the type of a file based on its name and possibly its
" contents. Use this to allow intelligent auto indenting for each filetype, and
" for plugins that are filetype specific
filetype indent plugin on


"==============================================================================
" Windows
" =============================================================================
if bufwinnr(1)
  map - <C-W><C-W>
  map + <S-C-W><S-C-W>
endif

"===============================================================================
" Display
"===============================================================================

" Set Color Scheme
colorscheme tir_black


" 256 colors
set t_Co=256

" Syntax highlighting
syntax on 

" Set font according to system
if MySys() == "mac"
    set gfn=Menlo:h14
    set shell=/bin/bash
elseif MySys() == "windows"
    set gfn=Bitstream\ Vera\ Sans\ Mono:h10
elseif MySys() == "linux"
    set gfn=Monaco\ for\ Powerline\ 10
    set shell=/bin/bash
endif

"  line numbers
set nu

" text wrapping
setlocal textwidth=0

"===============================================================================
" Searching
"===============================================================================

" Highlight searches (use <C-L> to temporarily turn off highlighting
nnoremap <C-L> :nohl<CR><C-L>
set hlsearch

" Incremental search, search as you type
set incsearch

" Ignore case when searching
"set ignorecase

" Ignore case when searching lowercase
set smartcase

"==========================================================================
" JAVA
"==========================================================================
au Filetype java so ~/.vim/langs/java.vim
au Filetype java set makeprg=javac\ %
au Filetype java map <F10> :!java -cp "%:p:h" "%:t:r"<Return>:copen<Return>
set errorformat=%A%f:%l:\ %m,%-Z%p^,%-C%.%#
map <F9> :make<Return>:copen<Return>
map <F7> :cprevious<Return>
map <F8> :cnext<Return>
map <F10> :run<Return>

au Filetype java setlocal cindent

" Autocomplete
au Filetype java setlocal omnifunc=javacomplete#CompleteParamsInfo

" Java Highlighting options
au Filetype java let java_highlight_all=1
au Filetype java let java_highlight_functions="style"
au Filetype java let java_allow_cpp_keywords=1 
au Filetype java hi link javaParen Comment

imap <buffer> <C-X><C-U> <C-X><C-U><C-P>
imap <buffer> <C-S-Space> <C-X><C-U><C-P>

"===============================================================================
" C/C++/Java
"===============================================================================

" Expand tabs in C with spaces
au BufRead,BufNewFile *.{c,h,cpp,hpp,java} set expandtab
au BufRead,BufNewFile *.{c,h,cpp,hppjava} set shiftwidth=4
au BufRead,BufNewFile *.{c,h,cpp,hpp,java} set tabstop=4

" 80 column line
"set cc=80

" ==========================================================================="
" RUBY"
" ==========================================================================="
au BufRead,BufNewFile *.{ruby,rb} set tabstop=2
au BufRead,BufNewFile *.{ruby,rb} set expandtab
au BufRead,BufNewFile *.{ruby,rb} set shiftwidth=2

"==============================================================================
" Assembly
"==============================================================================

" Do not expand tabs in assembly file. Make them 8 chars wide.
au BufRead,BufNewFile *.s set noexpandtab
au BufRead,BufNewFile *.s set shiftwidth=8
au BufRead,BufNewFile *.s set tabstop=8

"==============================================================================
" Mappings
"==============================================================================

map <F2> :NERDTreeToggle<CR>

inoremap <buffer> <C-X><C-U> <C-X><C-U><C-P>
inoremap <buffer> <C-S-Space> <C-X><C-U><C-P> 

" Map <Enter> to line break in normal mode, <S-Enter> to linebreak above.
map <S-Enter> O<ESC>
map <Enter> o<ESC>

" Shortcut to home directory
cnoremap $h e ~/
" Shortcut to workspace directory
cnoremap $w e ~/Projects
" Shortcut to edit ToDo list
cnoremap $td e ~/Dropbox/lists/ToDo.txt
" Shortcut to .vimrc
cnoremap $v e ~/.vimrc
" Shortcut to .gvimrc
cnoremap $g e ~/.gvimrc

" Map X to search selected text
vmap X y/<C-R>"<CR>

" <C-Backspace> to <Delete>
imap <C-Backspace> <Delete>

imap <C-L> <Delete>


" Map <C-L> (redraw screen) to also turn off search highlighting until the next
" search
noremap <C-L> :nohl<CR><C-L>
set sm

" Movement
map <up> gk
map k gk
imap <up> <C-o>gk
map <down gj
map j gj
imap <down> <C-o>gj
map E ge


" Minibuffer Explorer Settings
let g:miniBufExplMapWindowsNavVim = 1
let g:miniBufExplMapWindowNavVim = 1
let g:miniBufExplMapWindowNavArrows = 1
let g:miniBufExplMapCTabSwitchBufs = 1
let g:miniBufExplModSelTarget = 1

" alt + n or alt + p to navigate between entries in QuickFix
map <silent> <m-p> :cp <cr>
map <silent> <m-n> :cn <cr>

"=========================================================================
" CTAGS
"=========================================================================

let Tlist_Ctags_Cmd = "/usr/bin/ctags"
let Tlist_WinWidth = 50
map <F4> :TlistToggle<cr>

" Build tags libs for the current working directory
map <F3> :!/usr/bin/ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR>

"=========================================================================
" Backup"
"=========================================================================

" Backups & Files
" Enable creation of backup file
set backup
" Where backups will go.
set backupdir=~/.vim/backups
"Where temporary files will go.
set directory=~/.vim/tmp
"=========================================================================
" General
"=========================================================================

" Pathogen
call pathogen#infect()
"Sets how many lines of history VIM has to remember
set history=256
" Set auto read when a file is changed from the outside
set autoread

" Writes on make/shell commands
set autowrite

" When vimrc is edited, reload it
autocmd! bufwritepost vimrc source ~/.vimrc

" Ability to clear all buffers
function! DAR()
    let aval = char2nr('a')
    let zval = char2nr('z')
    let i = aval
    while i <= zval
        exe "let @".nr2char(i)." = \"\""
        let i = i + 1
    endw
endfu

"=========================================================================
" Word Processor
"=========================================================================

autocmd BufRead */.txt setlocal formatoptions=1
autocmd BufRead */.txt setlocal fo=atn
autocmd BufRead */.txt setlocal tw=80
autocmd BufRead */.txt setlocal lbr
autocmd BufRead */.txt map j gj
autocmd BufRead */.txt map k gk
autocmd BufRead */.txt setlocal smartindent
autocmd BufRead */.txt setlocal spelllang=en_us
autocmd BufRead */.txt setlocal spell
