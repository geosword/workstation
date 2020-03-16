set number

" Only run linters named in ale_linters settings.
let g:ale_linters_explicit = 1
" ALEFixers
let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\}
let g:ale_fix_on_save = 1

" ALELinters - Tried putting these in the ftdetect files like the
" documentation suggests, but found that I could add up to two, before the
" third stopped working. so here we are setting them 'globally' per filetype
let g:ale_linters = {
\   'yaml': ['yamllint','ansible-lint'],
\   'python': ['pylint'],
\   'puppet': ['puppetlint'],
\}
" NOTE: If you are ever setting linter arguments, you might need to experiment
" with g: vs b: b: works for the yaml linter, but had to use g: for puppet

call plug#begin('~/.config/nvim/plugins')
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" we need fugitive for git integration in airline
Plug 'https://github.com/tpope/vim-fugitive.git'
Plug 'https://github.com/rodjek/vim-puppet.git'
Plug 'dense-analysis/ale'
Plug 'pearofducks/ansible-vim'
call plug#end()
set cursorline                          " put a horizontal line on the line where the cursor is

" This should enable ale linting feedback on the status line
let g:airline#extensions#ale#enabled = 1

let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='powerlineish'


" tabs
set autoindent noexpandtab softtabstop=2 tabstop=2 shiftwidth=2
" we ALWAYS want unix line endings
set fileformat=unix
" disable  mode, we have no use for it
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
" disable : so we use space instead
" autocmd FileType *.yaml,*.yml setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab smarttab
" au! BufNewFile,BufReadPost *.{yaml,yml} set filetype=yaml
" au! BufNewFile,BufReadPost *.pp set filetype=puppet
" autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab

" and puppet files
" Set the tab and EOL characters
set listchars=tab:……,trail:~,extends:>,precedes:<
" Show tabs and EOL characters
set list
