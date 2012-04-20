" nocompatible needs to stay relatively close to beginning.
set nocompatible
" TODO: Verify: pathogen won't initialize correctly with 'filetype on'. 
filetype off
" Load all plugins in ~/.vim/bundle
call pathogen#infect() 
" syntax highlighting
syntax on      
"call pathogen#runtime_append_all_bundles()
filetype plugin indent on

autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
"set ofu=syntaxcomplete#Complete  " This line may be obsolete

" Allow tab completion to suggest based on context.
let g:SuperTabDefaultCompletionType = "context"

" Enable completion menu and pydoc preview
set completeopt=menuone,longest,preview

runtime macros/matchit.vim

set modelines=0
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab

"Solarized color scheme
"set background=dark
"colorscheme solarized

set encoding=utf-8
set scrolloff=3
set autoindent
set showmode
set showcmd
set hidden
set wildmenu
set wildmode=list:longest
set visualbell
set cursorline
set ttyfast
set ruler
set backspace=indent,eol,start
set laststatus=2
set relativenumber
set undofile

" Set regex search to 'very magic' (minimizes escaping).
nnoremap / /\v
vnoremap / /\v

set ignorecase
set smartcase
set gdefault
set incsearch
set showmatch
set hlsearch

set wrap
set textwidth=79
set formatoptions=qrn1
set colorcolumn=85

nnoremap j gj
nnoremap k gk
"nnoremap ' `
"nnoremap ` '
"let mapleader = <quote>,<quote>
"au FocusLost * :wa

nnoremap <leader>w <C-w>v<C-w>l

nnoremap <A-j> :m+<CR>==
nnoremap <A-k> :m-2<CR>==
inoremap <A-j> <Esc>:m+<CR>==gi
inoremap <A-k> <Esc>:m-2<CR>==gi
vnoremap <A-j> :m'>+<CR>gv=gv
vnoremap <A-k> :m-2<CR>gv=gv

"Folding Settings
set foldmethod=indent   "fold based on indent
set foldnestmax=10      "deepest fold is 10 levels
set nofoldenable        "dont fold by default
set foldlevel=1         "this is just what i use
