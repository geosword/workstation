set number
set relativenumber
set nocompatible

let g:ruby_host_prog = '/home/dylanh/.gem/ruby/2.7.0/bin/neovim-ruby-host'

let g:loaded_python_provider = 0
" use the python provider in a specific neovim virtualenvironment
let g:python3_host_prog = '/home/dylanh/.virtualenvs/neovim/bin/python'

function! SourceIfExists(file)
  if filereadable(expand(a:file))
    exe 'source' a:file
  endif
endfunction

let g:pymcd_powerline="py3"
call SourceIfExists("~/.config/nvim/plugins.vim")

set cursorline                          " put a horizontal line on the line where the cursor is
set cursorcolumn

" tabs
set autoindent noexpandtab softtabstop=2 tabstop=2 shiftwidth=2
" we ALWAYS want unix line endings
set fileformat=unix

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
" allows triggering of molecule test with fswatch
nnoremap <silent> <C-i> :!touch .build_trigger <enter> <enter>
nnoremap <silent> <C-t> :set expandtab! expandtab? <enter>
" default to this to hopefully prevent tabs from sneaking in
set expandtab
noremap <Leader>s :update<CR>
" Set the tab and EOL characters
set listchars=tab:……,trail:~,extends:>,precedes:<
" Show tabs and EOL characters
set list
" load some things if they exist
call SourceIfExists("~/.config/nvim/deoplete.vim")
call SourceIfExists("~/.config/nvim/ale.vim")
call SourceIfExists("~/.config/nvim/airline.vim")

 let s:comment_map = {
    \   "yaml": '#',
    \   "yml": '#',
    \   "yaml.ansible": '#',
    \   "php": '\/\/',
    \   "python": '#',
    \   "ruby": '#',
    \   "sh": '#',
    \   "desktop": '#',
    \   "fstab": '#',
    \   "conf": '#',
    \   "profile": '#',
    \   "bashrc": '#',
    \   "bash_profile": '#',
    \ }

function! ToggleComment()
    if has_key(s:comment_map, &filetype)
        let comment_leader = s:comment_map[&filetype]
        if getline('.') =~ "^\\s*" . comment_leader . " "
            " Uncomment the line
            execute "silent s/^\\(\\s*\\)" . comment_leader . " /\\1/"
        else
            if getline('.') =~ "^\\s*" . comment_leader
                " Uncomment the line
                execute "silent s/^\\(\\s*\\)" . comment_leader . "/\\1/"
            else
                " Comment the line
                execute "silent s/^\\(\\s*\\)/\\1" . comment_leader . " /"
            end
        end
    else
        echo "No comment leader found for filetype"
    end
endfunction


nnoremap <C-i> :call ToggleComment()<cr>
vnoremap <C-i> :call ToggleComment()<cr>
