"au BufRead *    set dict=~/mydict/vim
" au BufRead,BufNewFile *.vim setlocal dict=~/mydict/vim
setlocal dict=~/mydict/vim

inoremap try try<CR>catch / /<CR><CR>endtry<Esc>3ko

inoremap if if<CR>endif<Esc>O

inoremap while while<CR>endwhile<Esc>O

inoremap func function ()<CR>endfunction<Esc>O

inoremap for for i in<CR>endfor<Esc>O

inoremap ino    inoremap

inoremap nno    nnoremap

inoremap vno    vnoremap

inoremap cno    cnoremap

" cnoremap 

" cnoremap 

cnoremap      <Left>

cnoremap      <Right>

cnoremap      <S-Left>

cnoremap      <S-Right>

cnoremap getcmd     getcmdtype() == ':' ? '' : ''

inoreabbrev ino inoreabbrev
