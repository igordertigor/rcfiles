filetype off

call pathogen#infect()
call pathogen#helptags()

filetype plugin indent on
syntax on

set listchars=tab:>-,trail:~,extends:>,precedes:<
set list

set expandtab
set tabstop=4
set shiftwidth=4

autocmd FileType make set noexpandtab
autocmd FileType C    set noexpandtab
autocmd FileType cpp  set noexpandtab
autocmd FileType rst set wrap linebreak nolist formatoptions+=l
autocmd FileType tex set wrap linebreak nolist formatoptions+=l
autocmd FileType md set wrap linebreak nolist formatoptions+=l

set number
set foldmethod=indent
set autoindent

" map f3 and f4 to cumulatively toggle spellchecking in english and german
" respectively
set spelllang=
function! SetSpelllang(lang)
    if strridx(&spelllang, a:lang) == -1
        execute "set spl+=".a:lang
        echo "activating spell checking for: ".a:lang." -- the following language(s) are now active: ".&spelllang
        execute "set dictionary+=/home/ingo/.vim/spell/".a:lang.".utf-8.spl"
    else
        execute "set spl-=".a:lang
        echo "deactivating spell checking for: ".a:lang." -- the following language(s) are now active: ".&spelllang
        execute "set dictionary-=/home/ingo/.vim/spell".a:lang.".utf-8.spl"
    endif
    set spell
endfunction
map <f3> :call SetSpelllang("en_ca")<cr>
map <f4> :call SetSpelllang("de")<cr>

" fix stuff after bad paste
map <f7> <ESC>u: set paste<CR>.:set nopaste<CR>gi
