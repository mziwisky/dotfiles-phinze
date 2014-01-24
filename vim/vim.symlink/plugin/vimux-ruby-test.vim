map <silent> <LocalLeader>rb :wa<CR> :RunAllRubyTests<CR>
map <silent> <LocalLeader>rc :wa<CR> :RunRubyFocusedContext<CR>
map <silent> <LocalLeader>rf :wa<CR> :RunRubyFocusedTest<CR>
map <silent> <LocalLeader>rs :!ruby -c %<CR>

let g:vimux_ruby_cmd_all_tests = 'bundle exec ruby'
let g:vimux_ruby_cmd_unit_test = 'bundle exec ruby'
let g:vimux_ruby_cmd_context = 'bundle exec ruby'
