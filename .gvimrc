" �J���[�ݒ�:
colorscheme pablo

" �c�[���o�[���폜
set guioptions-=T

"���j���[���폜
set guioptions-=m

if has('win64')
	augroup hack234
	  autocmd!
	    autocmd FocusGained * set transparency=220
	    autocmd FocusLost * set transparency=150
	augroup END
endif
