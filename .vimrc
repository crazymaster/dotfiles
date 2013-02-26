" neobundle.vim"{{{
set nocompatible                " Recommend

if has('win32') || has('win64')
  let $DOTVIM = expand('$VIM/plugins')
else
  let $DOTVIM = expand('~/.vim')
endif

if has('vim_starting')
  set runtimepath+=$DOTVIM/bundle/neobundle.vim
endif

call neobundle#rc(expand('$DOTVIM/bundle'))

" Let NeoBundle manage NeoBundle
NeoBundleFetch 'Shougo/neobundle.vim'

" My Bundles here:
"
" Original repositories in github
NeoBundle 'Lokaltog/vim-powerline'
"NeoBundleLazy 'Rip-Rip/clang_complete', {
"      \ 'autoload' : {
"      \     'filetypes' : ['c', 'cpp'],
"      \    },
"      \ }
NeoBundle 'Shougo/echodoc'
NeoBundle 'Shougo/git-vim'
NeoBundle 'Shougo/neocomplcache'
NeoBundle 'Shougo/neosnippet'
NeoBundle 'Shougo/unite-build'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/vim-vcs'
NeoBundle 'Shougo/vimfiler'
NeoBundle 'Shougo/vimshell'
NeoBundle 'Shougo/vinarise' 
NeoBundle 'adie/BlockDiff'
"NeoBundleLazy 'basyura/TweetVim',{
"      \ 'depends' : 'basyura/twibill.vim',
"      \ 'autoload' : { 'commands' : 'TweetVimHomeTimeline' }}
NeoBundle 'csexton/jekyll.vim'
NeoBundle 'godlygeek/tabular'
NeoBundle 'groenewege/vim-less'
NeoBundle 'honza/snipmate-snippets'
NeoBundle 'h1mesuke/unite-outline'
NeoBundle 'h1mesuke/vim-alignta'
NeoBundle 'hail2u/vim-css3-syntax'
NeoBundle 'kana/vim-smartchr'
NeoBundleLazy 'kana/vim-smartinput'
NeoBundle 'majutsushi/tagbar'
NeoBundleLazy 'mattn/benchvimrc-vim',
      \ { 'autoload' : { 'commands' : 'BenchVimrc' }}
NeoBundle 'mattn/gist-vim'
NeoBundle 'mattn/webapi-vim'
NeoBundle 'mattn/wwwrenderer-vim'
NeoBundle 'mattn/zencoding-vim'
NeoBundle 'othree/html5.vim'
NeoBundle 'pasela/unite-webcolorname'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'thinca/vim-openbuf'
NeoBundle 'thinca/vim-quickrun'
NeoBundle 'thinca/vim-ref'
NeoBundleLazy 'thinca/vim-scouter',
      \ { 'autoload' : { 'commands' : 'Scouter' }}
NeoBundle 'thinca/vim-unite-history'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'tpope/vim-markdown'
NeoBundle 'tpope/vim-surround'
NeoBundle 'tsukkee/lingr-vim'
NeoBundle 'tsukkee/unite-help'
NeoBundle 'tsukkee/unite-tag'
NeoBundle 'tyru/eskk.vim'
NeoBundle 'tyru/open-browser.vim'
NeoBundle 'ujihisa/neco-look'
NeoBundle 'vim-jp/vimdoc-ja'
NeoBundleLazy 'choplin/unite-vim_hacks'
NeoBundleLazy 'skammer/vim-css-color'
NeoBundleLazy 'ujihisa/unite-colorscheme'
NeoBundleLazy 'ujihisa/unite-locate'
"NeoBundleLazy 'yomi322/neco-tweetvim'
"NeoBundleLazy 'yomi322/unite-tweetvim'
" Vim-script repositories
NeoBundle 'DirDiff.vim'
"NeoBundle 'rails.vim'
" Non-github repos
"NeoBundle 'git://git.wincent.com/command-t.git'
" Non-git repos
"NeoBundle 'http://svn.macports.org/repository/macports/contrib/mpvim/'
"NeoBundle 'https://bitbucket.org/ns9tks/vim-fuzzyfinder'

if has('unix')
  NeoBundle 'fuenor/im_control.vim'
  " PythonによるIBus制御指定
  let IM_CtrlIBusPython = 1
endif

" Build repos.
NeoBundle 'Shougo/vimproc', {
      \ 'build' : {
      \     'windows' : 'make -f make_mingw32.mak',
      \     'cygwin' : 'make -f make_cygwin.mak',
      \     'mac' : 'make -f make_mac.mak',
      \     'unix' : 'make -f make_unix.mak',
      \    },
      \ }

" Lazy load.
"NeoBundleLazy 'c9s/perlomni.vim.git'
"NeoBundleSource perlomni.vim
"NeoBundleLazy 'klen/python-mode'
"autocmd FileType python
"	  \ NeoBundleSource python-mode

filetype plugin indent on       " Required!

" Installation check.
NeoBundleCheck
"}}}

" 文字コード設定
if has('gui_running') && !has('unix')
  set encoding=utf-8
endif

set helplang=ja,en

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
highlight CursorLine term=none cterm=bold ctermfg=none ctermbg=darkgray

" For Powerline
set t_Co=256 " Explicitly tell vim that the terminal supports 256 colors

"ポップアップ補完メニュー色設定
highlight Pmenu ctermbg=8 ctermfg=White guibg=#606060
highlight PmenuSel ctermbg=12 guibg=SlateBlue
highlight PmenuSbar ctermbg=0 guibg=#404040
highlight PmenuThumb ctermbg=0 guibg=Red

" ステータスラインを表示
set laststatus=2 " ステータスラインを常に表示
set hlsearch " 検索キーワードをハイライト
set cursorline " カーソルラインの強調表示を有効化
" コマンドラインの高さ (Windows用gvim使用時はgvimrcを編集すること)
set cmdheight=2
" コマンドをステータス行に表示
set showcmd
" タイトルを表示
set title

" 行番号を表示
set number

" タブ幅制御
set tabstop=8
set softtabstop=2
set shiftwidth=2
set smarttab
set shiftround
" タブをスペースに展開する
set expandtab
" 自動的にインデントする (noautoindent:インデントしない)
set autoindent
" 検索時にファイルの最後まで行ったら最初に戻る (nowrapscan:戻らない)
set wrapscan
" 括弧入力時に対応する括弧を表示 (noshowmatch:表示しない)
set showmatch
" コマンドライン補完するときに強化されたものを使う(参照 :help wildmenu)
set wildmenu
" テキスト挿入中の自動折り返しを日本語に対応させる
set formatoptions+=mM

" インクリメンタル検索を有効化
set incsearch
" 検索時に大文字小文字を無視 (noignorecase:無視しない)
set ignorecase
" 大文字小文字の両方が含まれている場合は大文字小文字を区別
set smartcase

" 補完時の一覧表示機能有効化
set wildmenu
" ファイル名補完時に無視するファイルパターン
set wildignore=*.o,*.obj,*.bak,*.swp,*.d,*~

" ビジュアルモードでインデント変更後も選択を継続
vnoremap < <gv
vnoremap > >gv

" 連続コピペ
vnoremap <silent> <C-p> "0p<CR>

" クリップボードを利用する
set clipboard=unnamed

" 自動的にQuickFixを開く
autocmd QuickfixCmdPost make,grep,grepadd,vimgrep copen

if has('unix')
  set path+=/usr/include/c++/4.7.2,/usr/include/qt4/QtCore,/usr/include/qt4/QtGui,/usr/include/qt4
endif

" quickrun.vim"{{{
let g:quickrun_config = {}
if has('win32') || has('win64')
  let g:quickrun_config.markdown = {
        \ 'outputter': 'browser',
        \ 'command': 'c:/Ruby193/bin/ruby',
        \ 'cmdopt': '-Ku c:/Ruby193/bin/redcarpet'
        \ }
else
  let g:quickrun_config.markdown = {
        \ 'outputter': 'browser'
        \ }
endif

let g:quickrun_config.html = {
      \ 'outputter': 'null', 
      \ 'command': 'firefox'
      \ }
"}}}

let g:echodoc_enable_at_startup = 1

" Smart space mapping.
" Notice: when starting other <Space> mappings in noremap,  disappeared [Space].
map <Space> [Space]
xmap <Space> [Space]
nnoremap [Space] <Nop>
xnoremap [Space] <Nop>

" neocomplcache"{{{
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
" Set auto completion length.
let g:neocomplcache_auto_completion_start_length = 2
" Set minimum keyword length.
let g:neocomplcache_min_keyword_length = 3

let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'

" Define dictionary.
let g:neocomplcache_dictionary_filetype_lists = {
      \ 'default' : '',
      \ 'vimshell' : $HOME.'/.vimshell_hist',
      \ 'scheme' : $HOME.'/.gosh_completions'
      \ }

" Define keyword pattern.
if !exists('g:neocomplcache_keyword_patterns')
  let g:neocomplcache_keyword_patterns = {}
endif
let g:neocomplcache_keyword_patterns.default = '\h\w*'
let g:neocomplcache_keyword_patterns.perl = '\h\w*->\h\w*\|\h\w*::'

let g:neocomplcache_snippets_dir = $HOME . '/snippets'

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplcache#undo_completion()
inoremap <expr><C-l>     neocomplcache#complete_common_string()

imap <C-k> <Plug>(neosnippet_expand_or_jump)
smap <C-k> <Plug>(neosnippet_expand_or_jump)
xmap <C-k> <Plug>(neosnippet_expand_target)
xmap <C-l> <Plug>(neosnippet_start_unite_snippet_target)

" SuperTab like snippets behavior.
imap <expr><TAB> neosnippet#expandable() ?
      \ "\<Plug>(neosnippet_expand_or_jump)"
      \: pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable() ?
      \ "\<Plug>(neosnippet_expand_or_jump)"
      \: "\<TAB>"

" For snippet_complete marker.
if has('conceal')
  set conceallevel=2 concealcursor=i
endif

" Tell Neosnippet about the other snippets
let g:neosnippet#snippets_directory='$DOTVIM/bundle/snipmate-snippets/snippets'

" Recommended key-mappings.
" <CR>: close popup and save indent.
"inoremap <expr><silent> <CR> <SID>my_cr_function()
"function! s:my_cr_function()
"  return pumvisible() ? neocomplcache#close_popup() . "\<CR>" : "\<CR>"
"endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <S-TAB>: completion back.
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
" <C-y>: paste.
inoremap <expr><C-y> pumvisible() ? neocomplcache#close_popup() : "\<C-r>\""
" <C-e>: close popup.
inoremap <expr><C-e> pumvisible() ? neocomplcache#cancel_popup() : "\<End>"
" <C-k>: unite completion.
"imap <C-k> <Plug>(neocomplcache_start_unite_complete)
" <C-n>: neocomplcache.
inoremap <expr><C-n> pumvisible() ? "\<C-n>" : "\<C-x>\<C-u>\<C-p>\<Down>"
" <C-p>: keyword completion.
inoremap <expr><C-p> pumvisible() ? "\<C-p>" : "\<C-p>\<C-n>"

" For cursor moving in insert mode(Not recommended)
inoremap <expr><Left>  neocomplcache#close_popup() . "\<Left>"
inoremap <expr><Right> neocomplcache#close_popup() . "\<Right>"
"inoremap <expr><Up>    neocomplcache#close_popup() . "\<Up>"
"inoremap <expr><Down>  neocomplcache#close_popup() . "\<Down>"
" Or set this.
"let g:neocomplcache_enable_cursor_hold_i = 1
" Or set this.
"let g:neocomplcache_enable_insert_char_pre = 1

" AutoComplPop like behavior.
"let g:neocomplcache_enable_auto_select = 1

" Shell like behavior(not recommended).
"set completeopt+=longest
"let g:neocomplcache_enable_auto_select = 1
"let g:neocomplcache_disable_auto_complete = 1
"inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"
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
let g:neocomplcache_omni_patterns.ruby = '[^. *\t]\.\h\w*\|\h\w*::'
"autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete
let g:neocomplcache_omni_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
let g:neocomplcache_omni_patterns.cpp = '\h\w*\%(\.\|->\)\h\w*\|\h\w*::'
let g:neocomplcache_omni_patterns.mail = '^\s*\w\+'
let g:neocomplcache_omni_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
let g:neocomplcache_caching_limit_file_size = 500000

if !exists('g:neocomplcache_same_filetype_lists')
  let g:neocomplcache_same_filetype_lists = {}
endif

" For perlomni.vim setting.
" https://github.com/c9s/perlomni.vim
let g:neocomplcache_omni_patterns.perl = '\h\w*->\h\w*\|\h\w*::'

" For clang_complete
" neocomplcache 側の設定
"if !exists("g:neocomplcache_force_omni_patterns")
"  let g:neocomplcache_force_omni_patterns = {}
"endif
"let g:neocomplcache_force_overwrite_completefunc = 1
"let g:neocomplcache_force_omni_patterns.c =
"      \ '[^.[:digit:] *\t]\%(\.\|->\)'
"let g:neocomplcache_force_omni_patterns.cpp =
"      \ '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'
"let g:neocomplcache_force_omni_patterns.objc =
"      \ '[^.[:digit:] *\t]\%(\.\|->\)'
"let g:neocomplcache_force_omni_patterns.objcpp =
"      \ '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'
"let g:clang_complete_auto = 0
"let g:clang_auto_select = 0
"let g:clang_use_library = 1
"}}}

" smartchr.vim"{{{
inoremap <expr> , smartchr#one_of(', ', ',')
inoremap <expr> ? smartchr#one_of('?', '? ')

augroup MyAutoCmd
  " Substitute .. into -> .
  autocmd FileType c,cpp inoremap <buffer> <expr> . smartchr#loop('.', '->', '...')
  autocmd FileType perl,php inoremap <buffer> <expr> . smartchr#loop(' . ', '->', '.')
  autocmd FileType perl,php inoremap <buffer> <expr> - smartchr#loop('-', '->')
  autocmd FileType vim inoremap <buffer> <expr> . smartchr#loop('.', ' . ', '..', '...')

  " Smart =.
  autocmd FileType c,cpp,perl,php,vim inoremap <expr> = search('\(&\<bar><bar>\<bar>+\<bar>-\<bar>/\<bar>>\<bar><\) \%#', 'bcn')? '<bs>= '
        \ : search('\(*\<bar>!\)\%#', 'bcn') ? '= '
        \ : smartchr#one_of(' = ', '=', ' == ')

  autocmd FileType haskell,int-ghci
        \ inoremap <buffer> <expr> + smartchr#loop('+', ' ++ ')
        \| inoremap <buffer> <expr> - smartchr#loop('-', ' -> ', ' <- ')
        \| inoremap <buffer> <expr> $ smartchr#loop(' $ ', '$')
        \| inoremap <buffer> <expr> \ smartchr#loop('\ ', '\')
        \| inoremap <buffer> <expr> : smartchr#loop(':', ' :: ', ' : ')
        \| inoremap <buffer> <expr> . smartchr#loop('.', ' . ', '..')

  autocmd FileType scala
        \ inoremap <buffer> <expr> - smartchr#loop('-', ' -> ', ' <- ')
        \| inoremap <buffer> <expr> = smartchr#loop(' = ', '=', ' => ')
        \| inoremap <buffer> <expr> : smartchr#loop(': ', ':', ' :: ')
        \| inoremap <buffer> <expr> . smartchr#loop('.', ' => ')

  autocmd FileType eruby
        \ inoremap <buffer> <expr> > smartchr#loop('>', '%>')
        \| inoremap <buffer> <expr> < smartchr#loop('<', '<%', '<%=')
augroup END
"}}}

" vimfiler"{{{
call vimfiler#set_execute_file('vim', 'vim')
call vimfiler#set_execute_file('txt', 'notepad')
call vimfiler#set_execute_file('c', ['vim', 'notepad'])

" Edit file by tabedit.
"let g:vimfiler_edit_action = 'tabopen'

let g:vimfiler_as_default_explorer = 1

" Enable file operation commands.
"let g:vimfiler_safe_mode_by_default = 0

" Like Textmate icons.
let g:vimfiler_tree_leaf_icon = ' '
let g:vimfiler_tree_opened_icon = '▾'
let g:vimfiler_tree_closed_icon = '▸'
let g:vimfiler_file_icon = '-'
let g:vimfiler_marked_file_icon = '*'

" Use trashbox.
" Windows only and require latest vimproc.
"let g:unite_kind_file_use_trashbox = 1
"}}}

" vimshell"{{{
let g:vimshell_user_prompt = 'fnamemodify(getcwd(), ":~")'
"let g:vimshell_right_prompt = 'vcs#info("(%s)-[%b]", "(%s)-[%b|%a]")'
let g:vimshell_enable_smart_case = 1

if has('win32') || has('win64')
  " Display user name on Windows.
  let g:vimshell_prompt = $USERNAME."% "
else
  " Display user name on Linux.
  let g:vimshell_prompt = $USER."% "

  call vimshell#set_execute_file('bmp,jpg,png,gif', 'gexe eog')
  call vimshell#set_execute_file('mp3,m4a,ogg', 'gexe amarok')
  let g:vimshell_execute_file_list['zip'] = 'zipinfo'
  call vimshell#set_execute_file('tgz,gz', 'gzcat')
  call vimshell#set_execute_file('tbz,bz2', 'bzcat')
endif

" Initialize execute file list.
let g:vimshell_execute_file_list = {}
call vimshell#set_execute_file('txt,vim,c,h,cpp,d,xml,java', 'vim')
let g:vimshell_execute_file_list['rb'] = 'ruby'
let g:vimshell_execute_file_list['pl'] = 'perl'
let g:vimshell_execute_file_list['py'] = 'python'
call vimshell#set_execute_file('html,xhtml', 'gexe firefox')

autocmd FileType vimshell
      \ call vimshell#altercmd#define('g', 'git')
      \| call vimshell#altercmd#define('i', 'iexe')
      \| call vimshell#altercmd#define('l', 'll')
      \| call vimshell#altercmd#define('ll', 'ls -l')
      \| call vimshell#hook#add('chpwd', 'my_chpwd', 'g:my_chpwd')

function! g:my_chpwd(args, context)
  call vimshell#execute('ls')
endfunction

autocmd FileType int-* call s:interactive_settings()
function! s:interactive_settings()
endfunction
"}}}

" git.vim{{{
let g:git_no_default_mappings = 1
let g:git_use_vimproc = 1
let g:git_command_edit = 'rightbelow vnew'
nnoremap <silent> [Space]gd :<C-u>Gdiff<CR>
nnoremap <silent> [Space]gD :<C-u>GitDiff<CR>
"nnoremap <silent> [Space]gs :<C-u>GitStatus<CR>
nnoremap <silent> [Space]gl :<C-u>GitLog<CR>
nnoremap <silent> [Space]gL :<C-u>GitLog -u \| head -10000<CR>
nnoremap <silent> [Space]ga :<C-u>GitAdd<CR>
nnoremap <silent> [Space]gA :<C-u>GitAdd <cfile><CR>
nnoremap <silent> [Space]gc :<C-u>Gcommit -a<CR>
"nnoremap <silent> [Space]gp q:Git push<Space>
"nnoremap <silent> [Space]gt q:Git tag<Space>
"}}}

" vcs.vim{{{
"nnoremap <silent> [Space]gc :<C-u>Vcs commit<CR>
"nnoremap <silent> [Space]gC :<C-u>Vcs commit --amend<CR>
nnoremap <silent> [Space]gs :<C-u>Vcs status<CR>
"}}}

" unite.vim"{{{
" The prefix key.
nnoremap    [unite]   <Nop>
xnoremap    [unite]   <Nop>
nmap    f [unite]
xmap    f [unite]
nnoremap	[Window]	<Nop>
nmap	s [Window]

nnoremap [unite]u  q:Unite<Space>
" nnoremap <silent> :  :<C-u>Unite history/command command<CR>
nnoremap <expr><silent> [unite]b  <SID>unite_build()
function! s:unite_build()
  return ":\<C-u>Unite -buffer-name=build". tabpagenr() ." -no-quit build\<CR>"
endfunction
nnoremap <silent> [unite]r  :<C-u>Unite -buffer-name=register register history/yank<CR>
nnoremap <silent> [unite]o  :<C-u>Unite outline -start-insert<CR>
nnoremap  [unite]f  :<C-u>Unite source<CR>
nnoremap <silent> [unite]t  :<C-u>UniteWithCursorWord -buffer-name=tag tag tag/include<CR>
xnoremap <silent> [unite]r  d:<C-u>Unite -buffer-name=register register history/yank<CR>
nnoremap <silent> [unite]w  :<C-u>UniteWithCursorWord -buffer-name=register
      \ buffer file_mru bookmark file<CR>
nnoremap <silent> [unite]h  :<C-u>Unite history/command<CR>
nnoremap <silent> [unite]q  :<C-u>Unite qflist -no-quit<CR>
nnoremap <silent> [unite]g  :<C-u>Unite grep -buffer-name=search -no-quit<CR>
nnoremap <silent> <C-k>  :<C-u>Unite change jump<CR>
nnoremap <silent> [unite]c  :<C-u>Unite change<CR>
"nnoremap <silent> [unite]f  :<C-u>Unite -buffer-name=resume resume<CR>
nnoremap <silent> [unite]d  :<C-u>Unite -buffer-name=files -default-action=lcd directory_mru<CR>
nnoremap <silent> [unite]ma  :<C-u>Unite mapping<CR>
nnoremap <silent> [unite]me  :<C-u>Unite output:message<CR>
inoremap <silent> <C-z>  <C-o>:call unite#start_complete(['register'], {'is_insert' : 1})<CR>

nnoremap <silent> [Window]s  :<C-u>Unite -buffer-name=files -no-split
      \ jump_point file_point buffer_tab file_rec/async:! file file/new file_mru<CR>
nnoremap <silent> [Window]t  :<C-u>Unite -buffer-name=files tab<CR>
nnoremap <silent> [Window]w  :<C-u>Unite window<CR>
nnoremap <silent> [Space]b  :<C-u>UniteBookmarkAdd<CR>

" t: tags-and-searches "{{{
" The prefix key.
nnoremap    [Tag]   <Nop>
nmap    t [Tag]
" Jump.
" nnoremap [Tag]t  <C-]>
nnoremap <silent><expr> [Tag]t  &filetype == 'help' ?  "\<C-]>" :
      \ ":\<C-u>UniteWithCursorWord -buffer-name=tag tag tag/include\<CR>"
" Jump next.
nnoremap <silent> [Tag]n  :<C-u>tag<CR>
" Jump previous.
" nnoremap <silent> [Tag]p  :<C-u>pop<CR>
nnoremap <silent><expr> [Tag]p  &filetype == 'help' ?
      \ ":\<C-u>pop\<CR>" : ":\<C-u>Unite jump\<CR>"
"}}}

" Execute help.
" nnoremap <C-h>  :<C-u>help<Space>
nnoremap <C-h>  :<C-u>UniteWithInput help<CR>
" Execute help by cursor keyword.
" nnoremap <silent> g<C-h>  :<C-u>help<Space><C-r><C-w><CR>
nnoremap <silent> g<C-h>  :<C-u>UniteWithCursorWord help<CR>

" Search.
nnoremap <expr> /  <SID>smart_search_expr('/',
      \ ":\<C-u>Unite -buffer-name=search -start-insert line\<CR>")
nnoremap <expr> g/  <SID>smart_search_expr('g/',
      \ ":\<C-u>Unite -buffer-name=search -start-insert line_migemo\<CR>")
nnoremap [Alt]/  g/
nnoremap <silent><expr> ? <SID>smart_search_expr('?',
      \ ":\<C-u>Unite mapping\<CR>")
nnoremap <silent><expr> * <SID>smart_search_expr('*',
      \ ":\<C-u>UniteWithCursorWord -input="
      \ . expand('<cword>') . " -buffer-name=search line\<CR>")

function! s:smart_search_expr(expr1, expr2)
  return line('$') > 4000 ?  a:expr1 : a:expr2
endfunction

nnoremap <expr><silent> N  <SID>smart_search_expr('N',
      \ ":\<C-u>Unite -buffer-name=search -input=" . @/
      \  . " -no-start-insert line\<CR>")
nnoremap <silent><expr> n  <SID>smart_search_expr('n',
      \ ":\<C-u>UniteResume search -no-start-insert\<CR>")

let g:unite_enable_split_vertically = 0
let g:unite_kind_file_cd_command = 'TabpageCD'
let g:unite_kind_file_lcd_command = 'TabpageCD'

let g:unite_source_history_yank_enable = 1

let g:unite_winheight = 20

autocmd MyAutoCmd FileType unite call s:unite_my_settings()

" Directory partial match.
" call unite#set_substitute_pattern('files', '\%([~.*]\+\)\@<!/', '*/*', 100)
" call unite#set_substitute_pattern('files', '^\\', substitute(substitute($HOME, '\\', '/', 'g'), ' ', '\\ ', 'g') . '/*', -100)
" Test.
" call unite#set_substitute_pattern('files', '^\.v/', unite#util#substitute_path_separator($HOME).'/.vim/', 1000)
call unite#set_substitute_pattern('files', '^\.v/',
      \ [expand('~/.vim/'), unite#util#substitute_path_separator($HOME) . '/.bundle/*/'], 1000)
call unite#set_substitute_pattern('files', '\.', '*.', 1000)
call unite#custom_alias('file', 'h', 'left')
call unite#custom_default_action('directory', 'narrow')
" call unite#custom_default_action('file', 'my_tabopen')
call unite#set_substitute_pattern('file', '[^~.]\zs/', '*/*', 20)

" Custom actions."{{{
let my_tabopen = {
      \ 'description' : 'my tabopen items',
      \ 'is_selectable' : 1,
      \ }
function! my_tabopen.func(candidates)"{{{
  call unite#take_action('tabopen', a:candidates)

  let dir = isdirectory(a:candidates[0].word) ? a:candidates[0].word : fnamemodify(a:candidates[0].word, ':p:h')
  execute g:unite_lcd_command '`=dir`'
endfunction"}}}
call unite#custom_action('file,buffer', 'tabopen', my_tabopen)
unlet my_tabopen
"}}}

" Custom filters."{{{
" call unite#custom_filters('file,buffer,file_rec', ['matcher_fuzzy', 'sorter_default', 'converter_default'])
"}}}

let g:unite_enable_start_insert = 0

function! s:unite_my_settings()"{{{
  " Overwrite settings.
  imap <buffer> jj <Plug>(unite_insert_leave)
  imap <buffer> <TAB> <Plug>(unite_select_next_line)
  imap <buffer> <C-w> <Plug>(unite_delete_backward_path)
  imap <buffer> ' <Plug>(unite_quick_match_default_action)
  nmap <buffer> ' <Plug>(unite_quick_match_default_action)
  imap <buffer><expr> x
        \ unite#smart_map('x', "\<Plug>(unite_quick_match_choose_action)")
  nmap <buffer> x <Plug>(unite_quick_match_choose_action)
  nmap <buffer> cd <Plug>(unite_quick_match_default_action)
  imap <buffer> <C-g> <Plug>(unite_input_directory)
  nmap <buffer> <C-z> <Plug>(unite_toggle_transpose_window)
  imap <buffer> <C-z> <Plug>(unite_toggle_transpose_window)
  imap <buffer> <C-y> <Plug>(unite_narrowing_path)
  nmap <buffer> <C-y> <Plug>(unite_narrowing_path)
  nmap <buffer> <C-j> <Plug>(unite_toggle_auto_preview)
  nmap <buffer> <C-r> <Plug>(unite_narrowing_input_history)
  imap <buffer> <C-r> <Plug>(unite_narrowing_input_history)
  nmap <silent><buffer> <Tab> :call <SID>NextWindow()<CR>
  nnoremap <silent><buffer><expr> l
        \ unite#smart_map('l', unite#do_action('default'))
  nunmap <buffer> x
  iunmap <buffer> x

  let unite = unite#get_current_unite()
  if unite.buffer_name =~# '^search'
    nnoremap <silent><buffer><expr> r unite#do_action('replace')
  else
    nnoremap <silent><buffer><expr> r unite#do_action('rename')
  endif

  nnoremap <silent><buffer><expr> cd unite#do_action('lcd')
  nnoremap <buffer><expr> S unite#mappings#set_current_filters(
        \ empty(unite#mappings#get_current_filters()) ? ['sorter_reverse'] : [])
  " Start insert.
endfunction"}}}

" For optimize.
let g:unite_cursor_line_highlight = 'CursorLine' 
"let g:unite_abbr_highlight = 'TabLine'
"let g:unite_source_file_mru_filename_format = ''
let g:unite_source_file_mru_filename_format  =  ':~:.'
let g:unite_source_file_mru_limit  =  300
" let g:unite_source_directory_mru_time_format  =  ''
let g:unite_source_directory_mru_limit  =  300

" For unite-session.
" Save session automatically.
"let g:unite_source_session_enable_auto_save = 1
" Load session automatically.
"autocmd VimEnter * UniteSessionLoad

" For ack.
if executable('ack-grep')
  let g:unite_source_grep_command = 'ack-grep'
  let g:unite_source_grep_default_opts = '--no-heading --no-color -a'
  let g:unite_source_grep_recursive_opt = ''
endif
"}}}

" jekyll.vim"{{{
let g:jekyll_path  =  "."
let g:jekyll_post_suffix = "md"
let g:jekyll_post_published = "false"
"let g:jekyll_post_created = "epoch"
"let g:jekyll_post_created = "%D %T"
let g:jekyll_prompt_tags = "true"
let g:jekyll_prompt_categories = "true"

nnoremap <Space>jb  :JekyllBuild<CR>
nnoremap <Space>jn  :JekyllPost<CR>
nnoremap <Space>jl  :JekyllList<CR>
"}}}

" lingr-vim"{{{
let g:lingr_vim_sidebar_width = 30

" Keymappings.
autocmd MyAutoCmd FileType lingr-messages call s:lingr_messages_my_settings()
autocmd MyAutoCmd FileType lingr-say call s:lingr_say_my_settings()
autocmd MyAutoCmd FileType lingr-rooms call s:lingr_looms_my_settings()

function! s:lingr_messages_my_settings()"{{{
  nmap <buffer> o <Plug>(lingr-messages-show-say-buffer)
  nunmap <buffer> s

  if has('win32') || has('win64')
    " Dirty shellslash hack.
    set noshellslash

    augroup MyAutoCmd
      autocmd WinEnter,BufWinEnter <buffer> set noshellslash
      autocmd WinLeave,BufWinLeave <buffer> set shellslash
    augroup END
  endif
endfunction"}}}
function! s:lingr_say_my_settings()"{{{
  imap <buffer> <CR> <Plug>(lingr-say-insert-mode-say)
  nmap <buffer> q <Plug>(lingr-say-close)
endfunction"}}}
function! s:lingr_looms_my_settings()"{{{
  nmap <buffer> l <Plug>(lingr-rooms-select-room)
endfunction"}}}

if !has('win32') || !has('win64')
  command! Suicide call system('kill -KILL ' . getpid())
endif
"}}}

" zencoding-vim"{{{
let g:user_zen_settings = {
      \  'lang' : 'ja',
      \  'html' : {
      \    'filters' : 'html',
      \    'indentation' : ' ',
      \    'snippets' : {
      \      'jq' : "<script src=\"//ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js\"></script>"
      \    }, 
      \  },
      \  'perl' : {
      \    'indentation' : '  ',
      \    'aliases' : {
      \      'req' : "require '|'"
      \    },
      \    'snippets' : {
      \      'use' : "use strict\nuse warnings\n\n",
      \      'w' : "warn \"${cursor}\";",
      \    },
      \  },
      \  'php' : {
      \    'extends' : 'html',
      \    'filters' : 'html,c',
      \  },
      \  'css' : {
      \    'filters' : 'fc',
      \  },
      \  'less' : {
      \    'filters' : 'fc',
      \    'extends' : 'css',
      \  },
      \  'javascript' : {
      \    'snippets' : {
      \      'jq' : "\\$(function() {\n\t\\${cursor}\\${child}\n});",
      \      'jq:json' : "\\$.getJSON(\"${cursor}\", function(data) {\n\t\\${child}\n});",
      \      'jq:each' : "\\$.each(arr, function(index, item)\n\t\\${child}\n});",
      \      'fn' : "(function() {\n\t\\${cursor}\n})();",
      \      'tm' : "setTimeout(function() {\n\t\\${cursor}\n}, 100);",
      \    },
      \  },
      \ 'java' : {
      \  'indentation' : '    ',
      \  'snippets' : {
      \   'main': "public static void main(String[] args) {\n\t|\n}",
      \   'println': "System.out.println(\"|\");",
      \   'class': "public class | {\n}\n",
      \  },
      \ },
      \}

let g:use_zen_complete_tag = 1
"}}}

" eskk.vim"{{{
if !exists('g:eskk#disable') || !g:eskk#disable
  " Disable skk.vim
  let g:plugin_skk_disable = 1

  let g:eskk#disable = 0

  let g:eskk#debug = 0

  " Don't keep state.
  let g:eskk#keep_state = 0

  let g:eskk#show_annotation = 1
  let g:eskk#rom_input_style = 'msime'
  let g:eskk#egg_like_newline = 1
  let g:eskk#egg_like_newline_completion = 1

  " Disable mapping.
  "let g:eskk#map_normal_keys = 0

  autocmd VimEnter * imap <C-j> <Plug>(eskk:toggle)
  autocmd VimEnter * cmap <C-j> <Plug>(eskk:toggle)

  "let g:eskk#dictionary = {
  "\ 'path': expand('~/.skk-eskk-jisyo'),
  "\ 'sorted': 0,
  "\ 'encoding': 'utf-8',
  "\}
  let g:eskk#large_dictionary = {
        \ 'path': expand('/usr/share/skk/SKK-JISYO.L'),
        \ 'sorted': 1,
        \ 'encoding': 'euc-jp',
        \}

  " Use /bin/sh -c "VTE_CJK_WIDTH=1 gnome-terminal --disable-factory" instead of this settings.
  "if &encoding == 'utf-8' && !has('gui_running')
  " GNOME Terminal only.

  " Use <> instead of ▽.
  "let g:eskk#marker_henkan = '<>'
  " Use >> instead of ▼.
  "let g:eskk#marker_henkan_select = '>>'
  "endif

  " Define table.
  autocmd MyAutoCmd User eskk-initialize-pre call s:eskk_initial_pre()
  function! s:eskk_initial_pre() "{{{
    let t = eskk#table#new('rom_to_hira*', 'rom_to_hira')
    call t.add_map('z ', '　')
    call t.add_map('~', '〜')
    call t.add_map('zc', '©')
    call t.add_map('zr', '®')
    call t.add_map('z9', '（')
    call t.add_map('z0', '）')
    call eskk#register_mode_table('hira', t)
    unlet t
  endfunction "}}}
endif
"}}}

" vinarise.vim"{{{
let g:vinarise_enable_auto_detect = 1
"}}}

" Syntastic"{{{
let g:syntastic_auto_loc_list=1
"}}}

" Tagbar"{{{
nmap <F8> :TagbarToggle<CR>
"}}}
