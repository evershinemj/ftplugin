if exists('b:did_my_ftplugin')
    finish
endif
let b:did_my_ftplugin = 1

function! Boxes()
    :.!boxes -f $BOXES_SYS_CONF -d 'pound-cmt'
endfunction

let maplocalleader=','
"noremap <unique> <silent> <LocalLeader>w	owhile [[ -n "$1" ]]<Esc>
noremap <LocalLeader>sh	    i#!/bin/bash<CR>
noremap <LocalLeader>curl   ocurl $url --silent<Esc>
noremap <LocalLeader>img    oegrep -o '<img [^>]*src=[^>]*>'<Esc>
noremap <LocalLeader>url    osed 's/img [^>]*src=\"\([^>]*?\)\"/\1'<Esc>
noremap <LocalLeader>sed    osed "s,^/,$baseurl/"<Esc>
