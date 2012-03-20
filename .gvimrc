" カラー設定:
colorscheme pablo

" ツールバーを削除
set guioptions-=T

"メニューを削除
set guioptions-=m

if has('win64')
	augroup hack234
	  autocmd!
	    autocmd FocusGained * set transparency=220
	    autocmd FocusLost * set transparency=150
	augroup END
endif
