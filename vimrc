"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"=> General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"This is first because it affects other options
set nocompatible

"Sets how many lines of history VIM has to remember
set history=700

"Aliases for commonly mistyped commands
:command W w
:command Q q
:command WQ wq
:command Wq wq
:command Wsu :execute ':silent w !sudo tee % > /dev/null' | :edit!

"Enable Pathogen and plugins in bundle directory
filetype off
source ~/dotfiles/vim/autoload/pathogen.vim
execute pathogen#infect()
execute pathogen#helptags()

"Fast comment/uncomment lines with \cc / \cu
":map \cc :s/^/# /g<CR>:let @/ = ""<CR>
":map \cu :s/^# //g<CR>:let @/ = ""<CR>
" Jedi vim Python
packloadall
let g:SuperTabDefaultCompletionType = "context"
let g:jedi#auto_vim_configuration = 0
let g:jedi#use_tabs_not_buffers = 1
let g:jedi#popup_on_dot = 0
let g:pymode_rope = 0
let g:jedi#show_call_signatures = "0"

"Enable filetype plugins
filetype plugin on
filetype indent on

"Map pastetoggle to F2
set pastetoggle=<F2>

"Enable mouse and positioning options
set ruler
set showcmd
set cursorline
set relativenumber
set updatetime=250

"Open new split windows on the right or below the current one
set splitbelow
set splitright

"Set 7 lines to the cursor - when moving vertically using j/k
set so=7

"Height of the command bar
set cmdheight=2

"Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

"When searching try to be smart about cases 
set smartcase

"Highlight search results
set hlsearch

"Makes search act like search in modern browsers
set incsearch

"Show matching brackets when text indicator is over them
set showmatch

"Enable syntax and current line highlighting
syntax on
"set cul
"hi CursorLine term=none cterm=none ctermbg=7

"Set backup and temporary files directories 
set backup
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set backupskip=/tmp/*,/private/tmp/*
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set writebackup


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Be smart when using tabs ;)
set smarttab

"1 tab = 4 spaces
set shiftwidth=4
set tabstop=4

"Use spaces instead of tabs
set expandtab

"Set a red line at columns 80 and 120
"set colorcolumn=80,120

set ai "Auto indent
set si "Smart indent
set wrap "Wrap lines

"Remove the Windows ^M - when the encodings gets messed up
noremap <Leader>m mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm

"Folding for Python
set foldmethod=indent
nnoremap <space> za
vnoremap <space> zf
