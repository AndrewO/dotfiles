" Tmux Utilities plugin
" Maintainer: Jim Garvin <jim@thegarvin.com>

" In general, you can specify the target-pane and session as the last two args
" to any function, but they'll use global settings as defaults.

" g:TmuxTargetSession - default target session
" g:TmuxTargetPane    - default target pane
"
" g:TmuxRspecCmd      - rspec command
" g:TmuxRspecOpts     - options to pass to rspec command

if !exists("g:TmuxTargetSession")
  echohl ErrorMsg | echomsg "Tmux Utilities: g:TmuxTargetSession must be set."
endif

if !exists("g:TmuxTargetPane")
  echohl ErrorMsg | echomsg "Tmux Utilities: g:TmuxTargetPane must be set."
endif

if !exists("g:TmuxRspecCmd")
  let g:TmuxRspecCmd  = "bundle exec spec"
endif

if !exists("g:TmuxRspecOpts")
  let g:TmuxRspecOpts = "--drb"
endif

function! TmuxSendKeys(string, ...)
  if a:0 > 0
    let targetPane = a:1
  else
    let targetPane = g:TmuxTargetPane
  endif

  if a:0 > 1
    let targetSession = a:2
  else
    let targetSession = g:TmuxTargetSession
  endif

  call system("tmux -S " . targetSession . " send-keys -t " . targetPane . " " . a:string)
  redraw!
endfunction

function! TmuxRunCommand(string, ...)
  if a:0 > 0
    let targetPane = a:1
  else
    let targetPane = g:TmuxTargetPane
  endif

  if a:0 > 1
    let targetSession = a:2
  else
    let targetSession = g:TmuxTargetSession
  endif

  call TmuxSendKeys("C-c \"" . a:string . "\" Enter &", targetPane, targetSession)
endfunction

function! TmuxClearAndRunCommand(string, ...)
  if a:0 > 0
    let targetPane = a:1
  else
    let targetPane = g:TmuxTargetPane
  endif

  if a:0 > 1
    let targetSession = a:2
  else
    let targetSession = g:TmuxTargetSession
  endif

  call TmuxRunCommand("clear; tmux clear-history; " . a:string, targetPane, targetSession)
endfunction

function! TmuxRunSpec(...)
  if a:0 > 0
    let specfile = a:1
  else
    let specfile = expand("%")
  endif

  if a:0 > 1
    let targetPane = a:2
  else
    let targetPane = g:TmuxTargetPane
  endif

  if a:0 > 2
    let targetSession = a:3
  else
    let targetSession = g:TmuxTargetSession
  endif

  let cmd = g:TmuxRspecCmd . " " . g:TmuxRspecOpts . " " . specfile
  call TmuxClearAndRunCommand(cmd, targetPane, targetSession)
endfunction

function! TmuxRunSpecLine(...)
  if a:0 > 0
    let specfile = a:1
  else
    let specfile = expand("%")
  endif

  if a:0 > 1
    let specline = a:2
  else
    let specline = getpos(".")[1]
  endif

  if a:0 > 2
    let targetPane = a:3
  else
    let targetPane = g:TmuxTargetPane
  endif

  if a:0 > 3
    let targetSession = a:4
  else
    let targetSession = g:TmuxTargetSession
  endif

  call TmuxRunSpec(specfile . ":" . specline, targetPane, targetSession)
endfunction

function! TmuxRunAg(term, ...)
  if a:0 > 0
    let targetPane = a:1
  else
    let targetPane = g:TmuxTargetPane
  endif

  if a:0 > 1
    let targetSession = a:2
  else
    let targetSession = g:TmuxTargetSession
  endif

  let cmd = "ag " . a:term
  call TmuxClearAndRunCommand(cmd, targetPane, targetSession)
endfunction

command! TmuxRunSpec     :call TmuxRunSpec()
command! TmuxRunSpecLine :call TmuxRunSpecLine()
command! -nargs=1 Ag     :call TmuxRunAg(<f-args>)

nmap <Leader>RR :TmuxRunSpec<cr>
nmap <Leader>RL :TmuxRunSpecLine<cr>
