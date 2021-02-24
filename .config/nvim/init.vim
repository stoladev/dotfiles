" Structure created and maintained by Michael Stolarz (stoladev).
" Far from perfect. Definitely not optimized. Use at your own risk.
" Finished symlinking so there will definitely be more pushes.

" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

" {{{ GENERAL SETTINGS (FIRST)

set shiftround
set noswapfile
set expandtab
set autoindent
set smartindent
set foldenable
set hlsearch
set incsearch
set ignorecase
set smartcase
set wrap
set linebreak
set number
set relativenumber
set showmatch
set visualbell
set wildmenu
set autoread
set splitbelow splitright
set hidden
set nobackup
set nowritebackup
set cmdheight=2
set updatetime=50
set signcolumn=yes
set shortmess+=c
set mouse=a
set foldmethod=marker
set foldcolumn=1
set encoding=utf-8
set clipboard+=unnamedplus
set textwidth=100 
set wrapmargin=0
set formatoptions+=t
set formatoptions-=l
" set formatoptions+=a
set tabstop=4
set softtabstop=4
set shiftwidth=4
set fillchars=fold:\ 
" set nocompatible
highlight Folded ctermbg=None
syntax enable
filetype plugin on
syntax on
" }}}

" {{{ SOURCE LOADS
" PLUG LOAD
source <sfile>:h/init/plug.vim


" COC SETTINGS
source <sfile>:h/init/coc-settings.vim


" FZF SETTINGS
source <sfile>:h/init/fzf-settings.vim


" KEYMAP SETTINGS
source <sfile>:h/init/keymap.vim


" AUTOCMDS AND FUNCTIONS
source <sfile>:h/init/autocmds-and-functions.vim
" }}}

" {{{ APPEARANCE SETTINGS (LAST)
set nohlsearch
colorscheme gruvbox
set colorcolumn=100
highlight colorcolumn ctermbg=7
set showtabline=2
set background=dark
hi Normal guibg=NONE ctermbg=NONE
hi CursorLineNr gui=bold guifg=DarkRed guibg=#c0d0e0
hi Folded               guifg=#FF9999 guibg=#005050 gui=bold,italic
hi FoldColumn           guifg=#FF9999 guibg=#005050 gui=bold
hi _FoldLevel1          guifg=#005050 guibg=#FF9999 gui=bold,italic
hi _FoldLevel2          guifg=#003030 guibg=#CC8080 gui=bold,italic
" }}} 
