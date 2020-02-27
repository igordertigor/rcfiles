set encoding=utf-8

set nocompatible
filetype off

" Vundle package management
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Vundle manage vundle
Plugin 'gmarik/Vundle.vim'

" Python specific
Plugin 'tmhedberg/SimpylFold'
Plugin 'vim-scripts/indentpython.vim'
" Plugin 'Valloric/YouCompleteMe'
Plugin 'scrooloose/syntastic'
Plugin 'nvie/vim-flake8'
" Plugin 'alfredodeza/coveragepy.vim'
" Plugin 'crisbra/csv.vim'

" Color
Plugin 'jnurmine/Zenburn'
Plugin 'altercation/vim-colors-solarized'

" Powerline
Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}

" git
Plugin 'tpope/vim-fugitive'

" Center text
Plugin 'junegunn/goyo.vim'
Plugin 'tpope/vim-markdown'

" Latex
Plugin 'lervag/vimtex'

Plugin 'ElmCast/elm-vim'

" Plugin 'tpope/vim-surround'  " Doesn't work as advertised
Plugin 'alvan/vim-closetag'

Plugin 'jeetsukumaran/vim-pythonsense'

call vundle#end()
filetype plugin indent on

set clipboard=unnamed

set listchars=tab:>-,trail:~,extends:>,precedes:<
set list
set expandtab
set tabstop=4
set shiftwidth=4

" Indentation
"    Python
autocmd FileType python
    \ set expandtab |
    \ set tabstop=4 |
    \ set shiftwidth=4 |
    \ set autoindent |
    \ set fileformat=unix |
    \ set colorcolumn=80

"    Web tech
autocmd FileType html
    \ set tabstop=2 |
    \ set softtabstop=2 |
    \ set shiftwidth=2 |
    \ set expandtab
autocmd FileType javascript
    \ set tabstop=2 |
    \ set softtabstop=2 |
    \ set shiftwidth=2 |
    \ set expandtab
autocmd FileType css
    \ set tabstop=2 |
    \ set softtabstop=2 |
    \ set shiftwidth=2 |
    \ set expandtab

autocmd FileType scss
    \ set tabstop=2 |
    \ set softtabstop=2 |
    \ set shiftwidth=2 |
    \ set expandtab

autocmd FileType yaml
    \ set tabstop=2 |
    \ set softtabstop=2 |
    \ set shiftwidth=2 |
    \ set expandtab

autocmd FileType elm
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set expandtab

autocmd FileType make set noexpandtab
autocmd FileType C    set noexpandtab
autocmd FileType cpp  set noexpandtab
autocmd FileType rst set wrap linebreak nolist formatoptions+=l
autocmd FileType tex set wrap linebreak nolist formatoptions+=l
autocmd FileType md,mkd,markdown
    \ | setlocal autoindent
    \ | setlocal colorcolumn=0
    \ | setlocal linebreak
    \ | setlocal shiftwidth=4
    \ | setlocal tabstop=4
    \ | setlocal spell
    \ | setlocal wrap
    \ | setlocal expandtab
    \ | setlocal textwidth=0

set number
let mapleader=" "

" Folding
set foldmethod=indent
set foldlevel=3
nnoremap <space> za

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

" splitting
set splitbelow
set splitright
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Deal with markes in template files
map <C-c> /<++>v3lxi



" netrw config """""""""""""""""""""
let g:netrw_liststyle=3
let g:NetrwIsOpen=0
function! ToggleNetrw()
    if g:NetrwIsOpen
        let i = bufnr("$")
        while (i >= 1)
            if (getbufvar(i, "&filename") == "netrw")
                silent exe "bwipeout " . i
            endif
            let i-=1
        endwhile
        let g:NetrwIsOpen=0
    else
        let g:NetrwIsOpen=1
        silent Lexplore
    endif
endfunction
" hit tab twice!
noremap <silent> <tab> :call ToggleNetrw()<cr>

" SimpylFold """"""""""""""""""""""""""
let g:SimpylFold_docstring_preview=1

" YouCompleteMe """""""""""""""""""""""
let g:ycm_autoclose_preview_window_after_completion=1
map <leader>g :YcmCompleter GoToDefinitionElseDeclaration<CR>

" Powerline """""""""""""""""""""""""""
set laststatus=2
let g:Powerline_symbols='fancy'

" syntastic config """"""""""""""""""""
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_loc_list_height = 4
let g:syntastic_python_checkers = ['flake8']
let g:syntastic_javascript_checkers = ['eslint']
let g:elm_syntastic_show_warnings = 1

" Color config """""""""""""""""""""""
if has('gui_running')
    set background=dark
    colorscheme solarized
else
    colorscheme zenburn
endif

" Syntax highlight
let python_highlight_all=1
syntax on

" latex using vimtex
let &rtp = '~/.vim/bundle/vimtex,' . &rtp
let &rtp .= ',~/.vim/bundle/vimtex/after'
let g:tex_flavor = 'pdflatex'
let g:vimtex_view_method = 'zathura'
" regexes for ignoring log entries
let g:vimtex_log_ignore = []

" Sensation and perception specific: Enter images
map <leader>b :set paste<cr><esc>i<div class="imgbox<++>"><cr><img<cr>src="figures/SensPerc5e Ch01 Figures (JPEG)/SENSPERC5e-Fig-<++>-0.jpg"<cr>class="<++>"/><cr></div><esc>5k:set nopaste<cr>
map <leader>p :set paste<cr><esc>i<div class="imgbox<++>"><cr><img<cr>src="figures/chapter01/<++>.jpg"<cr>class="<++>"/><cr></div><esc>5k:set nopaste<cr>
