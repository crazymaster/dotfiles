set encoding=utf-8
scriptencoding utf-8

" neobundle.vim"{{{
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
"NeoBundleLazy 'Rip-Rip/clang_complete', {
"      \ 'autoload' : {
"      \     'filetypes' : ['c', 'cpp'],
"      \    },
"      \ }
NeoBundle 'Shougo/context_filetype.vim'
NeoBundle 'Shougo/echodoc'
NeoBundle 'Shougo/neocomplete.vim'
NeoBundle 'Shougo/neosnippet'
NeoBundle 'Shougo/neosnippet-snippets'
NeoBundle 'Shougo/unite-build'
NeoBundle 'Shougo/unite-outline'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/vim-vcs'
NeoBundle 'Shougo/vimfiler'
NeoBundle 'Shougo/vimshell'
NeoBundle 'Shougo/vinarise'
NeoBundle 'adie/BlockDiff'
NeoBundle 'bling/vim-airline'
NeoBundle 'csexton/jekyll.vim'
NeoBundle 'godlygeek/tabular'
NeoBundle 'groenewege/vim-less'
NeoBundle 'h1mesuke/vim-alignta'
NeoBundle 'hail2u/vim-css3-syntax'
NeoBundle 'honza/vim-snippets'
NeoBundle 'hrsh7th/vim-versions'
NeoBundle 'kana/vim-smartchr'
NeoBundleLazy 'kana/vim-smartinput'
NeoBundle 'majutsushi/tagbar'
NeoBundleLazy 'mattn/benchvimrc-vim',
      \ {'autoload' : { 'commands' : 'BenchVimrc'}}
NeoBundle 'mattn/emmet-vim'
NeoBundle 'mattn/excitetranslate-vim'
NeoBundle 'mattn/gist-vim'
NeoBundle 'mattn/unite-gist'
NeoBundle 'mattn/webapi-vim'
NeoBundle 'mattn/wwwrenderer-vim'
NeoBundle 'miripiruni/CSScomb-for-Vim'
NeoBundle 'motemen/git-vim'
NeoBundle 'osyo-manga/unite-quickfix'
NeoBundle 'othree/html5.vim'
NeoBundle 'pasela/unite-webcolorname'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'sophacles/vim-processing'
NeoBundle 'thinca/vim-openbuf'
NeoBundle 'thinca/vim-quickrun'
NeoBundle 'thinca/vim-ref'
NeoBundleLazy 'thinca/vim-scouter',
      \ {'autoload' : { 'commands' : 'Scouter'}}
NeoBundle 'thinca/vim-unite-history'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'tpope/vim-liquid'
NeoBundle 'tpope/vim-markdown'
NeoBundle 'tpope/vim-repeat'
NeoBundle 'tpope/vim-surround'
NeoBundle 'tsukkee/lingr-vim'
NeoBundle 'tsukkee/unite-help'
NeoBundle 'tsukkee/unite-tag'
NeoBundle 'tyru/eskk.vim'
NeoBundle 'tyru/open-browser.vim'
NeoBundle 'ujihisa/neco-look'
NeoBundleLazy 'lilydjwg/colorizer'
NeoBundleLazy 'skammer/vim-css-color'
NeoBundleLazy 'thinca/vim-showtime',
      \ {'autoload' : {'commands' : 'ShowtimeStart'}}
NeoBundleLazy 'ujihisa/unite-colorscheme'
NeoBundleLazy 'ujihisa/unite-font'
"NeoBundleLazy 'osyo-manga/unite-fold'
"NeoBundleLazy 'ujihisa/quicklearn'
"NeoBundleLazy 'ujihisa/unite-gem'
"NeoBundleLazy 'ujihisa/unite-locate'

"NeoBundle 'syngan/vim-vimlint', {
"    \ 'depends' : 'ynkdir/vim-vimlparser'}
"NeoBundle 'vim-jp/vital.vim'

" Vim-script repositories
NeoBundleLazy 'DirDiff.vim'

if has('unix')
  "NeoBundle 'lilydjwg/fcitx.vim'
  NeoBundle 'anekos/felis-cat-igirisu-toast-express'

  NeoBundle 'vim-jp/autofmt'
  NeoBundle 'vim-jp/vimdoc-ja'
  NeoBundle 'autodate.vim'

  " Build repos.
  NeoBundle 'Shougo/vimproc', {
        \ 'build' : {
        \     'unix' : 'make -f make_unix.mak',
        \    },
        \ }
endif

" Lazy load.
"NeoBundleLazy 'c9s/perlomni.vim.git'
"NeoBundleSource perlomni.vim
"NeoBundleLazy 'klen/python-mode'
"autocmd FileType python
"	  \ NeoBundleSource python-mode

" Go tools
if $GOROOT != ''
  set rtp+=$GOROOT/misc/vim,$GOPATH/src/github.com/nsf/gocode/vim
endif

" Disable netrw.vim
let g:loaded_netrwPlugin = 1

filetype plugin indent on       " Required!
" Installation check.
NeoBundleCheck
"}}}

" 文字コードの自動認識
set fileencodings=utf-8,iso-2022-jp,cp932,sjis,euc-jp
" 改行コードの自動認識
set fileformats=unix,dos,mac
" □とか○の文字があってもカーソル位置がずれないようにする
if exists('&ambiwidth')
  set ambiwidth=double
endif

set helplang=ja,en

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
syntax enable
"highlight Normal ctermbg=black ctermfg=grey
"highlight StatusLine term=none cterm=none ctermfg=black ctermbg=grey
highlight CursorLine term=none cterm=bold ctermfg=none ctermbg=darkgray
highlight SpellBad ctermbg=Red

" For vim-airline
set t_Co=256 " Explicitly tell vim that the terminal supports 256 colors
let g:airline_left_sep=''
let g:airline_right_sep=''
let g:airline#extensions#default#section_truncate_width = {}

"ポップアップ補完メニュー色設定
highlight Pmenu ctermbg=DarkGray ctermfg=White guibg=#606060
highlight PmenuSel ctermbg=Blue guibg=SlateBlue
highlight PmenuSbar ctermbg=Gray guibg=#404040
highlight PmenuThumb ctermbg=DarkBlue guibg=Red

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
set tabstop=4
set softtabstop=2
set shiftwidth=2
set smarttab
set shiftround
" タブをスペースに展開する
"set expandtab
" 自動的にインデントする
set autoindent
" 検索時にファイルの最後まで行ったら最初に戻る
set wrapscan
" 括弧入力時に対応する括弧を表示
set showmatch
" コマンドライン補完するときに強化されたものを使う
set wildmenu
" テキスト挿入中の自動折り返しを日本語に対応させる
set formatoptions+=mM

" 日本語の整形にautofmtを使う。Kaoriya版だとデフォルトで設定済み
set formatexpr=autofmt#japanese#formatexpr()
"set colorcolumn=+1    " textwidth を越えた部分に色を付ける
let autofmt_allow_over_tw=1  " ぶら下げを半角1文字分まで許可

" インクリメンタル検索を有効化
set incsearch
" 検索時に大文字小文字を無視
set ignorecase
" 大文字小文字の両方が含まれている場合は大文字小文字を区別
set smartcase

" 補完時の一覧表示機能有効化
set wildmenu
" ファイル名補完時に無視するファイルパターン
set wildignore=*.o,*.obj,*.bak,*.swp,*.d,*~

set spelllang=en,cjk
set nofoldenable
set history=100

" ビジュアルモードでインデント変更後も選択を継続
vnoremap < <gv
vnoremap > >gv

" 表示行移動
nnoremap j gj
nnoremap k gk

" 連続コピペ
vnoremap <silent> <C-p> "0p<CR>

nnoremap <silent> <Space>. :<C-u>edit $MYVIMRC<CR>

" クリップボードを利用する
if has('unnamedplus')
  set clipboard=unnamedplus
else
  set clipboard=unnamed
endif

" 自動的にQuickFixを開く
"autocmd QuickfixCmdPost make,grep,grepadd,vimgrep copen

" Add path
if has('unix')
  set path+=/usr/include/qt5,/usr/local/include/bullet
endif

" quickrun.vim"{{{
let g:quickrun_config = {}
let g:quickrun_config.markdown = {
      \ 'outputter': 'browser'
      \ }
let g:quickrun_config.html = {
      \ 'outputter': 'null',
      \ 'command': 'firefox'
      \ }
let g:quickrun_config.processing =  {
	  \ 'command': 'processing-java',
	  \ 'runner' : 'vimproc',
	  \ 'exec': '%c --sketch=$PWD/ --output=/tmp/processing --run --force',
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
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplete#undo_completion()
inoremap <expr><C-l>     neocomplete#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
"inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
"function! s:my_cr_function()
"  return neocomplete#smart_close_popup() . "\<CR>"
"  " For no inserting <CR> key.
"  return pumvisible() ? neocomplete#close_popup() : "\<CR>"
"endfunction

" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplete#close_popup()
inoremap <expr><C-e>  neocomplete#cancel_popup()
" Close popup by <Space>.
"inoremap <expr><Space> pumvisible() ? neocomplete#close_popup() : "\<Space>"

" For cursor moving in insert mode(Not recommended)
inoremap <expr><Left>  neocomplete#close_popup() . "\<Left>"
inoremap <expr><Right> neocomplete#close_popup() . "\<Right>"
"inoremap <expr><Up>    neocomplete#close_popup() . "\<Up>"
"inoremap <expr><Down>  neocomplete#close_popup() . "\<Down>"
" Or set this.
"let g:neocomplete#enable_cursor_hold_i = 1
" Or set this.
"let g:neocomplete#enable_insert_char_pre = 1

" AutoComplPop like behavior.
"let g:neocomplete#enable_auto_select = 1

" Shell like behavior(not recommended).
"set completeopt+=longest
"let g:neocomplete#enable_auto_select = 1
"let g:neocomplete#disable_auto_complete = 1
"inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif
let g:neocomplete#sources#omni#input_patterns.php =
      \ '[^. \t]->\%(\h\w*\)\?\|\h\w*::\%(\h\w*\)\?'
let g:neocomplete#sources#omni#input_patterns.c =
      \ '[^.[:digit:] *\t]\%(\.\|->\)\%(\h\w*\)\?'
let g:neocomplete#sources#omni#input_patterns.cpp =
      \ '[^.[:digit:] *\t]\%(\.\|->\)\%(\h\w*\)\?\|\h\w*::\%(\h\w*\)\?'

" For perlomni.vim setting.
" https://github.com/c9s/perlomni.vim
let g:neocomplete#sources#omni#input_patterns.perl =
      \ '[^. \t]->\%(\h\w*\)\?\|\h\w*::\%(\h\w*\)\?'
"}}}

" neosnippet"{{{
" Plugin key-mappings.
imap <C-k> <Plug>(neosnippet_expand_or_jump)
smap <C-k> <Plug>(neosnippet_expand_or_jump)
xmap <C-k> <Plug>(neosnippet_expand_target)
xmap <C-l> <Plug>(neosnippet_start_unite_snippet_target)

" SuperTab like snippets behavior.
"imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
"      \ "\<Plug>(neosnippet_expand_or_jump)"
"      \: pumvisible() ? "\<C-n>" : "\<TAB>"
"smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
"      \ "\<Plug>(neosnippet_expand_or_jump)"
"      \: "\<TAB>"

" For snippet_complete marker.
if has('conceal')
  set conceallevel=2 concealcursor=i
endif

" Enable snipMate compatibility feature.
let g:neosnippet#enable_snipmate_compatibility = 1

" Tell Neosnippet about the other snippets
let g:neosnippet#snippets_directory='$DOTVIM/bundle/vim-snippets/snippets'
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
nmap    [Space] [unite]
xmap    [Space] [unite]
nnoremap	[Window]	<Nop>
nmap	s [Window]

nnoremap <expr><silent> [unite]b  <SID>unite_build()
function! s:unite_build()
  return ":\<C-u>Unite -buffer-name=build". tabpagenr() ." -no-quit build\<CR>"
endfunction
nnoremap <silent> [unite]r  :<C-u>Unite -buffer-name=register register history/yank<CR>
nnoremap <silent> [unite]o  :<C-u>Unite outline<CR>
nnoremap <silent> [unite]t  :<C-u>UniteWithCursorWord -buffer-name=tag tag tag/include<CR>
xnoremap <silent> [unite]r  d:<C-u>Unite -buffer-name=register register history/yank<CR>
nnoremap <silent> [unite]w  :<C-u>UniteWithCursorWord -buffer-name=register
      \ buffer file_mru bookmark file<CR>
nnoremap <silent> [unite]h  :<C-u>Unite history/command<CR>
nnoremap <silent> [unite]q  :<C-u>Unite qflist -no-quit<CR>
nnoremap <silent> [unite]g  :<C-u>Unite grep -buffer-name=search -no-quit<CR>
nnoremap <silent> <C-k>  :<C-u>Unite change jump<CR>
nnoremap <silent> [unite]c  :<C-u>Unite change<CR>
nnoremap <silent> [unite]d  :<C-u>Unite -buffer-name=files -default-action=lcd directory_mru<CR>
nnoremap <silent> [unite]ma :<C-u>Unite mapping<CR>
nnoremap <silent> [unite]me :<C-u>Unite output:message -wrap<CR>
nnoremap <silent> [unite]up :<C-u>Unite neobundle/update -log -wrap<CR>
inoremap <silent> <C-z>  <C-o>:call unite#start_complete(['register'], {'is_insert' : 1})<CR>
nnoremap  [unite]f  :<C-u>Unite source<CR>

nnoremap <silent> [Window]s  :<C-u>Unite -buffer-name=files -no-split
      \ jump_point file_point buffer_tab file_rec/async:!
      \ file file/new file_mru<CR>
nnoremap <silent> [Window]c  :<C-u>UniteWithCurrentDir
      \ -buffer-name=files buffer file_mru bookmark file<CR>
nnoremap <silent> [Window]t  :<C-u>Unite -buffer-name=files tab<CR>
nnoremap <silent> [Window]w  :<C-u>Unite window<CR>

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
nnoremap <C-h>  :<C-u>help<Space>
"nnoremap <C-h>  :<C-u>UniteWithInput help<CR>
" Execute help by cursor keyword.
nnoremap <silent> g<C-h>  :<C-u>help<Space><C-r><C-w><CR>
"nnoremap <silent> g<C-h>  :<C-u>UniteWithCursorWord help<CR>

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

" unite-menu {{{
if !exists('g:unite_source_menu_menus')
  let g:unite_source_menu_menus = {}
endif

let g:unite_source_menu_menus.shortcut =
      \ {'description' : 'shortcut'}
let g:unite_source_menu_menus.shortcut.command_candidates = [
      \ ['vimrc', 'edit $MYVIMRC'],
      \ ['gvimrc', 'edit $MYGVIMRC'],
      \ ['neobundles', 'Unite directory:$DOTVIM/bundle'],
      \ ['AllMap', 'Unite output:map|map!|lmap'],
      \ ['Unite Beautiful Attack', 'Unite -auto-preview colorscheme'],
      \ ['text width over', '/\%>79v'],
      \ ]
nnoremap <silent> [unite]s  :<C-u>Unite menu:shortcut<CR>

let g:unite_source_menu_menus.fenc =
      \ {'description' : 'Change file fenc option.'}
let g:unite_source_menu_menus.fenc.command_candidates = [
      \ ['utf8', 'setlocal fenc=utf8'],
      \ ['iso2022jp', 'setlocal fenc=iso2022jp'],
      \ ['cp932', 'setlocal fenc=cp932'],
      \ ['euc', 'setlocal fenc=euc'],
      \ ['utf16', 'setlocal fenc=utf16'],
      \ ['utf16-be', 'setlocal fenc=utf16be'],
      \ ['jis', 'setlocal fenc=jis'],
      \ ['sjis', 'setlocal fenc=sjis'],
      \ ['unicode', 'setlocal fenc=unicode'],
      \ ]

let g:unite_source_menu_menus.ff =
      \ {'description' : 'Change file format option.'}
let g:unite_source_menu_menus.ff.command_candidates = [
      \ ['unix', 'setlocal ff=unix'],
      \ ['dos', 'setlocal ff=dos'],
      \ ['mac', 'setlocal ff=mac'],
      \ ]
"}}}

"let g:unite_enable_split_vertically = 1
let g:unite_source_history_yank_enable = 1

let g:unite_winheight = 20
let g:unite_winwidth  = 78

"let g:unite_enable_start_insert = 1

autocmd MyAutoCmd FileType unite call s:unite_my_settings()

function! s:unite_my_settings() "{{{
  " Overwrite settings.
  "nmap <buffer> <ESC>      <Plug>(unite_exit)
  imap <buffer> jj <Plug>(unite_insert_leave)
  imap <buffer> <Down> <Plug>(unite_insert_leave)
  "imap <buffer> <C-w> <Plug>(unite_delete_backward_path)
  imap <buffer><expr> j unite#smart_map('j', '')
  imap <buffer> ' <Plug>(unite_quick_match_default_action)
  nmap <buffer> ' <Plug>(unite_quick_match_default_action)
  imap <buffer><expr> x
        \ unite#smart_map('x', "\<Plug>(unite_quick_match_choose_action)")
  nmap <buffer> x <Plug>(unite_quick_match_choose_action)
  nmap <buffer> cd <Plug>(unite_quick_match_default_action)
  nmap <buffer> <C-z> <Plug>(unite_toggle_transpose_window)
  imap <buffer> <C-z> <Plug>(unite_toggle_transpose_window)
  imap <buffer> <C-y> <Plug>(unite_narrowing_path)
  nmap <buffer> <C-y> <Plug>(unite_narrowing_path)
  nmap <buffer> <C-j> <Plug>(unite_toggle_auto_preview)
  nnoremap <silent><buffer><expr> l
        \ unite#smart_map('l', unite#do_action('default'))

  let unite = unite#get_current_unite()
  if unite.buffer_name =~# '^search'
    nnoremap <silent><buffer><expr> r unite#do_action('replace')
  else
    nnoremap <silent><buffer><expr> r unite#do_action('rename')
  endif

  nnoremap <silent><buffer><expr> cd unite#do_action('lcd')
  nnoremap <buffer><expr> S unite#mappings#set_current_filters(
        \ empty(unite#mappings#get_current_filters()) ? ['sorter_reverse'] : [])
endfunction "}}}

let g:unite_cursor_line_highlight = 'CursorLine'
"let g:unite_abbr_highlight = 'TabLine'

" For optimize.
let g:unite_source_file_mru_filename_format = ''

"if executable('jvgrep')
"  " For jvgrep.
"  let g:unite_source_grep_command = 'jvgrep'
"  let g:unite_source_grep_default_opts = '--exclude ''\.(git|svn|hg|bzr)'''
"  let g:unite_source_grep_recursive_opt = '-R'
"endif

" For ack.
"if executable('ack-grep')
"  let g:unite_source_grep_command = 'ack-grep'
"  let g:unite_source_grep_default_opts = '--no-heading --no-color -a -H'
"  let g:unite_source_grep_recursive_opt = ''
"endif
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

function! s:lingr_messages_my_settings() "{{{
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
endfunction "}}}
function! s:lingr_say_my_settings() "{{{
  imap <buffer> <CR> <Plug>(lingr-say-insert-mode-say)
  nmap <buffer> q <Plug>(lingr-say-close)
endfunction "}}}
function! s:lingr_looms_my_settings() "{{{
  nmap <buffer> l <Plug>(lingr-rooms-select-room)
endfunction "}}}

if !has('win32') || !has('win64')
  command! Suicide call system('kill -KILL ' . getpid())
endif
"}}}

" emmet-vim"{{{
let g:user_emmet_settings = {
      \  'lang' : 'ja',
      \  'html' : {
      \    'filters' : 'html',
      \    'indentation' : ' ',
      \    'snippets' : {
      \      'jq' : "<script src=\"//ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js\"></script>"
      \    },
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
      \}

let g:use_emmet_complete_tag = 1
"}}}

" eskk.vim"{{{
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
"}}}

" vinarise.vim"{{{
let g:vinarise_enable_auto_detect = 1
"}}}

" Syntastic"{{{
let g:syntastic_auto_loc_list = 2
"}}}

" Tagbar"{{{
nmap <F8> :TagbarToggle<CR>
"}}}
