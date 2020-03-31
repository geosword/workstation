call plug#begin('~/.config/nvim/plugins')
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" deoplete does auto completion
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
" we need fugitive for git integration in airline
Plug 'https://github.com/tpope/vim-fugitive.git'
Plug 'https://github.com/rodjek/vim-puppet.git'
" vim surround for adding 'surroundings' e.g. quotes
Plug 'https://github.com/tpope/vim-surround.git'
" vim-repeat allows us to use . to repeat surround replacements
Plug 'https://github.com/tpope/vim-repeat.git'
" black for uncompromising python code reformating. This particular commit
" does not suffer from https://github.com/psf/black/issues/1304
Plug 'psf/black', { 'commit': 'ce14fa8b497bae2b50ec48b3bd7022573a59cdb1' }
" ale syntax checking framework
Plug 'dense-analysis/ale'
Plug 'pearofducks/ansible-vim'
Plug 'towolf/vim-helm'
" terraform autocompletion
Plug 'juliosueiras/vim-terraform-completion'
Plug 'hashivim/vim-terraform'
call plug#end()
