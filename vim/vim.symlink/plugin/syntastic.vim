let g:syntastic_puppet_puppetlint_args = '--no-documentation-check --no-80chars-check --no-class_parameter_defaults-check'
" let g:syntastic_mode_map = { 'mode': 'active',
"       \ 'active_filetypes': ['ruby', 'php'],
"       \ 'passive_filetypes': ['puppet'] }
let syntastic_mode_map = { 'passive_filetypes': ['html', 'hbs', 'handlebars'] }

