let g:vroom_use_vimux = 1

function! MapCR()
  nnoremap <cr> :VroomRunTestFile<cr>
endfunction
call MapCR()

nnoremap <leader>t :VroomRunNearestTest<cr>

" Leave the return key alone when in command line windows, since it's used
" to run commands there.
autocmd! CmdwinEnter * :unmap <cr>
autocmd! CmdwinLeave * :call MapCR()
