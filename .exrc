let g:vigun_extra_keywords = ['test']
let g:ale_linters_explicit = 1
let b:ale_linters = {'ruby': ['ruby']}

let g:vigun_commands = [
      \ {
      \   'pattern': 'test/.*_test.rb$',
      \   'normal': 'rails test',
      \   'debug': 'BACKTRACE=1 rails test',
      \ }
      \]
