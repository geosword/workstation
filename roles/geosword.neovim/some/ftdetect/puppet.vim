au! BufRead,BufNewFile *.pp setfiletype puppet
au! BufRead,BufNewFile *.epp setfiletype embeddedpuppet
au! BufRead,BufNewFile Puppetfile setfiletype ruby
let g:ale_puppet_puppetlint_options = "--no-arrow_alignment-check --no-hard_tabs-check --no-2sp_soft_tabs-check --no-autoloader_layout-check"
