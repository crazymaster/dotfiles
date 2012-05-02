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
" githubにあるplugin
Bundle 'Lokaltog/vim-powerline'
Bundle 'Shougo/neocomplcache'
Bundle 'Shougo/unite.vim'
Bundle 'Shougo/vimfiler'
Bundle 'mattn/zencoding-vim'
Bundle 'rstacruz/sparkup', {'rtp': 'vim/'}
Bundle 'thinca/vim-quickrun'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-rails.git'
Bundle 'tyru/open-browser.vim'
" www.vim.orgにあるplugin
Bundle 'DirDiff.vim'
Bundle 'FuzzyFinder'
Bundle 'L9'
Bundle 'TwitVim'
Bundle 'neco-look'
Bundle 'smartchr'
 " non github repos
Bundle 'git://git.wincent.com/command-t.git'
filetype plugin indent on

" 文字コード設定
if has('gui_running') && !has('unix')
	set encoding=utf-8
endif

" 文字コードの自動認識
if &encoding !=# 'utf-8'
  set encoding=japan
  set fileencoding=japan
endif
if has('iconv')
  let s:enc_euc = 'euc-jp'
  let s:enc_jis = 'iso-2022-jp'
  " iconvがeucJP-msに対応しているかをチェック
  if iconv("\x87\x64\x87\x6a", 'cp932', 'eucjp-ms') ==# "\xad\xc5\xad\xcb"
    let s:enc_euc = 'eucjp-ms'
    let s:enc_jis = 'iso-2022-jp-3'
  " iconvがJISX0213に対応しているかをチェック
  elseif iconv("\x87\x64\x87\x6a", 'cp932', 'euc-jisx0213') ==# "\xad\xc5\xad\xcb"
    let s:enc_euc = 'euc-jisx0213'
    let s:enc_jis = 'iso-2022-jp-3'
  endif
  " fileencodingsを構築
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
  " 定数を処分
  unlet s:enc_euc
  unlet s:enc_jis
endif
" 日本語を含まない場合は fileencoding に encoding を使うようにする
if has('autocmd')
  function! AU_ReCheck_FENC()
    if &fileencoding =~# 'iso-2022-jp' && search("[^\x01-\x7e]", 'n') == 0
      let &fileencoding=&encoding
    endif
  endfunction
  autocmd BufReadPost * call AU_ReCheck_FENC()
endif
" 改行コードの自動認識
set fileformats=unix,dos,mac
" □とか○の文字があってもカーソル位置がずれないようにする
if exists('&ambiwidth')
  set ambiwidth=double
endif

" [Backspace] で既存の文字を削除できるように設定
"  start - 既存の文字を削除できるように設定
"  eol - 行頭で[Backspace]を使用した場合上の行と連結
"  indent - オートインデントモードでインデントを削除できるように設定
set backspace=start,eol,indent

" 特定のキーに行頭および行末の回りこみ移動を許可する設定
"  b - [Backspace]  ノーマルモード ビジュアルモード
"  s - [Space]      ノーマルモード ビジュアルモード
"  < - [←]          ノーマルモード ビジュアルモード
"  > - [→]          ノーマルモード ビジュアルモード
"  [ - [←]          挿入モード 置換モード
"  ] - [→]          挿入モード 置換モード
"  ~ - ~            ノーマルモード
set whichwrap=b,s,[,],<,>,~

" マウス機能有効化
set mouse=a

" シンタックスハイライト有効化
syntax on
"highlight Normal ctermbg=black ctermfg=grey
"highlight StatusLine term=none cterm=none ctermfg=black ctermbg=grey
highlight CursorLine term=none cterm=none ctermfg=none ctermbg=darkgray

"ポップアップ補完メニュー色設定
highlight Pmenu ctermbg=8 guibg=#606060
highlight PmenuSel ctermbg=12 guibg=SlateBlue
highlight PmenuSbar ctermbg=0 guibg=#404040
highlight PmenuThumb ctermbg=0 guibg=Red
set t_Co=256 " Explicitly tell vim that the terminal supports 256 colors

" ステータスラインを表示
set laststatus=2 " ステータスラインを常に表示
set nohlsearch " 検索キーワードをハイライトしないように設定
set cursorline " カーソルラインの強調表示を有効化

" 行番号を表示
set number

" タブ幅制御
set tabstop=4
set softtabstop=4
set shiftwidth=4

" インクリメンタル検索を有効化
set incsearch

" 補完時の一覧表示機能有効化
set wildmenu

" ショートカットキー
nmap <silent> <C-b> :write<CR>:make<CR>
imap <silent> <C-b> <C-o>:write<CR><C-o>:make<CR>
if has('win32') || has('win64')
	nmap <silent> <F5> :!a.exe<CR>
	imap <silent> <F5> <C-o>:!a.exe<CR>
else
	nmap <silent> <F5> :!./a.out<CR>
	imap <silent> <F5> <C-o>:!./a.out<CR>

endif

" 自動的にQuickFixを開く
autocmd QuickfixCmdPost make,grep,grepadd,vimgrep copen

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

" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplcache.
let g:neocomplcache_enable_at_startup = 1
" Use smartcase.
let g:neocomplcache_enable_smart_case = 1
" Use camel case completion.
let g:neocomplcache_enable_camel_case_completion = 1
" Use underbar completion.
let g:neocomplcache_enable_underbar_completion = 1
" Set minimum syntax keyword length.
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'

" Define dictionary.
let g:neocomplcache_dictionary_filetype_lists = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
    \ }

" Define keyword.
if !exists('g:neocomplcache_keyword_patterns')
  let g:neocomplcache_keyword_patterns = {}
endif
let g:neocomplcache_keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
imap <C-k>     <Plug>(neocomplcache_snippets_expand)
smap <C-k>     <Plug>(neocomplcache_snippets_expand)
inoremap <expr><C-g>     neocomplcache#undo_completion()
inoremap <expr><C-l>     neocomplcache#complete_common_string()

" SuperTab like snippets behavior.
"imap <expr><TAB> neocomplcache#sources#snippets_complete#expandable() ? "\<Plug>(neocomplcache_snippets_expand)" : pumvisible() ? "\<C-n>" : "\<TAB>"

" Recommended key-mappings.
" <CR>: close popup and save indent.
"inoremap <expr><CR>  neocomplcache#smart_close_popup() . "\<CR>"
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplcache#close_popup()
inoremap <expr><C-e>  neocomplcache#cancel_popup()

" AutoComplPop like behavior.
"let g:neocomplcache_enable_auto_select = 1

" Shell like behavior(not recommended).
"set completeopt+=longest
"let g:neocomplcache_enable_auto_select = 1
"let g:neocomplcache_disable_auto_complete = 1
"inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<TAB>"
"inoremap <expr><CR>  neocomplcache#smart_close_popup() . "\<CR>"

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
if !exists('g:neocomplcache_omni_patterns')
  let g:neocomplcache_omni_patterns = {}
endif
let g:neocomplcache_omni_patterns.ruby = '[^. *\t]\.\w*\|\h\w*::'
"autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete
let g:neocomplcache_omni_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
let g:neocomplcache_omni_patterns.c = '\%(\.\|->\)\h\w*'
let g:neocomplcache_omni_patterns.cpp = '\h\w*\%(\.\|->\)\h\w*\|\h\w*::'

" 演算子の間に空白を入れる
inoremap <expr> < search('^#include\%#', 'bcn')? ' <': smartchr#one_of(' < ', ' << ', '<')
inoremap <expr> > search('^#include <.*\%#', 'bcn')? '>': smartchr#one_of(' > ', ' >> ', '>')
inoremap <expr> + smartchr#one_of(' + ', '++', '+')
inoremap <expr> - smartchr#one_of(' - ', '--', '-')
"inoremap <expr> / smartchr#one_of(' / ', '// ', '/')
" *はポインタで使うので、空白はいれない
inoremap <expr> & smartchr#one_of(' & ', ' && ', '&')
inoremap <expr> % smartchr#one_of(' % ', '%')
inoremap <expr> <Bar> smartchr#one_of(' <Bar> ', ' <Bar><Bar> ', '<Bar>')
inoremap <expr> , smartchr#one_of(', ', ',')
" 3項演算子の場合は、後ろのみ空白を入れる
inoremap <expr> ? smartchr#one_of('? ', '?')
inoremap <expr> : smartchr#one_of(': ', '::', ':')

" =の場合、単純な代入や比較演算子として入力する場合は前後にスペースをいれる。
" 複合演算代入としての入力の場合は、直前のスペースを削除して=を入力
inoremap <expr> = search('\(&\<bar><bar>\<bar>+\<bar>-\<bar>/\<bar>>\<bar><\) \%#', 'bcn')? '<bs>= '
				\ : search('\(*\<bar>!\)\%#', 'bcn') ? '= '
				\ : smartchr#one_of(' = ', ' == ', '=')

" 下記の文字は連続して現れることがまれなので、二回続けて入力したら改行する
inoremap <expr> } smartchr#one_of('}', '}<cr>')
inoremap <expr> ; smartchr#one_of(';', ';<cr>')
" 「->」は入力しづらいので、..で置換え
inoremap <expr> . smartchr#loop('.', '->', '...')
" 行先頭での@入力で、プリプロセス命令文を入力
inoremap <expr> @ search('^\(#.\+\)\?\%#','bcn')? smartchr#one_of('#define', '#include', '#ifdef', '#endif', '@'): '@'

inoremap <expr> " search('^#include\%#', 'bcn')? ' "': '"'
" if文直後の(は自動で間に空白を入れる
inoremap <expr> ( search('\<\if\%#', 'bcn')? ' (': '('

