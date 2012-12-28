let s:save_cpo = &cpo
set cpo&vim

command! -nargs=0 Suddendeath call suddendeath#create()
command! -nargs=0 SuddendeathEcho call suddendeath#echo()



let &cpo = s:save_cpo
unlet s:save_cpo

