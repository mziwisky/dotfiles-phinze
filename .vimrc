" -------+--------------------------------------------------------------
" .vimrc | settings for the vim text editor
" -------+
" Author: Paul Hinze
" ----------------------------------------------------------------------

" ----------------
" General Settings
" ----------------
set nocompatible
	" set: don't emulate vi bugs (must be first; has side effects)
set enc=utf-8
	" ensure utf-8 is our encoding of choice
set backspace=indent,eol,start
set t_kb=
	" make backspace key work as it should

" ----------------
" Display Settings
" ----------------
set linebreak
	" set: don't break words in middle
set display+=lastline
	" show incomplete paragraphs even when they don't fit on screen (avoid @'s)
set ruler
	" set: always show ruler
set nohls
	" set: don't highlight searches; it's annoying when the highlight sticks
syntax on
	" set: turn on syntax hilighting
set number
" set t_Co=256
	" enable 256 colors
colorscheme desert256

" --------------------
" Indentation and Tabs
" --------------------
set ts=2
	" set tabstop to 4 spaces
set shiftwidth=2
	" make >> shift 4, not 8
set shiftround
	" round to nearest 4, don't just move 4
set expandtab
    " no tabs only spaces!!
set autoindent
set smartindent
	" turn on vim's magical indenting...
inoremap # X#
	" ...but don't move # lines to the beginning.  see :help smartindent

" -----------
" Folding
" -----------
set foldenable
set foldmethod=syntax
	" turn on folding

" -----------
" Spell Check
" -----------
map <F6> <Esc>:setlocal spell spelllang=en_us<CR>
map <F7> <Esc>:setlocal spell spelllang=es_es<CR>
map <F8> <Esc>:setlocal nospell<CR>
	" map some keys to control it:
	" 	F6 - on for English
	" 	F7 - on for Spanish
	" 	F8 - off
au BufNewFile,BufRead *.en.txt set spell
au BufNewFile,BufRead *.es.txt set spelllang=es_es
	" turn it on by default for certain files
	" files with extension .es.txt automatically spellchecked in Spanish
	"
" ----------------
" GNU Screen Stuff 
" ----------------
" Prerequisite: in .screenrc put the following line:
"   setenv SCREEN_RUNNING 1
" The following will update the window title
" NOTE: Commenting until I can figure out a way to store the old title and get
"       it back instead of reverting to bash
" if $SCREEN_RUNNING
" 	au BufEnter * if expand('<afile>') != "" | silent !screen -X title "vim: <afile>:p:."
" 	au VimLeave * silent !screen -X title "bash"
" endif
" 
" ------------------
" Backup File Tweaks
" ------------------
au BufWrite /private/tmp/crontab.* set nowritebackup
	" don't write backup file when called by "crontab -e"; it breaks
au BufWrite /private/etc/pw.* set nowritebackup
	" same for "chpass"; breaks if backups written

" -----------
" Keybindings
" -----------
nnoremap - o<esc>
nnoremap _ O<esc>
	" make - and _ work like o and O without leaving you stuck in insert mode.
map <up> gk
imap <up> <C-o>gk
map <down> gj
imap <down> <C-o>gj
map <home> g<home>
imap <home> <C-o>g<home>
map <end> g<end>
imap <end> <C-o>g<end>
	" make up, down, home and end keys work intuitively for long paragraphs
" map h4 :s/^[A-z0-9"].*$/<h4>&<\/h4>/g
	" make current line an h4
" map p :%s/^[A-z0-9"].*$/<p>&<\/p>/g
	" wrap everything in paragraph tags

" toggle hidden chars
map <silent> <F2> :set invlist<CR>
imap <silent> <F2> <C-O>:set invlist<CR>

" toggle search highlighting
map <silent> <F3> :set invhlsearch<CR>
imap <silent> <F3> <C-O>:set invhlsearch<CR>

" toggle paste to disable formatting temporarily
map <silent> <F4> :set invpaste<CR>
imap <silent> <F4> <C-O>:set invpaste<CR>
set pastetoggle=<F4>

" reload ~/.vimrc
map <silent> <F5> :source ~/.vimrc<CR>
imap <silent> <F5> <Esc>:source ~/.vimrc<CR>i

" easy svn blame
vmap gl :<C-U>!svn blame <C-R>=expand("%:p") <CR> \| sed -n <C-R>=line("'<") <CR>,<C-R>=line("'>") <CR>p <CR>


" ----------------
" Search
" ----------------
set ignorecase
set smartcase
	" This will have searches ignore case unless I use a capital letter
set incsearch
	" Start searching right away

" ---------------------
" Fuzzy Finder Settings
" ---------------------
let g:fuzzy_ignore = "*.log,*.jpg,*.png,*.gif,*.swp"
let g:fuzzy_matching_limit = 70
 
" map  :FuzzyFinderTextMate<CR>

" ----------------
" For RIS
" ----------------
au FileType ruby,eruby  set cin   sw=2 ts=2 sts=2 sr tw=80 expandtab
au FileType yaml        set sw=2 ts=2 sts=2 sr tw=80 expandtab
au FileType python      set sw=4 ts=4 sts=4 sr tw=80 expandtab
map gf <C-W>f 
  " CTRL+W, f => make go to file spawn a split window

" -------------
" Autocommands
" -------------

" for tagslist
" map <C-t> :TlistToggle<CR><CR>

" ----------------
" Gallery Settings
" ----------------

" Set PHP file extensions
" au BufNewFile,BufRead *.php,*.class,*.inc              set filetype=php


" Enable C-Indenting and set options
" au FileType php         set cin   sw=4 ts=8 sts=4 sr tw=100
" au FileType javascript  set cin   sw=4 ts=8 sts=4 sr tw=100
" set cinoptions=>s,e0,n0,f0,{0,}0,^0,:0,=s,l1,g0,hs,ps,ts,+s,c3,C0,(2s,us,\U0,w0,m0,j0,)20,*30
" set cinkeys=0{,0},0),0#,!^F,o,O,e,*;,*<Return>

" Set PHP options
" :let php_sql_query = 1
" :let php_htmlInStrings = 1
" :let php_baselib = 1
" :let php_asp_tags = 0
" :let php_parent_error_close = 1
" :let php_parent_error_open = 1
" :let php_noShortTags = 1
 :let php_folding = 1
" :let php_sync_method = 0

" Highlight chars that go over the 100-column limit
:highlight OverLength ctermfg=red
:match OverLength '\%101v.*'

" http://vim.wikia.com/wiki/Display_shell_commands'_output_on_Vim_window
" Run a shell command and open results in a horizontal split
command! -complete=file -nargs=* Bzr call s:RunShellCommandInSplit('bzr '.<q-args>)
command! -complete=file -nargs=+ Sp call s:RunShellCommandInSplit(<q-args>)
function! s:RunShellCommandInSplit(cmdline)
  botright new
  setlocal buftype=nofile bufhidden=wipe nobuflisted noswapfile nowrap
  call setline(1,a:cmdline)
  call setline(2,substitute(a:cmdline,'.','=','g'))
  execute 'silent $read !'.escape(a:cmdline,'%#')
  setlocal nomodifiable
  1
endfunction

" ----------------
" Calculator
" ----------------

function! MyCalc(str)
  if exists("g:MyCalcRounding")
    return system("echo 'x=" . a:str . ";d=.5/10^" . g:MyCalcPresition
          \. ";if (x<0) d=-d; x+=d; scale=" . g:MyCalcPresition . ";print x/1' | bc -l")
  else
    return system("echo 'scale=" . g:MyCalcPresition . " ; print " . a:str . "' | bc -l")
  endif
endfunction

" Control the precision with this variable
let g:MyCalcPresition = 2
" Comment this if you don't want rounding
let g:MyCalcRounding = 1
" Use \C to replace the current line of math expression(s) by the value of the computation:
map <silent> <Leader>c :s/.*/\=MyCalc(submatch(0))/<CR>:noh<CR>
" Same for a visual selection block
vmap <silent> <Leader>c :B s/.*/\=MyCalc(submatch(0))/<CR>:noh<CR>
" With \C= don't replace, but add the result at the end of the current line
map <silent> <Leader>c= :s/.*/\=submatch(0) . " = " . MyCalc(submatch(0))/<CR>:noh<CR>
" Same for a visual selection block
vmap <silent> <Leader>c= :B s/.*/\=submatch(0) . " = " . MyCalc(submatch(0))/<CR>:noh<CR>
" Try: :B s/.*/\=MyCalc("1000 - " . submatch(0))/
" The concatenation is important, since otherwise it will try
" to evaluate things like in ":echo 1000 - ' 1748.24'"
vmap <Leader>c+ :B s/.*/\=MyCalc(' +' . submatch(0))/<C-Left><C-Left><C-Left><Left>
vmap <Leader>c- :B s/.*/\=MyCalc(' -' . submatch(0))/<C-Left><C-Left><C-Left><Left>
" With \Cs you add a block of expressions, whose result appears in the command line
vmap <silent> <Leader>ct y:echo MyCalc(substitute(@0," *\n","+","g"))<CR>:silent :noh<CR>
" Try: :MyCalc 12.7 + sqrt(98)
command! -nargs=+ MyCalc :echo MyCalc("<args>")

" Quickly pop out to a new tab and return to previous split structure
nmap to :tabedit %<CR>
nmap td :tabclose<CR>

" Copy current path and line number for pasting to co-workers
map  <Esc>n <Esc>:let @*=expand("%").":".line(".")<CR>

" Run rspec example at current line number
function! RunRSpecInSplit(cmdline)
  let l:buf    = 'rspec_run'
  let l:cmd    = a:cmdline

  if buflisted( l:buf )
	execute 'bd! ' . l:buf
  endif

  execute "botright new " . l:buf
  setlocal buftype=nofile bufhidden=wipe noswapfile nowrap filetype=specrun
  set foldtext='--'.getline(v:foldstart).v:folddashes

  call append( 0, 'Output of: ' . l:cmd  )
  call append( 1, '')

  redraw

  let l:output = system( l:cmd )

  call append( 2, split( l:output, "\n" ) )

  setlocal nomodifiable
endfunction

map  <Esc>r :call RunRSpecInSplit('SQLITE=true ./script/spec --drb -bcfs '.@%.' -l <C-r>=line('.')<CR>')<CR>
map  <Esc>s :call RunRSpecInSplit('spec -bcfs '.@%.' -l <C-r>=line('.')<CR>')<CR>
