set number

function! SourceIfExists(file)
  if filereadable(expand(a:file))
    exe 'source' a:file
  endif
endfunction

call SourceIfExists("~/.config/nvim/plugins.vim")

set cursorline                          " put a horizontal line on the line where the cursor is

" tabs
set autoindent noexpandtab softtabstop=2 tabstop=2 shiftwidth=2
" we ALWAYS want unix line endings
set fileformat=unix
" disable macro mode, we have no use for it
map q <Nop>
nnoremap Q <nop>

" https://superuser.com/questions/410982/in-vim-how-can-i-quickly-switch-between-tabs
" this remaps shift J and shift K to moving tabs, just like in chromium within
" vimium installed
" A ctrl+shift+[JK] for insert mode
nnoremap J gT
nnoremap K gt
inoremap <C-J> <ESC>gTi
inoremap <C-K> <ESC>gti

set pastetoggle=<F2>
nnoremap <space> :
nnoremap <silent> <C-i> :!touch .build_trigger <enter> <enter>
" Set the tab and EOL characters
set listchars=tab:……,trail:~,extends:>,precedes:<
" Show tabs and EOL characters
set list
" load some things if they exist
call SourceIfExists("~/.config/nvim/deoplete.vim")
call SourceIfExists("~/.config/nvim/ale.vim")
call SourceIfExists("~/.config/nvim/airline.vim")
