let g:spacevim_enable_debug = 1
let g:spacevim_enable_ycm = 0
let g:spacevim_lint_on_the_fly = 0
let g:spacevim_realtime_leader_guide = 1
let s:JOB = SpaceVim#api#import('job')
let s:JSON = SpaceVim#api#import('data#json')
augroup custom_config
  au!
  au VimEnter * call s:customSetting()
augroup END
func s:customSetting()

  inoremap <silent> <buffer> <leader>UU <esc>bgUwea
endf
let g:spacevim_custom_plugins = [
      \ ['tweekmonster/startuptime.vim', {'merged' : 0}],
      \ ['mivok/vimtodo', {'merged' : 0}],
      \ ['rakr/vim-one', {'merged' : 0}],
      \ ['AndrewRadev/undoquit.vim', {'merged' : 0}],
      \ ['junegunn/vader.vim', {'merged' : 0}],
      \ ]
let g:python_host_prog  = '/usr/bin/python2'
let g:python3_host_prog = '/usr/bin/python'
call SpaceVim#layers#load('tmux')
call SpaceVim#layers#load('tags')
call SpaceVim#layers#load('mail')
call SpaceVim#layers#load('lang#go')
call SpaceVim#layers#load('lang#php')
call SpaceVim#layers#load('lang#c')
call SpaceVim#layers#load('lang#lua')
call SpaceVim#layers#load('lang#lisp')
call SpaceVim#layers#load('lang#ruby')
call SpaceVim#layers#load('lang#typescript',)
call SpaceVim#layers#load('lang#markdown',
      \ {
      \ 'enableWcwidth' : 1,
      \ 'listItemIndent' : 1,
      \ }
      \ )
call SpaceVim#layers#load('lang#vim')
call SpaceVim#layers#load('lang#lua',
      \ {
      \ 'repl_command' : '~/.luarocks/lib/luarocks/rocks-5.3/luarepl/0.8-1/bin/rep.lua',
      \ }
      \ )
call SpaceVim#layers#load('lang#python')
call SpaceVim#layers#load('lang#xml')
call SpaceVim#layers#load('tools#screensaver')
call SpaceVim#layers#load('shell',
      \ {
      \ 'default_position' : 'bottom',
      \ 'default_height' : 30,
      \ }
      \ )
call SpaceVim#layers#load('debug')
call SpaceVim#layers#load('lsp',
      \ {
      \ 'filetypes' : ['javascript', 'php']
      \ }
      \ )
let g:spacevim_enable_vimfiler_welcome = 1
let g:spacevim_enable_debug = 1
let g:spacevim_guifont = 'ProFont\ for\ Powerline\ 8'
let g:spacevim_colorscheme = 'base16-nord'
let g:gutentags_enabled=0
let g:deoplete#auto_complete_delay = 150
let g:spacevim_enable_tabline_filetype_icon = 1
let g:spacevim_enable_os_fileformat_icon = 1
let g:spacevim_buffer_index_type = 0
set rtp+=~/private/hospital-info
let g:neomake_vim_enabled_makers = ['vimlint', 'vint']
let g:spacevim_layer_lang_java_formatter = expand('~/Downloads/google-java-format-1.3-all-deps.jar')
let g:clang2_placeholder_next = ''
let g:clang2_placeholder_prev = ''
let g:spacevim_statusline_separator = 'arrow'
let g:neomake_open_list = 0
let g:neomake_cpp_enabled_makers=['clang']
let g:neomake_cpp_clang_args = ["-std=c++11"]
noremap <Leader>[ :tabprev<CR>
noremap <Leader>] :tabnext<CR>
let g:indentLine_enabled = 0
let g:spacevim_github_username = 'wsdjeg'
set mouse=nv
let g:spacevim_auto_disable_touchpad = 0
set noshowmode
"let g:spacevim_enable_googlesuggest = 1
"let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1
let g:python_host_skip_check=1
let g:python_host_prog = '/usr/bin/python2'
let g:python3_host_skip_check=1
let g:python3_host_prog = '/usr/bin/python3'
" use slop to get the position and  weidth and heigth
let s:record_window_x = 0
let s:record_window_y = 0
let s:record_window_w = 1366
let s:record_window_h = 743
let s:record_id = 0
let s:record_file = ''
function! s:start_record() abort
  let s:cmd = ['byzanz-record', '-d', 40, '-x', s:record_window_x, '-y', s:record_window_y, '-w', s:record_window_w, '-h', s:record_window_h]
  redraw!
  let time = strftime('%Y-%m-%d-%H-%M-%S')
  let fname = [expand('~/Pictures/') . time . '.gif']
  let s:record_file = 'file://' . fname[0]
  let s:record_id = s:JOB.start(s:cmd + fname, {'on_exit' : funcref('s:record_exit')})
endfunction
function! s:stop_record() abort
  if s:record_id != 0
    call s:JOB.stop(s:record_id)
  endif
endfunction
function! s:record_exit(...) abort
  echom 'record done: ' . s:record_file
  let s:record_id = 0
  let s:record_file = ''
  let s:record_window_x = 0
  let s:record_window_y = 0
  let s:record_window_w = 1366
  let s:record_window_h = 743
endfunction
function! s:set_record_window() abort
  call s:JOB.start(['slop', '-f', '{"x":%x, "y":%y, "w":%w, "h":%h}'], {'on_stdout' : funcref('s:slop_stdout')})
endfunction
function! s:slop_stdout(...) abort
  if len(a:2) == 1 && !empty(a:2[0])
    let slop_data = s:JSON.json_decode(a:2[0])
    let s:record_window_x = slop_data.x
    let s:record_window_y = slop_data.y
    let s:record_window_w = slop_data.w
    let s:record_window_h = slop_data.h
  endif
endfunction
nnoremap <silent> <Leader>sr :call <SID>start_record()<cr>
nnoremap <silent> <Leader>sd :call <SID>stop_record()<cr>
nnoremap <silent> <Leader>sw :call <SID>set_record_window()<cr>
autocmd FileType vader nnoremap <buffer> [SPC]lr :call <SID>run_vader()<cr>
let g:Pmd_Cmd = ['/home/wsdjeg/src/pmd/pmd-dist/target/pmd-bin-6.0.0-SNAPSHOT/bin/run.sh', 'pmd']


function! s:run_vader() abort
  Vader %
  nnoremap <buffer> q :bd<cr>
endfunction
