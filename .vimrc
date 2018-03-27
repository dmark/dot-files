set nocompatible            " be iMproved, required
filetype off                " required

" set the run time path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" all plugins must be listed between vundle#begin() and vundle#end()
Bundle 'VundleVim/Vundle.vim'

" add additional plugins below this line
" https://github.com/Lokaltog/vim-powerline -- DEPRECATED
"Bundle 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
" https://github.com/powerline/powerline -- replaced with system wide
" powerline installation via pip. See below.
"Bundle 'powerline/powerline', {'rtp': 'powerline/bindings/vim/'}
" https://github.com/tpope/vim-fugitive -- git integration
Bundle 'tpope/vim-fugitive'
" https://github.com/scrooloose/nerdtree -- file browser, bound to F2 (see
" below)
Bundle 'scrooloose/nerdtree'
" https://github.com/python-mode/python-mode -- Vim as Python IDE
Bundle 'klen/python-mode'
" https://github.com/davidhalter/jedi-vim -- Python autocompletion
Bundle 'davidhalter/jedi-vim'

" colorschemes
" https://github.com/jnurmine/Zenburn
Bundle 'jnurmine/Zenburn'
" https://github.com/altercation/vim-colors-solarized
Bundle 'altercation/vim-colors-solarized'
" add additional plugins above this line

" all of you plugins must be added before this line
call vundle#end()           " required
filetype plugin indent on   " required

" enable Powerline from system wide pip installation
python3 from powerline.vim import setup as powerline_setup
python3 powerline_setup()
python3 del powerline_setup

" Powerline setup
set guifont=Inconsolata\ for\ Powerline\ 9
set laststatus=2

" python-mode setup
" Activate rope
" Keys:
" K             Show python docs
" <Ctrl-Space>  Rope autocomplete
" <Ctrl-c>g     Rope goto definition
" <Ctrl-c>d     Rope show documentation
" <Ctrl-c>f     Rope find occurrences
" <Leader>b     Set, unset breakpoint (g:pymode_breakpoint enabled)
" [[            Jump on previous class or function (normal, visual, operator modes)
" ]]            Jump on next class or function (normal, visual, operator modes)
" [M            Jump on previous class or method (normal, visual, operator modes)
" ]M            Jump on next class or method (normal, visual, operator modes)

" deactivate rope -- we're using jedi-vim
let g:pymode_rope = 0

" Documentation
let g:pymode_doc = 1
let g:pymode_doc_key = 'K'

"Linting
let g:pymode_lint = 1
let g:pymode_lint_checker = "pyflakes,pep8"
" Auto check on save
let g:pymode_lint_write = 1

" Support virtualenv
let g:pymode_virtualenv = 1

" Enable breakpoints plugin
let g:pymode_breakpoint = 1
let g:pymode_breakpoint_bind = '<leader>b'

" syntax highlighting
let g:pymode_syntax = 1
let g:pymode_syntax_all = 1
let g:pymode_syntax_indent_errors = g:pymode_syntax_all
let g:pymode_syntax_space_errors = g:pymode_syntax_all

" Don't autofold code
let g:pymode_folding = 0

" NERDTree setup
map <F2> :NERDTreeToggle<CR>

" enable syntax highlighting
syntax on

" show line numbers
set number

" set tabs to have 4 spaces
set tabstop=8
set softtabstop=4

" indent when moving to the next line while writing code
set autoindent

" expand tabs into spaces
set expandtab

" when using the >> or << commands, shift lines by 4 spaces
set shiftwidth=4

" show a visual line under the cursor's current line
set cursorline

" show the matching part of the pair for [] {} and ()
set showmatch

" enable all Python syntax highlighting features
let python_highlight_all=1

" set the colorscheme
set background=dark
colorscheme zenburn

" show invisible characters
set list listchars=tab:▷⋅,trail:⋅,nbsp:⋅

" intelligent indentation
au FileType py set autoindent
au FileType py set smartindent
au FileType py set textwidth=79

" level up the status line
"set statusline=%F%m%r%h%w\ [TYPE=%Y\ %{&ff}]\ \ [%l/%L\ (%p%%)

set wildmenu
set wildmode=longest:full,full
