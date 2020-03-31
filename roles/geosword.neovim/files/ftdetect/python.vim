au! BufRead,BufNewFile *.py setfiletype python
" Apply black on saving
autocmd BufWritePre *.py execute ':Black'
