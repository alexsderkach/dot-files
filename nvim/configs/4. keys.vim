nnoremap <F1> :NERDTreeToggle<cr>

" move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" mappings for managing tabs
map <leader>tn :tabnew<cr>
map <leader>to :tabonly<cr>
map <leader>tc :tabclose
map <leader>tm :tabmove
map <leader>te :tabedit

nnoremap <S-Left> :tabp<CR>
nnoremap <S-Right> :tabn<CR>
nnoremap <silent> <S-M-Left> :execute 'silent! tabmove ' . (tabpagenr()-2)<CR>
nnoremap <silent> <S-M-Right> :execute 'silent! tabmove ' . tabpagenr()<CR>

" auto-center ..
nmap G Gzz
nmap n nzz
nmap N Nzz
nmap } }zz
nmap { {zz

inoremap jj <ESC>
inoremap jk <ESC>
nore ; :
nore , ;

" fast saving
nnoremap <leader>w :w!<cr>

" keep search matches in the middle of the window.
nnoremap * *zzzv
nnoremap # #zzzv
nnoremap n nzzzv
nnoremap N Nzzzv

map <leader>ol :call Browser ()<CR>

inoremap <F5> <C-R>=strftime("%b %d, %Y")<CR>
nnoremap <F5> "=strftime("%b %d, %Y")<CR>P

map gn :bn<cr>
map gp :bp<cr>
map gd :bd<cr> 
