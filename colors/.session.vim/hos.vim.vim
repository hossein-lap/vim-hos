let SessionLoad = 1
let s:so_save = &g:so | let s:siso_save = &g:siso | setg so=0 siso=0 | setl so=-1 siso=-1
let v:this_session=expand("<sfile>:p")
silent only
silent tabonly
cd ~/dev/hossein-lap/vim-colors/vim-hos
if expand('%') == '' && !&modified && line('$') <= 1 && getline(1) == ''
  let s:wipebuf = bufnr('%')
endif
let s:shortmess_save = &shortmess
if &shortmess =~ 'A'
  set shortmess=aoOA
else
  set shortmess=aoO
endif
badd +11 README.adoc
badd +6 colors/hos.vim
badd +0 ~/w/go/coins/main.go
argglobal
%argdel
$argadd README.adoc
$argadd colors/hos.vim
edit README.adoc
let s:save_splitbelow = &splitbelow
let s:save_splitright = &splitright
set splitbelow splitright
wincmd _ | wincmd |
split
1wincmd k
wincmd _ | wincmd |
vsplit
1wincmd h
wincmd w
wincmd w
let &splitbelow = s:save_splitbelow
let &splitright = s:save_splitright
wincmd t
let s:save_winminheight = &winminheight
let s:save_winminwidth = &winminwidth
set winminheight=0
set winheight=1
set winminwidth=0
set winwidth=1
exe '1resize ' . ((&lines * 17 + 18) / 37)
exe 'vert 1resize ' . ((&columns * 78 + 78) / 157)
exe '2resize ' . ((&lines * 17 + 18) / 37)
exe 'vert 2resize ' . ((&columns * 78 + 78) / 157)
exe '3resize ' . ((&lines * 17 + 18) / 37)
argglobal
balt ~/w/go/coins/main.go
setlocal fdm=marker
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=99
setlocal fen
let s:l = 11 - ((10 * winheight(0) + 8) / 17)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 11
normal! 026|
wincmd w
argglobal
if bufexists(fnamemodify("~/w/go/coins/main.go", ":p")) | buffer ~/w/go/coins/main.go | else | edit ~/w/go/coins/main.go | endif
if &buftype ==# 'terminal'
  silent file ~/w/go/coins/main.go
endif
balt README.adoc
setlocal fdm=marker
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=99
setlocal fen
let s:l = 1 - ((0 * winheight(0) + 8) / 17)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 1
normal! 0
wincmd w
argglobal
2argu
balt README.adoc
setlocal fdm=marker
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=99
setlocal fen
let s:l = 6 - ((5 * winheight(0) + 8) / 17)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 6
normal! 043|
wincmd w
3wincmd w
exe '1resize ' . ((&lines * 17 + 18) / 37)
exe 'vert 1resize ' . ((&columns * 78 + 78) / 157)
exe '2resize ' . ((&lines * 17 + 18) / 37)
exe 'vert 2resize ' . ((&columns * 78 + 78) / 157)
exe '3resize ' . ((&lines * 17 + 18) / 37)
tabnext 1
if exists('s:wipebuf') && len(win_findbuf(s:wipebuf)) == 0 && getbufvar(s:wipebuf, '&buftype') isnot# 'terminal'
  silent exe 'bwipe ' . s:wipebuf
endif
unlet! s:wipebuf
set winheight=1 winwidth=20
let &shortmess = s:shortmess_save
let &winminheight = s:save_winminheight
let &winminwidth = s:save_winminwidth
let s:sx = expand("<sfile>:p:r")."x.vim"
if filereadable(s:sx)
  exe "source " . fnameescape(s:sx)
endif
let &g:so = s:so_save | let &g:siso = s:siso_save
set hlsearch
nohlsearch
doautoall SessionLoadPost
unlet SessionLoad
" vim: set ft=vim :
