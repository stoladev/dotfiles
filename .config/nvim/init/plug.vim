
" This file contains everything that has to do with plugin loads and their individual settings.

" {{{ General Plugin Settings

scriptencoding utf-8

" }}}

" {{{ Vim-Plug Check

" Checks for junegunn's vim-plug installation. Installs if missing.
if ! filereadable(system('echo -n "${XDG_CONFIG_HOME:-$HOME/.config}/nvim/autoload/plug.vim"'))
    echo 'Downloading the plugin manager...'
    silent !mkdir -p ${XDG_CONFIG_HOME:-$HOME/.config}/nvim/autoload/
    silent !curl "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim" > ${XDG_CONFIG_HOME:-$HOME/.config}/nvim/autoload/plug.vim
    augroup InstallPlug
        autocmd VimEnter * PlugInstall
    augroup end
endif

" }}}

" {{{ Plugin Loads

call plug#begin()


" To figure out what these plugins do, just google them. Most have their speciality in their name.
" Or, just look at the manpages/github. 

" FILESYSTEM TOOLS

" Fuzzy File Finder. Main fzsearch tool.
Plug 'junegunn/fzf', { 'do': './install --all' } 
Plug 'junegunn/fzf.vim'

Plug 'easymotion/vim-easymotion' " Code maneuvering (shift-s + character to move cursor there).
Plug 'francoiscabrol/ranger.vim' " CLI file explorer integration. (space+f+r)
Plug 'rbgrouleff/bclose.vim' " Buffer deletion without closing the window.
Plug 'mhinz/vim-startify' " Homepage with recent files and a quote to think about.
Plug 'liuchengxu/vim-which-key' " Hotkey configuration using spacebar as a leader key.


" EDITING, GIT, AND DOCUMENTATION
Plug 'tpope/vim-surround' " Allows for changing surrounding chars (c+s+char+newchar).
Plug 'tomtom/tcomment_vim' " Quick commenting toolkit with different langs in mind (gcc, gc7k)
Plug 'tpope/vim-fugitive' " Brings ':Git' to Vim. :Git commit, :Git diff, :Git mergetool, etc.
Plug 'jreybert/vimagit' " In-Vim CLI git status controller. space+g+s
Plug 'airblade/vim-gitgutter' " Vim gutter addon for git changes (left of line number).
Plug 'ap/vim-css-color' " Shows css color codes.
Plug 'inkarkat/vim-SyntaxRange' " Allows for use of different syntax checks within an opened file


" NOTETAKING
Plug 'vimwiki/vimwiki' " Quick vimnotes application for jotting down info. space+v+w+i
Plug 'vim-scripts/utl.vim' " Allows execution for URLs, files, directories.


" SYNTAX, FORMATTING, AND CODE COMPLETION
Plug 'keith/swift.vim' " Swift programming language integration.
Plug 'sheerun/vim-polyglot' " A collection of language packs for Vim.
Plug 'Raimondi/delimitMate' " Autocomplete 2-character inferences (1 ' usually means another ').
Plug 'neoclide/coc.nvim', {'branch': 'release'} " Coc installation (development core kit).


" APPEARANCE
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'morhetz/gruvbox'
Plug 'kristijanhusak/vim-hybrid-material'
Plug 'arcticicestudio/nord-vim'


call plug#end()

" }}}

" {{{ Plugin Specific Settings

" {{{ EasyMotion Settings

let g:EasyMotion_do_mapping = 0
nmap S <Plug>(easymotion-s)

" }}}

" {{{ PyDocString Settings

let g:pydocstring_formatter = 'google'

" }}}

" {{{ GitGutter Settings

" Disables GitGutter bindings since other git plugs do it better
let g:gitgutter_map_keys = 0 

" }}}

" {{{ Airline Settings 

" Enables tabs for seeing buffers in order to move easier
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1

" }}}

" {{{ DelimitMate Settings 

let delimitMate_expand_cr=1
augroup mydelimitMate
    autocmd!
    autocmd FileType markdown let b:delimitMate_nesting_quotes = ["`"]
    autocmd FileType tex let b:delimitMate_quotes = ""
    autocmd FileType tex let b:delimitMate_matchpairs = "(:),[:],{:},`:'"
    autocmd FileType python let b:delimitMate_nesting_quotes = ['"', "'"]
augroup END

" }}}

" {{{ Ranger Settings

" Disables Ranger bindings so that I can organize them better
let g:ranger_map_keys = 0

" }}}

" {{{ VimWiki Settings

hi VimwikiHeader1 guifg=#4287f5
hi VimwikiHeader2 guifg=#42aaf5
hi VimwikiHeader3 guifg=#42e0f5
hi VimwikiHeader4 guifg=#42f5b6
hi VimwikiHeader5 guifg=#42f54e
hi VimwikiHeader6 guifg=#cbf542

let g:vimwiki_listsyms = ' ✓'
let wiki = {}
let wiki.path = '$XDG_VIMWIKI_HOME'
let wiki.nested_syntaxes = {
            \ 'python': 'python',
            \ 'c++': 'cpp',
            \ 'bash': 'sh'
            \ }
let g:vimwiki_list = [{
            \ 'path': '$XDG_VIMWIKI_HOME',
            \ 'auto_export': 1,
            \ 'auto_toc': 1,
            \ 'index': 'index',
            \ 'ext': '.txt',
            \ 'template_path': '$XDG_VIMWIKI_HOME',
            \ 'template_default': 'def_template',
            \ 'template_ext': '.html'
            \ }]

" }}}

" }}}
