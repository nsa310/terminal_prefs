execute pathogen#infect()
set nocompatible " Disable vi-compatibility
set laststatus=2 " Always show the statusline
syntax on
set background=dark
set t_Co=256
let g:zenburn_high_Contrast = 1
let g:liquidcarbon_high_contrast = 1
"let base16colorspace=256
colorscheme molokai
filetype plugin indent on
autocmd FileType java,ruby,eruby,php autocmd BufWritePre <buffer> :call setline(1,map(getline(1,"$"),'substitute(v:val,"\\s\\+$","","")'))
set autoindent
set smartindent
set tabstop=2
set shiftwidth=2
set expandtab
command W w
command Wa wa
command Wq wq
command Wqa wqa
"for json folding
map <Leader>j :%!python -m json.tool<CR>
"folding settings
set foldmethod=indent   "fold based on indent
set foldnestmax=10      "deepest fold is 10 levels
set nofoldenable        "dont fold by default
set foldlevel=1

" VIM find config
set path=$PWD/**
set wildmenu           " see :h 'wildmenu'
set wildmode=list:full " see :h 'wildmode' for all the possible values
set runtimepath^=~/.vim/bundle/ctrlp.vim
:helptags ~/.vim/bundle/ctrlp.vim/doc

" C-\ - Open the definition in a new tab
" C-; - Open the definition in a vertical split
" map <C-\> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>
map <C-\> :vertical split<CR>:exec("tag ".expand("<cword>"))<CR>
"imap <Tab> <C-P>
autocmd vimenter * NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
autocmd BufEnter * lcd %:p:h "Auto change the directory to the current file I'm working on

" TURNED OFF - excessively slows down vim; fow now only normal line number
set number
" toggle between absolute and relative line numbering
"function! NumberToggle()
"  if(&relativenumber == 1)
"    set number
"  else
"    set relativenumber
"  endif
"endfunc
"
"nnoremap <C-l> :call NumberToggle()<cr>

" automatically switch to absolute line numbers whenever Vim loses focus
":au FocusLost * :set number
":au FocusGained * :set relativenumber

" automatically use absolute line numbers when we’re in insert mode and
" relative numbers when we’re in normal mode
"autocmd InsertEnter * :set number
"autocmd InsertLeave * :set relativenumber

" go related settings
let g:go_fmt_command = "goimports"
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
"let g:go_highlight_interfaces = 1
"let g:go_highlight_operators = 1
"let g:go_highlight_build_constraints = 1
"
let g:jsx_ext_required = 0 " Allow JSX in normal JS files
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces
let g:rbpt_colorpairs = [
    \ ['brown',       'RoyalBlue3'],
    \ ['Darkblue',    'SeaGreen3'],
    \ ['darkgray',    'DarkOrchid3'],
    \ ['darkgreen',   'firebrick3'],
    \ ['darkcyan',    'RoyalBlue3'],
    \ ['darkred',     'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['brown',       'firebrick3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['Darkblue',    'firebrick3'],
    \ ['darkgreen',   'RoyalBlue3'],
    \ ['darkcyan',    'SeaGreen3'],
    \ ['darkred',     'DarkOrchid3'],
    \ ['red',         'firebrick3'],
    \ ]
