set complete+=k~/mydict/markdown
inoreabbrev 3#  ###
inoreabbrev 4#  ####
inoreabbrev 5#  #####
inoreabbrev 6#  ######
let maplocalleader = ','
inoremap <LocalLeader>b ****<Left><Left>
inoremap <LocalLeader>i **<Left>
inoremap <LocalLeader>d ~~~~<Left><Left>
nnoremap <LocalLeader>c o```<CR>```<Esc>O
