" Insert sudden-death strings
" Last Change:  2012-12-28
" Maintainer:   Shinya Ohyanagi <sohyanagi@gmail.com>
" NOTE:         Original code is https://github.com/supermomonga/unite-sudden-death
"
let s:save_cpo = &cpo
set cpo&vim

function! s:create(text)
  let width = strlen(substitute(substitute(a:text, "[ -~｡-ﾟ]", 's', 'g'), "[^s]", 'mm', 'g')) / 2 + 2
  let top = '＿' . join(map(range(width), '"人"'),'') . "＿\n"
  let content = '＞　' . a:text . "　＜\n"
  let bottom = '￣' . join(map(range(width), '"Ｙ"'),'') . '￣'

  return top . content . bottom
endfunction

function! s:draw(text)
  let paste = &g:paste
  let &g:paste = 1

  let text = s:create(a:text)
  silent! execute 'normal! o' . text

  let &g:paste = paste
endfunction

function! suddendeath#echo()
  let text = getline('.')
  echo s:create(text)
endfunction

function! suddendeath#create()
  let text = getline('.')
  call s:draw(text)
endfunction

let &cpo = s:save_cpo
unlet s:save_cpo
