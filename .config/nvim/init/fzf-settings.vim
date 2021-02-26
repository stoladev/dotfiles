
" Should work cross-platform uniformly, given the right version of fd-find/fd/fdfind is installed.

" {{{ Autoset FZF filetype for navigation

augroup SetFZF
    autocmd! FileType fzf
    autocmd  FileType fzf set noshowmode noruler nonu
    autocmd! FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
augroup end

" }}}

" {{{ General FZF Settings

if has('nvim') || has('gui_running')
    let $FZF_DEFAULT_OPTS .= ' --inline-info'
endif
let g:fzf_colors =
            \ { 'fg':      ['fg', 'Normal'],
            \ 'bg':      ['bg', 'Normal'],
            \ 'hl':      ['fg', 'Comment'],
            \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
            \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
            \ 'hl+':     ['fg', 'Statement'],
            \ 'info':    ['fg', 'PreProc'],
            \ 'border':  ['fg', 'Ignore'],
            \ 'prompt':  ['fg', 'Conditional'],
            \ 'pointer': ['fg', 'Exception'],
            \ 'marker':  ['fg', 'Keyword'],
            \ 'spinner': ['fg', 'Label'],
            \ 'header':  ['fg', 'Comment'] }


command! PlugHelp call fzf#run(fzf#wrap({
            \ 'source': sort(keys(g:plugs)),
            \ 'sink':   function('s:plug_help_sink')}))


" command! -nargs=* -bang RG call RipgrepFzf(<q-args>, <bang>0)
" FZF using rg, editable command with before and after result args
" function! RipgrepFzf(query, fullscreen)
"     let command_fmt = 'rg --hidden --column --line-number --no-heading --color=always --smart-case %s || true'
"     let initial_command = printf(command_fmt, shellescape(a:query))
"     let reload_command = printf(command_fmt, '{q}')
"     let options = {'options': ['--phony', '--query', a:query, '--bind', 'change:reload:'.reload_command]}
"         let options = fzf#vim#with_preview(options)
"     call fzf#vim#grep(initial_command, 1, options, a:fullscreen)
" endfunction


function! s:plug_help_sink(line)
    let dir = g:plugs[a:line].dir
    for pat in ['doc/*.txt', 'README.md']
        let match = get(split(globpath(dir, pat), "\n"), 0, '')
        if len(match)
            execute 'tabedit' match
            return
        endif
    endfor
    tabnew
    execute 'Explore' dir
endfunction

" }}}

" TODO
" FIND OUT WHAT THESE ARE FOR
imap <c-x><c-k> <plug>(fzf-complete-word)
imap <c-x><c-f> <plug>(fzf-complete-path)
imap <c-x><c-j> <plug>(fzf-complete-file-ag)
imap <c-x><c-l> <plug>(fzf-complete-line)
inoremap <expr> <c-x><c-d> fzf#vim#complete#path('blsd')
