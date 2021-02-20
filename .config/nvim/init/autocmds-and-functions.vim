" WSL yank support
let s:clip = '/mnt/c/Windows/System32/clip.exe'
if executable(s:clip)
    augroup WSLYank
        autocmd!
        autocmd TextYankPost * if v:event.operator ==# 'y' | call system(s:clip, @0) | endif
    augroup END
endif


" Creates parent directories if necessary when creating a new file
function s:MkNonExDir(file, buf)
    if empty(getbufvar(a:buf, '&buftype')) && a:file!~#'\v^\w+\:\/'
        let dir=fnamemodify(a:file, ':h')
        if !isdirectory(dir)
            call mkdir(dir, 'p')
        endif
    endif
endfunction
augroup MakeDirIfNone
    autocmd!
    autocmd BufWritePre * :call s:MkNonExDir(expand('<afile>'), +expand('<abuf>'))
augroup END

" Changes directory to current python file location
autocmd BufEnter *.py silent! lcd %:p:h


" Compiles file on save
augroup AutoWrites
    autocmd! BufWritePost *Xresources,*Xdefaults !xrdb %
    autocmd! CursorHold *.txt :w
    autocmd! BufNewFile $XDG_VIMWIKI_HOME/diary/*.txt :silent 0r !$XDG_SCRIPTS_HOME/file_templates/vim_diary.py '%'
augroup end
