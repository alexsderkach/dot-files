let nvim_dir = "~/.config/nvim"
let configs_dir = nvim_dir . "/configs"

call plug#begin()

Plug 'scrooloose/nerdtree'                                        " file tree
Plug 'Xuyuanp/nerdtree-git-plugin'                                " + show file statuses
Plug 'junegunn/vim-easy-align'                                    " alignment plugin
Plug 'honza/vim-snippets' | Plug 'SirVer/ultisnips'               " snippets

Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'Shougo/context_filetype.vim'

Plug 'mutewinter/vim-tmux'                                        " syntax highlight for tmux
Plug 'benmills/vimux'                                             " run commands in tmux window

Plug 'jiangmiao/auto-pairs'                                       " auto-close brackets
Plug 'tpope/vim-unimpaired'                                       " common mappings
Plug 'christoomey/vim-tmux-navigator'                             " navigation between tmux panes and vim splits
Plug 'mhinz/vim-startify'                                         " fancy start screen
Plug 'terryma/vim-multiple-cursors'                               " multiple cursors like in ST
Plug 'terryma/vim-expand-region'                                  " change visual selection by using '+' / '-'
Plug 'tpope/vim-commentary'                                       " comments
Plug 'bling/vim-airline'                                          " status line
Plug 'suan/vim-instant-markdown', { 'for': 'markdown' }           " real time markdown editing
Plug 'junegunn/goyo.vim'                                          " distraction-free writing
Plug 'junegunn/limelight.vim'                                     " hyperfocus-writing
Plug 'junegunn/rainbow_parentheses.vim'                           " simpler rainbow parantheses
Plug 'vitalk/vim-simple-todo'                                     " checkboxes
Plug 'danro/rename.vim'                                           " rename current file
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' } " fzf for vim
Plug 'ekalinin/Dockerfile.vim', {'for' : 'Dockerfile'}            " syntax highlight for docker
Plug 'tfnico/vim-gradle'                                          " gradle highlighter
Plug 'ervandew/supertab'
Plug 'tpope/vim-fugitive'                                         " git wrapper
Plug 'junegunn/gv.vim'                                            " git commit browser
Plug 'airblade/vim-gitgutter'                                     " git gutter
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'

Plug 'pangloss/vim-javascript'
Plug 'elzr/vim-json'
Plug 'evanmiller/nginx-vim-syntax'

Plug 'vim-syntastic/syntastic'                                    " syntax cheker
Plug 'nvie/vim-flake8'                                            " syntax and style checker for Python

Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' }
Plug 'zchee/deoplete-go', { 'do': 'make', 'for': 'go' }

" Themes
Plug 'vim-airline/vim-airline-themes'
Plug 'NLKNguyen/papercolor-theme' 
Plug 'dracula/vim'

call plug#end()

for config_path in split(globpath(configs_dir, '*.vim'), '\n')
  exe "source " . fnameescape(config_path)
endfor
