"note the file python.vim in ~/.vim/after

if exists('b:did_my_ftplugin')
    finish
endif
let b:did_my_ftplugin = 1

setlocal path=~/python
autocmd BufEnter *     set ic

"add ! in case Boxes is already defined (! overwrites the possibly defined function)
function! Boxes()
    :.!boxes -f $BOXES_SYS_CONF -d 'pound-cmt'
endfunction

function! Zen()
    !python3 ~/python/zen.py
endfunction
    
command! Zen call Zen()

command! PygameEvent read ~/python/pygame_event.template

command! Author :0read ~/python/author.template | :normal G

setlocal tags+=$PYTHON_STDLIB/tags
setlocal dict=~/mydict/python
setlocal dict+=~/mydict/pygame
setlocal dict+=~/mydict/pygame-variables
"setlocal tags+=~/python/tags
"setlocal tags+=~/pytags

"au BufWritePost *.py    !sudo chmod u+x %

let maplocalleader = ','
"map <unique> <buffer> <LocalLeader>i	iimport 
map <silent> <buffer> <LocalLeader>p		oprint()<Esc>h     
map <silent> <buffer> <LocalLeader>b		I#!/usr/bin/env python3<CR><Esc>	
map <silent> <buffer> <LocalLeader>e		I# encoding=utf-8<CR><Esc>
map <silent> <buffer> <LocalLeader>r		o^[ \t\f]*#.*?coding[:=][ \t]*([-_.a-zA-Z0-9]+)<Esc>
" noremap <buffer> <LocalLeader>sp		oimport sys<CR>for item in sys.path:<CR><Space><Space><Space><Space>print(item)<CR>
noremap <silent> <buffer> <LocalLeader>sp	oimport sys<CR>for item in sys.path:<CR>print(item)<CR>
noremap <silent> <buffer> <LocalLeader>nm       Iif __name__ == '__main__':<Esc>       

iabbrev imp     import
setlocal noincsearch
setlocal wrapscan
setlocal textwidth=80
