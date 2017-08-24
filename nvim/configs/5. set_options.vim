syntax on
                                            " ui
set background=dark                         " use colors which look good on a dark background
set colorcolumn=80                          " highlight 80th column
set guifont=Input\ Serif:h12
"set guifont=Source\ Code\ Pro\ for\ Powerline:h12
"set guifont=Inconsolata\ for\ Powerline:h13 " ..

set guioptions-=e                           " don't use gui tab apperance
set guioptions-=T                           " hide toolbar
set guioptions-=r                           " don't show scrollbars
set guioptions-=l                           " don't show scrollbars
set guioptions-=R                           " don't show scrollbars
set guioptions-=L                           " don't show scrollbars
set guioptions+=c                           " use console dialog rather than popup dialog

set number                                  " always show line numbers
set ruler                                   " show the cursor position all the time
set showmode                                " always show what mode we're currently editing in

                                            " search
set hlsearch                                " highlight search terms
set ignorecase                              " ignore case in search
set incsearch                               " show search matches as you type
set smartcase                               " override ignorecase if uppercase is used in search string

                                            " text formatting
set autoindent                              " automatic indent new lines
set backspace=indent,eol,start              " allow backspacing over everything in insert mode
set copyindent                              " copy the previous indentation on autoindenting
set nowrap                                  " do not wrap lines
set shiftround                              " use multiple of shiftwidth when indenting with '<' and '>'
set showmatch                               " show matching parenthesis
set smartindent                             " be smart about it
set smarttab                                " insert tabs on the start of a line according to shiftwidth, not tabstop
set softtabstop=2                           " when hitting <BS>, pretend like a tab is removed, even if spaces
set tabstop=2                               " tab is 2 spaces
set expandtab                               " expand tabs by default
set shiftwidth=2                            " number of spaces to use for autoindenting

                                            " backup
set nobackup                                " do not keep backups after close
set noswapfile                              " don't keep swap files either
" set nowritebackup                         " do not keep a backup while working

                                            " folding settings
set foldmethod=syntax                       " fold based on indent
set foldnestmax=10                          " deepest fold is 10 levels
set nofoldenable                            " dont fold by default
" set foldlevel=1                           " this is just what i use

                                            " etc..
set autochdir                               " working directory is always the same as the file
set autoread                                " auto-reload modified files (with no local changes)
set completeopt=preview,menuone             " insert the longest common text of all matches; menu will come up even if there's only one match
set history=1000                            " lots of command line history
set laststatus=2                            " always show status-line
set mouse=a                                 " enable using the mouse
set nocompatible                            " disable Vi compatability
set pumheight=15                            " limit popup menu height
set showcmd                                 " show (partial) command in the last line of the screen
set title                                   " change the terminal's title
let &undodir = '/tmp/undo'                  " undo files will be saved here
set undofile                                " persistent undo, i.e. undoing changes even after closing a file
set undolevels=1000                         " use many muchos levels of undo
set visualbell                              " choose 'visual bell' effect rather than 'beeping'

set clipboard=unnamed

