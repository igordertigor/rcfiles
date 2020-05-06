" Useful tools that I copied from Valentin https://github.com/esc long ago
function! SetSpelllang(lang)
    if strridx(&spelllang, a:lang) == -1
        execute "set spl+=".a:lang
        echo "activating spell checking for: ".a:lang." -- the following language(s) are now active: ".&spelllang
        execute "set dictionary+=$HOME/.vim/spell/".a:lang.".utf-8.spl"
    else
        execute "set spl-=".a:lang
        echo "deactivating spell checking for: ".a:lang." -- the following language(s) are now active: ".&spelllang
        execute "set dictionary-=$HOME/.vim/spell".a:lang.".utf-8.spl"
    endif
    set spell
endfunction
