" Adjust to personal settings. These make the most sense to me.
" Leader is spacebar. For assistance, press spacebar once and wait for menu.
" Learn combos along the way. Usually they make mnemonic sense.

" {{{ LEADER/LOCALLEADER SETTINGS

let mapleader=' '
let maplocalleader = ';'
call which_key#register('<Space>', 'g:which_key_map')

" }}}

" {{{ KEYMAP SETTINGS

let g:which_key_map =  {}


nnoremap <silent> <leader> :<c-u>WhichKey '<Space>'<CR>
vnoremap <silent> <leader> :<c-u>WhichKeyVisual '<Space>'<CR>
nnoremap <silent> <localleader> :<c-u>WhichKey  ';'<CR>
nnoremap j gj
nnoremap gj j
nnoremap k gk
nnoremap gk k
nnoremap j jzz
nnoremap k kzz
nnoremap @ ^
let g:vimwiki_map_prefix = '<Leader>v'

" }}}

" {{{ F KEY SETTINGS

" {{{ FZF: Searches all visible files

command! -nargs=? -complete=dir FF
      \ call fzf#run(fzf#wrap(fzf#vim#with_preview({
      \   'source': FINDER . ' --type f --follow --exclude .git --exclude yay --no-ignore . '.expand(<q-args>)
      \ })))

nnoremap <leader>ffv :FF $XDG_VIMWIKI_HOME<CR>
nnoremap <leader>ffG :FF $XDG_GIT_HOME<CR>
nnoremap <leader>ffs :FF $XDG_SCRIPTS_HOME<CR>
nnoremap <leader>ffp :FF $XDG_PROJECTS_HOME<CR>

nnoremap <leader>fts :setlocal spell! spelllang-en_us<CR>
nnoremap <leader>fcw :w !sudo tee '%'<CR>
nnoremap <Leader>fcc        :Colors<CR>

" }}}

" {{{ FZF: Searches all files, including hidden

command! -nargs=? -complete=dir AFF
      \ call fzf#run(fzf#wrap(fzf#vim#with_preview({
      \   'source': FINDER . ' --type f --hidden --follow --exclude .git --exclude yay --no-ignore . '.expand(<q-args>)
      \ }))) " FZF term command using fd (change to fd-find or similar if not on Arch)
nnoremap <leader>ffa :AFF $HOME<CR>
nnoremap <leader>ffd :AFF $XDG_DOTFILES_HOME<CR>
nnoremap <leader>ffe :AFF /etc/<CR>
nnoremap <leader>ffu :AFF /usr/<CR>

" nnoremap <leader>ffh :AFF # Search current opened file's directory

" }}}

let g:which_key_map.f = { 
      \ 'name' : '+file'  , 
      \ 'w' : ['w'        , 'write the file']   ,
      \ 'q' : ['q'        , 'quit the file']   ,
      \ 's' : ['Lines' , 'search the file'] ,
      \ 'r' : ['Ranger' , 'open ranger'] ,
      \ 'c' : {
      \ 'name' : '+change'  , 
      \ 'w' : 'write with sudo'   ,
      \ 'c' : 'window colors'   ,
      \ },
      \ 't' : {
      \ 'name' : '+toggle' ,
      \ 's' : 'Toggle spelling'   ,
      \ } ,
      \ 'f' : {
      \ 'name' : '+fuzzyfind'  , 
      \ 'r' : ['History'       , 'fuzzyfind recent files']   ,
      \ 'h' : ['AFF'           , 'fuzzyfind current directory']   ,
      \ 'g' : ['GFiles'        , 'fuzzyfind current git directory']   ,
      \ 'G' : 'fuzzyfind all gits'   ,
      \ 'a' : 'fuzzyfind all'   ,
      \ 'v' : 'fuzzyfind vimwiki'   ,
      \ 'd' : 'fuzzyfind dotfiles'   ,
      \ 'e' : 'fuzzyfind /etc/'   ,
      \ 'u' : 'fuzzyfind /usr/',
      \ 's' : 'fuzzyfind scripts',
      \ 'p' : 'fuzzyfind apyaday',
      \ },
      \ }

" }}}

" {{{ B KEY SETTINGS

let g:which_key_map.b = {
      \ 'name' : '+buffer' ,
      \ 'k' : ['bd'        , 'kill buffer']   ,
      \ 'f' : ['bfirst'    , 'first buffer']    ,
      \ 'h' : ['Startify'  , 'new buffer']     ,
      \ 'l' : ['blast'     , 'last buffer']     ,
      \ 'n' : ['bnext'     , 'next buffer']     ,
      \ 'b' : ['bprevious' , 'previous buffer'] ,
      \ 's' : ['Buffer' , 'search buffers'] ,
      \ }

" }}}

" {{{ M KEY SETTINGS

let g:which_key_map.m = {
      \ 'name' : '+mark' ,
      \ 's' : ['Marks'        , 'search marks']   ,
      \ }

" }}}

" {{{ W KEY SETTINGS

nnoremap <leader>wK :resize -5<CR>
nnoremap <leader>wJ :resize +5<CR>
let g:which_key_map.w = {
      \ 'name' : '+window' ,
      \ 'w' : ['<C-W>w'     , 'other window']          ,
      \ 'c' : ['<C-W>c'     , 'delete window']         ,
      \ '-' : ['<C-W>s'     , 'split window below']    ,
      \ '_' : ['<C-W>v'     , 'split window right']    ,
      \ '2' : ['<C-W>v'     , 'layout double columns'] ,
      \ 'h' : ['<C-W>h'     , 'window left']           ,
      \ 'j' : ['<C-W>j'     , 'window below']          ,
      \ 'l' : ['<C-W>l'     , 'window right']          ,
      \ 'k' : ['<C-W>k'     , 'window up']             ,
      \ 'H' : ['<C-W>5<'    , 'expand window left']    ,
      \ 'L' : ['<C-W>5>'    , 'expand window right']   ,
      \ 'K' : 'expand window up'   ,
      \ 'J' : 'expand window below'   ,
      \ '=' : ['<C-W>='     , 'balance window']        ,
      \ 's' : ['Windows'    , 'search windows']            ,
      \ }

" }}}

" {{{ G KEY SETTINGS

nnoremap <leader>gp :Git push<CR>
let g:which_key_map.g = {
      \ 'name' : '+git' ,
      \ 's' : ['Magit'        , 'status (magit)']   ,
      \ 'p' : 'push'   ,
      \ 'd' : {
      \ 'f' : ['GodotRunFZF', 'fzf scenes'],
      \ 'r' : ['GodotRun', 'run main scene'],
      \ 'c' : ['GodotRunCurrent', 'run current scene'],
      \ }
      \ }

" }}}

" {{{ R KEY SETTINGS

command! -bang -nargs=* RGCD
      \ call fzf#vim#grep('rg --hidden --column --no-heading --line-number --color=always '.shellescape(<q-args>),               
      \ 1,                                                                                                              
      \ fzf#vim#with_preview(),                                                                                         
      \ <bang>0)
command! -bang -nargs=* RGH
      \ call fzf#vim#grep('rg --hidden --column --no-heading --line-number --color=always '.shellescape(<q-args>),               
      \ 1,                                                                                                              
      \ fzf#vim#with_preview({'dir': $HOME}),                                                                                         
      \ <bang>0)
command! -bang -nargs=* RGG
      \ call fzf#vim#grep('rg --hidden --no-heading --column --line-number --color=always ' . shellescape(<q-args>) . ' ' .
      \ (system('git status') =~ '^fatal' ? expand("%:p:h") : system("git rev-parse --show-toplevel")),
      \ 1,
      \ fzf#vim#with_preview(),
      \ <bang>0)
command! -bang -nargs=* RGGM
      \ call fzf#vim#grep('rg --hidden --column --no-heading --line-number --color=always '.shellescape(<q-args>),               
      \ 1,                                                                                                              
      \ fzf#vim#with_preview({'dir': $XDG_GIT_HOME}),                                                                                         
      \ <bang>0)
command! -bang -nargs=* RGD
      \ call fzf#vim#grep('rg --hidden --column --no-heading --line-number --color=always '.shellescape(<q-args>),               
      \ 1,                                                                                                              
      \ fzf#vim#with_preview({'dir': $XDG_DOTFILES_HOME}),                                                                                         
      \ <bang>0)
command! -bang -nargs=* RGV
      \ call fzf#vim#grep('rg --hidden --column --no-heading --line-number --color=always '.shellescape(<q-args>),               
      \ 1,                                                                                                              
      \ fzf#vim#with_preview({'dir': $XDG_VIMWIKI_HOME}),                                                                                         
      \ <bang>0)
command! -bang -nargs=* RGP
      \ call fzf#vim#grep('rg --hidden --column --no-heading --line-number --color=always '.shellescape(<q-args>),               
      \ 1,                                                                                                              
      \ fzf#vim#with_preview({'dir': '$XDG_GIT_HOME/APyADay'}),                                                                                         
      \ <bang>0)
command! -bang -nargs=* RGS
      \ call fzf#vim#grep('rg --hidden --column --no-heading --line-number --color=always '.shellescape(<q-args>),               
      \ 1,                                                                                                              
      \ fzf#vim#with_preview({'dir': '$XDG_GIT_HOME/APyADay'}),                                                                                         
      \ <bang>0)
nnoremap <leader>rpp :!python3 '%'<CR>
let g:which_key_map.r = {
      \ 'name' : '+run' ,
      \ 'p' : {
      \ 'name' : '+python'  , 
      \ 'p' : 'run python'  , 
      \ },
      \ 'g' : {
      \ 'name' : '+ripgrep'  , 
      \ 'h' : ['RGCD', 'rg here (current directory)']   ,
      \ 'a' : ['RGH', 'rg all']   ,
      \ 's' : ['RGP', 'rg scripts']   ,
      \ 'p' : ['RGP', 'rg apyaday']   ,
      \ 'g' : ['RGG', 'rg current git root']   ,
      \ 'G' : ['RGGM', 'rg all gits']   ,
      \ 'd' : ['RGD', 'rg dotfiles']   ,
      \ 'v' : ['RGV', 'rg vimwiki']   ,
      \ },
      \ }

" }}}

" {{{ C KEY SETTINGS

nmap <silent> <leader>cd <Plug>(pydocstring)
nmap <leader>cr <Plug>(coc-rename)
let g:which_key_map.c = {
      \ 'name' : '+COC' ,
      \ 'r' : 'rename function'   ,
      \ 'd' : 'create docstring',
      \ }

" }}}

" {{{ H KEY SETTINGS

nnoremap <leader>hg :helpgrep 
nnoremap <leader>hp :PlugHelp<CR> 
let g:which_key_map.h = {
      \ 'name' : '+help' ,
      \ 'g' : 'grep manuals'   ,
      \ 'p' : 'help with plugins'   ,
      \ }

" }}}

" {{{ V KEY SETTINGS

" Vimwiki Index Maps
nmap <Leader>vwi <Plug>VimwikiIndex
nmap <Leader>vws <Plug>VimwikiUISelect
nmap <Leader>vww <Plug>VimwikiTabIndex

" Vimwiki Unused Options

" Vimwiki Diary Maps
nmap <Leader>vwdi <Plug>VimwikiDiaryIndex
nmap <Leader>vwdt <Plug>VimwikiMakeDiaryNote
nmap <Leader>vwdw <Plug>VimwikiTabMakeDiaryNote
nmap <Leader>vwdn <Plug>VimwikiMakeTomorrowDiaryNote
nmap <Leader>vwdp <Plug>VimwikiMakeYesterdayDiaryNote
nmap <Leader>vwdg <Plug>VimwikiDiaryGenerateLinks

" Miscellaneous
nmap <leader>vs :so $XDG_CONFIG_HOME/nvim/init.vim<CR>
let g:which_key_map.v = {
      \ 'name' : '+vim' ,
      \ 'w' : {
      \ 'name' : '+wiki'  , 
      \ 'd' : {
      \ 'name' : '+diary'  , 
      \ 'i' : 'diary index',
      \ 't' : "today's diary",
      \ 'w' : "today's diary in new window",
      \ 'n' : 'next diary',
      \ 'p' : 'previous diary',
      \ 'g' : 'generate diary links',
      \ },
      \ 'i' : 'vimwiki index',
      \ 'w' : 'vimwiki index in new window',
      \ 's' : 'vimwiki UI select',
      \ },
      \ 's' : 'source init.vim',
      \ }

" }}}

