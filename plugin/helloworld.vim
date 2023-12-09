if exists('g:loaded_helloworld')
  finish
endif
let g:loaded_helloworld = 1

let s:sep = has('win32') ? '\' : '/'
let s:root_dir = expand('<sfile>:p:h:h')

function! s:register() abort
  call denops#plugin#register('squint_helloworld',
        \ join([s:root_dir, 'denops', 'helloworld', 'main.mjs'], s:sep))
endfunction

if exists('g:loaded_denops') && denops#server#status() ==# 'running'
  silent! call s:register()
else
  autocmd User DenopsReady call s:register()
endif
