"au BufRead *    set dict=~/mydict/vim
" au BufRead,BufNewFile *.vim setlocal dict=~/mydict/vim
setlocal dict=~/mydict/vim

inoremap try try<CR>catch / /<CR><CR>endtry<Esc>3ko

" inoremap if if<CR>endif<Esc>O

" inoremap while while<CR>endwhile<Esc>O

" inoremap func function ()<CR>endfunction<Esc>O

" inoremap for for i in<CR>endfor<Esc>O
"
packadd completeall

inoremap ino    inoremap

inoremap nno    nnoremap

inoremap vno    vnoremap

inoremap cno    cnoremap

inoremap <expr> <e  Expr()
function! Expr()
    if getline('.') =~ 'inoremap'
        return '<expr> '
    else
        return '<e'
    endif
endfunction

inoremap <expr> <Lo  LocalLeader()
function! LocalLeader()
    if getline('.') =~ 'inoremap'
        return '<LocalLeader> '
    else
        return '<Lo'
    endif
endfunction

inoremap <expr> <Le  Leader()
function! Leader()
    if getline('.') =~ 'inoremap'
        return '<Leader> '
    else
        return '<Le'
    endif
endfunction

inoremap <expr> <b  Buffer()
function! Buffer()
    if getline('.') =~ 'inoremap'
        return '<buffer> '
    else
        return '<b'
    endif
endfunction

" cnoremap 

" cnoremap 

cnoremap      <Left>

cnoremap      <Right>

cnoremap      <S-Left>

cnoremap      <S-Right>

cnoremap getcmd     getcmdtype() == ':' ? '' : ''

inoreabbrev ino inoreabbrev
