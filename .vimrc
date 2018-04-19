syntax on
colors adrian

call plug#begin('~/.vim/plugged')
Plug 'karlek/vim-colorschemes'
call plug#end()



set smartindent
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set nowrap
set number
set backspace=2
set scrolloff=999
set sidescrolloff=999
set nu

function! ToggleMouse()
    " check if mouse is enabled
    if &mouse == 'a'
        " disable mouse
        set mouse=
        set scrolloff=999
        set sidescrolloff=999
        echo "Mouse disabled"
    else
        " enable mouse everywhere
        set mouse=a
        set scrolloff=0
        set sidescrolloff=0
        echo "Mouse enabled"
    endif
endfunc

nnoremap <F2> :set invpaste paste?<CR>
nnoremap <F3> :call ToggleMouse()<CR>
set pastetoggle=<F2>
set showmode
