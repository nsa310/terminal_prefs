call pathogen#infect()
set nocompatible " Disable vi-compatibility
set laststatus=2 " Always show the statusline
syntax enable
set t_Co=256
colorscheme inkpot
set background=dark
colorscheme solarized
colorscheme Tomorrow-Night-Bright
set tags=~/project_tags
filetype plugin on
filetype plugin indent on
autocmd FileType java,ruby,eruby,php autocmd BufWritePre <buffer> :call setline(1,map(getline(1,"$"),'substitute(v:val,"\\s\\+$","","")'))
set autoindent
set smartindent
set tabstop=2
set shiftwidth=2
set expandtab
"reload new vim config
au! BufWritePost .vimrc source %
"for json folding
map <Leader>j :%!python -m json.tool<CR>
"folding settings
set foldmethod=indent   "fold based on indent
set foldnestmax=10      "deepest fold is 10 levels
set nofoldenable        "dont fold by default
set foldlevel=1

" C-\ - Open the definition in a new tab
" C-; - Open the definition in a vertical split
" map <C-\> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>
map <C-\> :vertical split<CR>:exec("tag ".expand("<cword>"))<CR>
"imap <Tab> <C-P>
set rtp+=$GOROOT/misc/vim
syntax on
autocmd vimenter * NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
autocmd BufEnter * lcd %:p:h "Auto change the directory to the current file I'm working on
