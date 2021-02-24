scriptencoding utf-8

" PLUGIN MANAGER (PLUG) CHECK 
if ! filereadable(system('echo -n "${XDG_CONFIG_HOME:-$HOME/.config}/nvim/autoload/plug.vim"'))
	echo 'Downloading the plugin manager...'
	silent !mkdir -p ${XDG_CONFIG_HOME:-$HOME/.config}/nvim/autoload/
	silent !curl "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim" > ${XDG_CONFIG_HOME:-$HOME/.config}/nvim/autoload/plug.vim
augroup InstallPlug
	autocmd VimEnter * PlugInstall
augroup end
endif


" PLUGIN LOADS
call plug#begin()


" To figure out what these plugins do, just google them. Most have their speciality in their name.
" Or, just look at the manpages/github. 

" FILESYSTEM TOOLS
Plug 'junegunn/fzf', { 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'easymotion/vim-easymotion'
Plug 'francoiscabrol/ranger.vim'
Plug 'rbgrouleff/bclose.vim'
Plug 'mhinz/vim-startify'
Plug 'liuchengxu/vim-which-key'


" EDITING, GIT, AND DOCUMENTATION
Plug 'tpope/vim-surround'
Plug 'tomtom/tcomment_vim'
Plug 'tpope/vim-fugitive'
Plug 'jreybert/vimagit'
Plug 'airblade/vim-gitgutter'
Plug 'ap/vim-css-color'
Plug 'inkarkat/vim-SyntaxRange'


" NOTETAKING
Plug 'vimwiki/vimwiki'
Plug 'vim-scripts/utl.vim'


" SYNTAX, FORMATTING, AND CODE COMPLETION
Plug 'sheerun/vim-polyglot'
Plug 'Raimondi/delimitMate'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'heavenshell/vim-pydocstring', { 'do': 'make install' }


" APPEARANCE
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'morhetz/gruvbox'
Plug 'kristijanhusak/vim-hybrid-material'
Plug 'arcticicestudio/nord-vim'


call plug#end()


" AUTOMATIC COC PLUGIN DL/INSTALL
" Buggy on Ubuntu SSH. Install seperately.
" let g:coc_global_extensions=['coc-marketplace', 'coc-python', 'coc-json', 'coc-jedi', 'coc-sh', 'coc-docker']


" PLUGIN SETTINGS
" KITE SETTINGS
" let g:kite_supported_languages = ['python', 'javascript', 'go']
" let g:kite_tab_complete=1
" nmap <silent> <buffer> K <Plug>(kite-docs)
" let g:kite_documentation_continual=1

" EASYMOTION SETTINGS
let g:EasyMotion_do_mapping = 0
nmap S <Plug>(easymotion-s)

" PYDOCSTRING SETTINGS
let g:pydocstring_formatter = 'google'


" GITGUTTER SETTINGS
" Disables GitGutter bindings since other git plugs do it better
let g:gitgutter_map_keys = 0 


" AIRLINE SETTINGS 
" Enables tabs for seeing buffers in order to move easier
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1


" DELIMITMATE SETTINGS 
let delimitMate_expand_cr=1
augroup mydelimitMate
    autocmd!
    autocmd FileType markdown let b:delimitMate_nesting_quotes = ["`"]
    autocmd FileType tex let b:delimitMate_quotes = ""
    autocmd FileType tex let b:delimitMate_matchpairs = "(:),[:],{:},`:'"
    autocmd FileType python let b:delimitMate_nesting_quotes = ['"', "'"]
augroup END


" RANGER SETTINGS
" Disables Ranger bindings so that I can organize them better
let g:ranger_map_keys = 0


" VIMWIKI SETTINGS
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

