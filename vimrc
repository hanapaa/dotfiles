set nocompatible              " don't be compatible with vi
filetype off                  " required


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugins via Vundle
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" https://realpython.com/blog/python/vim-and-python-a-match-made-in-heaven/
" git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" Add all your plugins here (note older versions of Vundle used Bundle instead of Plugin)
Plugin 'vim-scripts/indentpython.vim'   " better Python autoindention
"Plugin 'scrooloose/syntastic'           " syntax checking
Plugin 'nvie/vim-flake8'                " PEP8 checking
"Plugin 'Valloric/YouCompleteMe'         " autocompletion
"Plugin 'tmhedberg/SimpylFold'           " code folding

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Editor behavior
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
syntax on 			            " syntax color highlighting
set ruler 			            " cursor position
set number 			            " line numbering
set colorcolumn=81 		        " column marker
set cursorline 			        " row underline
hi CursorLine NONE gui=underline guibg=NONE term=underline cterm=underline

" Syntax
highlight BadWhitespace ctermbg=red guibg=red
match BadWhitespace /\s\+$/

" Line wrapping
set wrap 			" wrap lines. 'nowrap' to stop wrapping
set textwidth=100
set formatoptions=qrn1

" Tabs
set tabstop=4                   " a tab is four spaces
set softtabstop=4               " when hitting <BS>, pretend like a tab is removed, even if spaces
set expandtab                   " expand tabs to spaces by default (overloadable per file type later)
set shiftwidth=4                " number of spaces to use for autoindenting
set shiftround                  " use multiple of shiftwidth when indenting with '<' and '>'
set autoindent
set smarttab                    " insert tabs on the start of a line according to
                                "   shiftwidth, not tabstop

" Bracket matching
set showmatch                   " set show matching parenthesis
set matchtime=2                 " show matching bracket for 0.2 seconds
set matchpairs+=<:>             " specially for html

" Searching
"set ignorecase                  " ignore case when searching
"set smartcase                   " ignore case if search pattern is all lowercase,
                                "   case-sensitive otherwise

" Code folding
"set foldmethod=syntax           " fold based on syntax
"set foldnestmax=10              " deepest fold is XX levels
"nnoremap <space> za             " enable folding with the spacebar
set nofoldenable                " don't fold by default



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vim behavior
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
colorscheme elflord

set hidden                      " hide buffers instead of closing them this means that
                                "   the current buffer can be put to background without
                                "   being written; and that marks and undo history are
                                "   preserved
set wildmenu                    " make tab completion for files/buffers act like bash
set wildmode=list:full          " show a list when pressing tab and complete
                                "   first full match
set wildignore=*.swp,*.bak,*.pyc,*.class
set title                       " change the terminal's title
set visualbell                  " don't beep
set noerrorbells                " don't beep
set showcmd                     " show (partial) command in the last line of the screen
                                "   this also shows visual selection info
set nomodeline                  " disable mode lines (security measure)
set ttyfast                     " always use a fast terminal

command! W :w                   " always type :W by mistake

"Shortcuts
map , <C-w><C-w>        " , => switch window
map \ <C-w>v            " \ => new v-split
map <C-k> :bprev<CR>
map <C-j> :bnext<CR>
map <C-l> :ls<CR>

" Automatically cd into the directory that the file is in
set autochdir


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" YouCompleteMe
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:ycm_autoclose_preview_window_after_completion=1
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" C/C++
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
au BufNewFile,BufRead *.h,*.hpp,*.c,*.cpp,*.cc
    \  set tabstop=2
    \| set softtabstop=2
    \| set shiftwidth=2
    \| set expandtab
    \| set autoindent
    \| set fileformat=unix


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Python
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
au BufNewFile,BufRead *.py
    \  set tabstop=4
    \| set softtabstop=4
    \| set shiftwidth=4
    \| set expandtab
    \| set autoindent
    \| set fileformat=unix

let python_highlight_all=1
syntax on

" virtualenv support
py << EOF
import os
import sys
if 'VIRTUAL_ENV' in os.environ:
  project_base_dir = os.environ['VIRTUAL_ENV']
  activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
  execfile(activate_this, dict(__file__=activate_this))
EOF


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Latex
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
au BufNewFile,BufRead *.cls,*.tex
    \ set filetype=tex
    \| set tabstop=2
    \| set softtabstop=2
    \| set shiftwidth=2
    \| set expandtab
    \| set autoindent
    \| set fileformat=unix
    \| set colorcolumn=101
    \| set tw=100
let g:Tex_ViewRule_pdf='Preview'
