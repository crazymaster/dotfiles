" vundle
set nocompatible
filetype off
if has('win32') || has('win64')
  let $DOTVIM = expand('$VIM/plugins')
else
  let $DOTVIM = expand('~/.vim')
endif
set rtp+=$DOTVIM/bundle/vundle
call vundle#rc('$DOTVIM/bundle')
Bundle 'gmarik/vundle'
" github�ɂ���plugin
Bundle 'thinca/vim-quickrun'
Bundle 'rstacruz/sparkup', {'rtp': 'vim/'}
Bundle 'tpope/vim-rails.git'
Bundle 'Shougo/neocomplcache'
Bundle 'Shougo/unite.vim'
Bundle 'mattn/zencoding-vim'
Bundle 'tpope/vim-fugitive'
Bundle 'Lokaltog/vim-powerline'
Bundle 'tyru/open-browser.vim'
" www.vim.org�ɂ���plugin
Bundle 'L9'
Bundle 'FuzzyFinder'
Bundle 'DirDiff.vim'
Bundle 'TwitVim'
 " non github repos
Bundle 'git://git.wincent.com/command-t.git'
filetype plugin indent on

" �����R�[�h�ݒ�
"if has('gui_running') && !has('unix')
"  set encoding=utf-8
"endif

" �����R�[�h�̎����F��
if &encoding !=# 'utf-8'
  set encoding=japan
  set fileencoding=japan
endif
if has('iconv')
  let s:enc_euc = 'euc-jp'
  let s:enc_jis = 'iso-2022-jp'
  " iconv��eucJP-ms�ɑΉ����Ă��邩���`�F�b�N
  if iconv("\x87\x64\x87\x6a", 'cp932', 'eucjp-ms') ==# "\xad\xc5\xad\xcb"
    let s:enc_euc = 'eucjp-ms'
    let s:enc_jis = 'iso-2022-jp-3'
  " iconv��JISX0213�ɑΉ����Ă��邩���`�F�b�N
  elseif iconv("\x87\x64\x87\x6a", 'cp932', 'euc-jisx0213') ==# "\xad\xc5\xad\xcb"
    let s:enc_euc = 'euc-jisx0213'
    let s:enc_jis = 'iso-2022-jp-3'
  endif
  " fileencodings���\�z
  if &encoding ==# 'utf-8'
    let s:fileencodings_default = &fileencodings
    let &fileencodings = s:enc_jis .','. s:enc_euc .',cp932'
    let &fileencodings = &fileencodings .','. s:fileencodings_default
    unlet s:fileencodings_default
  else
    let &fileencodings = &fileencodings .','. s:enc_jis
    set fileencodings+=utf-8,ucs-2le,ucs-2
    if &encoding =~# '^\(euc-jp\|euc-jisx0213\|eucjp-ms\)$'
      set fileencodings+=cp932
      set fileencodings-=euc-jp
      set fileencodings-=euc-jisx0213
      set fileencodings-=eucjp-ms
      let &encoding = s:enc_euc
      let &fileencoding = s:enc_euc
    else
      let &fileencodings = &fileencodings .','. s:enc_euc
    endif
  endif
  " �萔������
  unlet s:enc_euc
  unlet s:enc_jis
endif
" ���{����܂܂Ȃ��ꍇ�� fileencoding �� encoding ���g���悤�ɂ���
if has('autocmd')
  function! AU_ReCheck_FENC()
    if &fileencoding =~# 'iso-2022-jp' && search("[^\x01-\x7e]", 'n') == 0
      let &fileencoding=&encoding
    endif
  endfunction
  autocmd BufReadPost * call AU_ReCheck_FENC()
endif
" ���s�R�[�h�̎����F��
set fileformats=unix,dos,mac
" ���Ƃ����̕����������Ă��J�[�\���ʒu������Ȃ��悤�ɂ���
if exists('&ambiwidth')
  set ambiwidth=double
endif

" [Backspace] �Ŋ����̕������폜�ł���悤�ɐݒ�
"  start - �����̕������폜�ł���悤�ɐݒ�
"  eol - �s����[Backspace]���g�p�����ꍇ��̍s�ƘA��
"  indent - �I�[�g�C���f���g���[�h�ŃC���f���g���폜�ł���悤�ɐݒ�
set backspace=start,eol,indent

" ����̃L�[�ɍs������эs���̉�肱�݈ړ���������ݒ�
"  b - [Backspace]  �m�[�}�����[�h �r�W���A�����[�h
"  s - [Space]      �m�[�}�����[�h �r�W���A�����[�h
"  < - [��]          �m�[�}�����[�h �r�W���A�����[�h
"  > - [��]          �m�[�}�����[�h �r�W���A�����[�h
"  [ - [��]          �}�����[�h �u�����[�h
"  ] - [��]          �}�����[�h �u�����[�h
"  ~ - ~            �m�[�}�����[�h
set whichwrap=b,s,[,],<,>,~

" �}�E�X�@�\�L����
set mouse=a

" �V���^�b�N�X�n�C���C�g�L����
syntax on
"highlight Normal ctermbg=black ctermfg=grey
"highlight StatusLine term=none cterm=none ctermfg=black ctermbg=grey
highlight CursorLine term=none cterm=none ctermfg=none ctermbg=darkgray
set t_Co=256 " Explicitly tell vim that the terminal supports 256 colors

set laststatus=2
set nohlsearch " �����L�[���[�h���n�C���C�g���Ȃ��悤�ɐݒ�
set cursorline " �J�[�\�����C���̋����\����L����

" �s�ԍ���\��
set number

" �C���N�������^��������L����
set incsearch

" �⊮���̈ꗗ�\���@�\�L����
"set wildmenu wildmode=list:full
set wildmenu

"�V���[�g�J�b�g�L�[
if has('win32') || has('win64')
	nmap <silent> <C-b> :write<CR>:make<CR>
	imap <silent> <C-b> <C-o>:write<CR><C-o>:make<CR>
	nmap <silent> <F5> :!a.exe<CR>
	imap <silent> <F5> <C-o>:!a.exe<CR>
else
	nmap <silent> <C-b> :write<CR>:make linux<CR>
	imap <silent> <C-b> <C-o>:write<CR><C-o>:make linux<CR>
	nmap <silent> <F5> :!./a.out<CR>
	imap <silent> <F5> <C-o>:!./a.out<CR>
	
endif

" �����I��QuickFix���J��
autocmd QuickfixCmdPost make,grep,grepadd,vimgrep copen

" neocomplcache
let g:neocomplcache_enable_at_startup = 1 " �N�����ɗL����

let g:quickrun_config = {}
if has('win32') || has('win64')
let g:quickrun_config['markdown'] = {
	\ 'outputter': 'browser',
	\ 'command': 'c:/Ruby193/bin/ruby',
	\ 'cmdopt': '-Ku c:/Ruby193/bin/redcarpet'
	\ }
else
let g:quickrun_config['markdown'] = {
	\ 'outputter': 'browser'
	\ }
endif
