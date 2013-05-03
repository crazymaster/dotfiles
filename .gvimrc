" カラー設定:
colorscheme pablo

set guioptions-=T "ツールバーなし
set guioptions-=m "メニューバーなし
set guioptions-=r "右スクロールバーなし
set guioptions-=R
set guioptions-=l "左スクロールバーなし
set guioptions-=L
set guioptions-=b "下スクロールバーなし

if has('win32') || has('win64')
  augroup hack234
    autocmd!
    autocmd FocusGained * set transparency=220
    autocmd FocusLost * set transparency=150
  augroup END
elseif has('unix')
  set guifont=Ubuntu\ Mono\ 13
endif
