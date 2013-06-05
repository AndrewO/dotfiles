" Ctags Chooser plugin
" Maintainer: Jim Garvin <jim@thegarvin.com>

let s:build_list = {
      \ 'all'      : '.',
      \ 'app'      : 'app lib',
      \ 'app-plus' : 'app bin config data data_spec db doc features lib public schemas script spec static test util'
      \}

function! s:ChooseCtagsByFilename(filename)
  call system("ln -sf " . a:filename . " tags")
  echo "tags -> " . a:filename
endfunction

function! s:ChooseCtagsByName(name)
  call s:ChooseCtagsByFilename("tags." . a:name)
endfunction

function! s:ChooseCtagsRebuild(name)
  echo "Rebuilding tag index for \"" a:name "\"..."
  call system("ctags -f tags." . a:name . " -R " . s:build_list[a:name])
endfunction

function! s:ChooseCtagsRebuildAll()
  for name in keys(s:build_list)
    call s:ChooseCtagsRebuild(name)
  endfor
endfunction

command! -nargs=1 ChooseCtags        call s:ChooseCtagsByName(<f-args>)
command! -nargs=1 ChooseCtagsRebuild call s:ChooseCtagsRebuild(<f-args>)
command! ChooseCtagsRebuildAll       call s:ChooseCtagsRebuildAll()
