set nocompatible                " nocompatible needs to stay relatively close to beginning.
filetype off                    " TODO: pathogen won't initialize correctly with this on?
call pathogen#infect()          " Load all plugins in ~/.vim/bundle
syntax on                       " syntax highlighting
" call pathogen#runtime_append_all_bundles()
filetype plugin indent on

autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
"set ofu=syntaxcomplete#Complete   " This line may be obsolete
let g:SuperTabDefaultCompletionType = "context"   " Allow tab completion to suggest
                                                  "   based on context.
set completeopt=menuone,longest,preview   " Enable completion menu and pydoc preview
runtime macros/matchit.vim
" Solarized color scheme
" set background=dark
" colorscheme solarized


" Editing behaviour  """""""""""""""""""""""""""""""""""""""""""""""""""
set encoding=utf-8
set ruler
set laststatus=2
set textwidth=79
set colorcolumn=85
set formatoptions=qrn1
set showmode                    " always show what mode we're currently editing in
set wrap                        " wrap lines. 'nowrap' to stop wrapping
set tabstop=4                   " a tab is four spaces
set softtabstop=4               " when hitting <BS>, pretend like a tab is removed, even if spaces
set expandtab                   " expand tabs by default (overloadable per file type later)
set shiftwidth=4                " number of spaces to use for autoindenting
set shiftround                  " use multiple of shiftwidth when indenting with '<' and '>'
set backspace=indent,eol,start  " allow backspacing over everything in insert mode
set autoindent                  " always set autoindenting on
set copyindent                  " copy the previous indentation on autoindenting
set number                      " always show line numbers
" set relativenumber
set showmatch                   " set show matching parenthesis
set ignorecase                  " ignore case when searching
set smartcase                   " ignore case if search pattern is all lowercase,
                                "   case-sensitive otherwise
set smarttab                    " insert tabs on the start of a line according to
                                "   shiftwidth, not tabstop
set scrolloff=4                 " keep 4 lines off the edges of the screen when scrolling
set virtualedit=all             " allow the cursor to go in to "invalid" places
set hlsearch                    " highlight search terms
set incsearch                   " show search matches as you type
set gdefault                    " search/replace "globally" (on a line) by default
set listchars=tab:▸\ ,trail:·,extends:#,nbsp:·
set nolist                      " don't show invisible characters by default,
                                " but it is enabled for some file types (see later)
" set pastetoggle=<F2>          " when in insert mode, press <F2> to go to
                                "   paste mode, where you can paste mass data
                                "   that won't be autoindented
" set mouse=a                   " enable using the mouse if terminal emulator
                                "   supports it (xterm does)
set fileformats="unix,dos,mac"
set nrformats=                  " make <C-a> and <C-x> play well with
                                "   zero-padded numbers (i.e. don't consider
                                "   them octal or hex)


" Vim behaviour """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set hidden                      " hide buffers instead of closing them this means that
                                "   the current buffer can be put to background without
                                "   being written; and that marks and undo history are
                                "   preserved
set switchbuf=useopen           " reveal already opened files from the quickfix window
                                "   instead of opening new buffers
set history=1000                " remember more commands and search history
set undolevels=1000             " levels of undo
if v:version >= 730
    set undofile                " keep a persistent backup file
    set undodir=~/.vim/.undo,~/tmp,/tmp
endif
set nobackup                    " do not keep backup files, it's 70's style cluttering
set noswapfile                  " do not write annoying intermediate swap files
set directory=~/.vim/.tmp,~/tmp,/tmp
                                " store swap files in one of these directories
                                "   (in case swapfile is ever turned on)
set viminfo='20,\"80            " read/write a .viminfo file, don't store more
                                "   than 80 lines of registers
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
set cursorline                  " underline the current line, for quick orientation


" Set regex search to 'very magic' (minimizes escaping).
nnoremap / /\v
vnoremap / /\v

" Wrapped lines behave like normal lines with hard return.
nnoremap j gj
nnoremap k gk

" Swap jump-to-mark and jump-to-mark-BOL
nnoremap ' `
nnoremap ` '
"let mapleader = <quote>,<quote>
"au FocusLost * :wa

" Shortcut to make new vertical split and move focus there.
nnoremap <leader>w <C-w>v<C-w>l
" Smart way to move btw. windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

"Folding Settings
set foldmethod=indent   "fold based on indent
set foldnestmax=10      "deepest fold is 10 levels
set nofoldenable        "dont fold by default
set foldlevel=1         "this is just what i use

" Forgot to do sudo before you started editing? Just hit w!! to save.
cmap w!! w !sudo tee % >/dev/null

" http://vim.wikia.com/wiki/Moving_lines_up_or_down
" NOTE1: These don't work, but they're not that useful anyways.
" nnoremap <A-j> :m+<CR>==
" nnoremap <A-k> :m-2<CR>==
" inoremap <A-j> <Esc>:m+<CR>==gi
" inoremap <A-k> <Esc>:m-2<CR>==gi
" vnoremap <A-j> :m'>+<CR>gv=gv
" vnoremap <A-k> :m-2<CR>gv=gv

" NOTE1:
" Xterm, by default, sets eightBitInput to true, meaning that the eighth bit is set
" for meta characters (combinations with the Alt key, for instance). Not all
" terminals have this feature enabled by default, and therefore work differently
" (they send an Esc before the character key).  There are two ways for a terminal
" emulator to send an Alt key (usually called a Meta key as actual terminals didn't
" have Alt). It can either send 8 bit characters and set the high bit when Alt is
" used, or it can use escape sequences, sending Alt-a as <Esc>a. Vim expects to see
" the 8 bit encoding rather than the escape sequence. Some terminal emulators such as
" xterm can be set to use either mode, but Gnome terminal doesn't offer any such
" setting. To be honest in these days of Unicode editing, the 8-bit encoding is not
" such a good idea anyway. But escape sequences are not problem free either; they
" offer no way of distinguishing between <Esc>j meaning Alt-j vs pressing Esc
" followed by j. In earlier terminal use, typing Escj was another way to send a Meta
" on a keyboard without a Meta key, but this doesn't fit well with vi's use of Esc to
" leave insert mode.
