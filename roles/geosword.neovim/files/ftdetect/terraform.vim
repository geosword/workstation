silent! autocmd! filetypedetect BufRead,BufNewFile *.tf
autocmd BufRead,BufNewFile *.tf set filetype=terraform
autocmd BufRead,BufNewFile *.tfvars set filetype=terraform
autocmd BufRead,BufNewFile *.tfstate set filetype=json
autocmd BufRead,BufNewFile *.tfstate.backup set filetype=json

autocmd FileType terraform setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab smarttab
autocmd FileType terraform set completeopt-=preview
" autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
" autocmd InsertLeave * if pumvisible() == 0|pclose|endif
let g:deoplete#omni_patterns = {}
