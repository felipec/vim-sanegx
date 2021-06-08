if exists('g:loaded_sanegx') | finish | endif
let g:loaded_sanegx = 1

function! GXBrowse(url)
  if exists('g:netrw_browsex_viewer')
   let viewer = g:netrw_browsex_viewer
  elseif has('unix') && executable('xdg-open')
   let viewer = 'xdg-open'
  elseif has('macunix') && executable('open')
   let viewer = 'open'
  elseif has('win64') || has('win32')
   let viewer = 'start'
  else
   return
  endif

  execute 'silent! !' . viewer . ' ' . shellescape(a:url, 1)
endfunction

nnoremap <silent> gx :call GXBrowse(expand('<cWORD>'))<cr>
