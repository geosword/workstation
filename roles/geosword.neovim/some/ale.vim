" Only run linters named in ale_linters settings.
let g:ale_linters_explicit = 1
" ALEFixers
let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'terraform': ['terraform'],
\}
let g:ale_fix_on_save = 1

" ALELinters - Tried putting these in the ftdetect files like the
" documentation suggests, but found that I could add up to two, before the
" third stopped working. so here we are setting them 'globally' per filetype
let g:ale_linters = {
\   'yaml': ['yamllint','ansible-lint'],
\   'python': ['pylint'],
\   'puppet': ['puppetlint'],
\   'terraform': ['terraform', 'tflint'],
\}

" NOTE: If you are ever setting linter arguments, use g: not b:
