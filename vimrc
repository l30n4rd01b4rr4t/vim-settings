set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
:set mouse=a

" let Vundle manage Vundle
Plugin 'gmarik/vundle'

" My Bundles here:
Plugin 'vim-ruby/vim-ruby'
Plugin 'tpope/vim-rails'
Plugin 'mattn/emmet-vim'
Plugin 'ctrlp.vim'
Plugin 'mustache/vim-mustache-handlebars'
Plugin 'Syntastic'
Plugin 'terryma/vim-multiple-cursors.git'
Plugin 'vim-stylus'
Plugin 'vim-coffee-script'
Plugin 'Markdown-syntax'
Plugin 'neocomplcache'
Plugin 'fatih/vim-go'
Plugin 'scrooloose/nerdtree'
Plugin 'airblade/vim-gitgutter'
Plugin 'thoughtbot/vim-rspec'
Plugin 'pangloss/vim-javascript'
Plugin 'rking/ag.vim'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'neomake/neomake'

" Color themes
Plugin 'Solarized'
Plugin 'Lucius'
Plugin 'jellybeans.vim'
Plugin 'summerfruit.vim'
Plugin 'summerfruit256.vim'
Plugin 'pyte'
Plugin 'ironman.vim'
Plugin 'oceanlight'
Plugin 'chriskempson/tomorrow-theme', {'rtp': 'vim/'}

call vundle#end()
filetype plugin indent on

" Personal default config
set enc=utf-8
set fenc=utf-8
set termencoding=utf-8
set ffs=unix,dos,mac
set autoindent
set copyindent
set smartindent
set tabstop=2 shiftwidth=2 softtabstop=2
set expandtab
set number
set numberwidth=5
set showmatch
" set nowrap
set colorcolumn=130
set title
set visualbell
set nobackup
set nowritebackup
set noswapfile
set wildmenu
set ruler
set ignorecase
set smartcase
set hlsearch
set incsearch
set list
set clipboard=unnamed
set autoread
set confirm
set hidden
set t_Co=256
set scrolloff=5
"set listchars=tab:>-,trail:·,extends:>,precedes:<
set listchars=tab:>-,trail:~,extends:>,precedes:<
set backspace=indent,eol,start
set hls!
set statusline+=%F
set laststatus=2
set background=dark
syntax on
colorscheme solarized

" Search
" set relativenumber
" set cursorline

if $TERM == "xterm-256color" || $TERM == "screen-256color" || $COLORTERM == "gnome-terminal"
  set t_Co=256
endif

" Set for tabs
:nmap <C-l> :tabnext<CR>
:nmap <C-h> :tabprevious<CR>
:nmap <C-t> :tabnew<CR>

" Set for CTRL-P
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*/build/*
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|node_modules|build|public)$',
  \ 'file': '\v\.(js|exe|so|dll)$'
  \ }

" Make < > shifts keep selection
vnoremap < <gv
vnoremap > >gv

" Vim-ruby
imap <S-CR> <CR><CR>end<Esc>-cc
imap <C-Return> <CR><CR><C-o>k<Tab>

" Vim Nerdtree
map <f2> :NERDTreeToggle<CR>

" Git
map gs :!git status<CR>

" Set list style
let g:netrw_liststyle = 5

" Paste
:nmap \o :set paste!<CR>
:nmap \ln :setlocal number!<CR>

"Neocomplcache
" let g:neocomplcache_enable_at_startup = 6
" let g:neocomplcache_enable_smart_case = 1
" let g:neocomplcache_min_syntax_length = 3

" Go setting
let g:go_play_open_browser = 0
let g:go_fmt_fail_silently = 1
let g:go_fmt_command = "goimports"
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_build_constraints = 1
let g:go_def_mapping_enabled=0
let g:go_fmt_autosave = 1
let g:go_auto_sameids=1

au FileType go nmap <leader>r <Plug>(go-run)
au FileType go nmap <leader>b <Plug>(go-build)
au FileType go nmap <leader>t <Plug>(go-test)
au FileType go nmap <leader>c <Plug>(go-coverage)

au FileType go nmap <Leader>ds <Plug>(go-def-split)
au FileType go nmap <Leader>dv <Plug>(go-def-vertical)
au FileType go nmap <Leader>dt <Plug>(go-def-tab)
au FileType go nmap <Leader>s <Plug>(go-implements)

" let g:syntastic_go_checkers = ['golint', 'govet', 'errcheck']
" let g:syntastic_mode_map = { 'mode': 'active', 'passive_filetypes': ['go'] }

" Strip white space
autocmd BufWritePre * :%s/\s\+$//e

" Rspec
let g:rspec_command = "!bundle exec rspec {spec}"
map <Leader>t :call RunCurrentSpecFile()<CR>
map <Leader>s :call RunNearestSpec()<CR>
map <Leader>l :call RunLastSpec()<CR>
map <Leader>a :call RunAllSpecs()<CR>

" Remove trailling whitespace on :w
autocmd BufWritePre * :%s/\s\+$//e

let g:ag_working_path_mode="r"
nnoremap <leader>A viw"hy:Ag '<C-r>h'

" Autoreload .vimrc
augroup reload_vimrc " {
  autocmd!
  autocmd BufWritePost $MYVIMRC source $MYVIMRC
augroup END " }


highlight DiffAdd    cterm=bold ctermfg=10 ctermbg=17 gui=bold guifg=#00ff00 guibg=#00005f
highlight DiffDelete cterm=bold ctermfg=10 ctermbg=17 gui=bold guifg=#00ff00 guibg=#00005f
highlight DiffChange cterm=bold ctermfg=10 ctermbg=17 gui=bold guifg=#00ff00 guibg=#00005f
highlight DiffText   cterm=bold ctermfg=10 ctermbg=88 gui=bold guifg=#00ff00 guibg=#00005f
highlight Search     cterm=bold ctermfg=15 ctermbg=24 gui=bold guifg=#ffffff guibg=#005f87

