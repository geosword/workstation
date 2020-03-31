" IM LIKE 99.9999999% this actually does nothing as far as autocompletion is
" concerned. Still Ill keep it here because keeping things in seperate config
" files makes things easier to drop in & maintain
" enable deoplete
let g:deoplete#enable_at_startup = 1
" Not sure this actually does anything
let g:deoplete#omni_patterns = {}

call deoplete#custom#option('omni_patterns', {
\ 'complete_method': 'omnifunc',
\ 'terraform': '[^ *\t"{=$]\w*',
\})

call deoplete#initialize()
