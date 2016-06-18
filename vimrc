" Taurus Olson's vim configuration file

" set nocompatible 

syntax on
filetype plugin indent on


" Autocmds {{{1

augroup vimrc_group
    autocmd!

    " cd into the current directory
    " autocmd BufEnter * if strpart(expand("%:h"), 0, 8) !=# 'fugitive' | silent cd %:p:h
    " autocmd BufEnter * if expand("%") !=# "~/.vimrc" | silent cd %:p:h

    " cd into the root of the source code repo
    autocmd BufEnter * exe 'RepoRoot '.expand('%:p:h')
    autocmd Filetype crontab  setlocal nobackup nowritebackup

    " Resize splits when the window is resized
    autocmd VimResized * exe "normal! \<c-w>="

    " Save when losing focus
    autocmd FocusLost * :silent! wall

    " Fold method is fold marker for any filetype
    autocmd Filetype vim,r setlocal fdm=marker

    " Prevent auto comment prefixing
    autocmd FileType * setlocal formatoptions-=r formatoptions-=o

    " In netrw, go to above directory
    autocmd FileType netrw nmap <buffer> <backspace> -

    " Open vim help for word under cursor
    autocmd Filetype vim,help nnoremap <silent> K :let word=expand("<cword>")<CR>:exec("help ". word)<CR>

    " Execute the current line
    autocmd FileType vim nnoremap <Leader>S ^vg_y:execute @@<CR>

    " PYTHON
    autocmd FileType python setlocal softtabstop=4 tabstop=4 shiftwidth=4 textwidth=79
    autocmd FileType python setlocal omnifunc=pythoncomplete#Complete

    " PROCESSING
    autocmd FileType reprocessed setlocal fdm=syntax sw=2 ts=2 textwidth=79 commentstring=//\ %s
    autocmd FileType reprocessed nnoremap <buffer> <LocalLeader>r :RunProcessing<CR>
    autocmd FileType reprocessed nnoremap <buffer> <LocalLeader>o :silent !open -a Processing.app %<CR>

    " R
    autocmd FileType r setlocal commentstring=#%s
    autocmd FileType r setlocal softtabstop=4 tabstop=4 shiftwidth=4 textwidth=79

    " CSS
    autocmd Filetype css setlocal foldmethod=marker
    autocmd Filetype css setlocal foldmarker={,}
    autocmd Filetype css setlocal omnifunc=csscomplete#CompleteCSS
    autocmd Filetype css setlocal iskeyword+=-
    " Sort properties alphabetically
    autocmd FileType css nnoremap <buffer> <LocalLeader>S ?{<CR>jV/\v^\s*\}?$<CR>k:sort<CR>:noh<CR>

    " RST
    autocmd FileType rst setlocal suffixesadd=.rst

    " Quickfix
    autocmd FileType qf setlocal cursorline

    " Clojure
    " Eval current line and jump to next element (use vim-sexp)
    autocmd FileType clojure nmap <buffer> <CR> :Eval<CR><Plug>(sexp_move_to_next_element_head)
    " Eval current line
    autocmd FileType clojure nnoremap <buffer> <S-CR> :Eval<CR>
    " Eval current line and write its result at the end of the line (use
    " vim-fireplace)
    autocmd FileType clojure nmap <C-CR> yyp<Plug>FireplaceFilterabI;;<SPACE>=><SPACE><ESC>kJ0
    autocmd FileType clojure imap <C-CR> <ESC>yyp<Plug>FireplaceFilterabI;;<SPACE>=><SPACE><ESC>kJ0
    autocmd FileType clojure nnoremap m'g$ f;D``

    autocmd QuickFixCmdPost grep,make,grepadd,vimgrep,vimgrepadd,cscope,cfile,cgetfile,caddfile,helpgrep cwindow
    autocmd QuickFixCmdPost lgrep,lmake,lgrepadd,lvimgrep,lvimgrepadd,lfile,lgetfile,laddfile lwindow

    " LATEX
    autocmd FileType tex inoremap <buffer> é \'e
    autocmd FileType tex inoremap <buffer> è \`e
    autocmd FileType tex inoremap <buffer> à \`a

    " GO
    autocmd FileType go setlocal softtabstop=4 tabstop=4 shiftwidth=4 textwidth=79

augroup END


" HTML {{{1
let g:html_indent_inctags = "html,body,head,tbody" 


" Mappings {{{1
let mapleader = ","
let maplocalleader = "\\"
inoremap kj <ESC>
nnoremap <C-SPACE> :w<CR>

" Paste (by sheerun)
vnoremap <silent> y y`]
vnoremap <silent> p p`]
nnoremap <silent> p p`]

" Paste and indent
nnoremap p ]p
nnoremap P [p
nnoremap =p :set paste!<CR>

" Movements for paragraphs
nnoremap <C-d> })
nnoremap <C-u> {(

" Source files
nnoremap <Leader>u :so ~/.vim/vimrc<CR>
nnoremap <Leader>s :so %<CR>

" Edit files
nnoremap <Leader>v :e ~/.vim/vimrc<CR>
nnoremap <Leader>V :sp ~/.vim/vimrc<CR>

" Search 
nnoremap <Leader>* /\<\><Left><Left>

" Tags
nnoremap <Leader>t <C-]>
nnoremap <LocalLeader>t :!/usr/local/bin/ctags -R .<CR>

" Togglable options
nnoremap cor :set relativenumber!<CR>
nnoremap con :set number!<CR>
nnoremap cul :set cul!<CR>
nnoremap cuc :set cuc!<CR>

nnoremap <LocalLeader><SPACE> :nohlsearch<CR>
vnoremap $ g_
nnoremap <Leader>cd :cd %:p:h<CR>
nnoremap <Leader>bg :let &background = ( &background == "dark"? "light" : "dark" )<CR>

" Display syntax name or fg color 
nnoremap <Leader>h :echo synIDattr(synID(line("."), col("."), 1), "name")<CR>
nnoremap <Leader>H :echo synIDattr(synIDtrans(synID(line("."), col("."), 1)), "fg")<CR>
" source $VIMRUNTIME/syntax/hitest.vim

" Replace visual selection
vnoremap <C-r> "hy:%s/<C-r>h//gc<left><left><left>

" Display info
nnoremap g<C-p> :pwd<CR>

" In insert mode {{{2
inoremap <C-E> <ESC>A
inoremap <C-A> <ESC>I
inoremap <C-K> <C-o>C
inoremap <C-^> <C-o><C-^>

" In command mode {{{2
cnoremap <C-A> <HOME>
cnoremap <C-E> <END>

" Navigation {{{2
nnoremap <Leader>e :Explore<CR>
 
" Jump to definition and open it in vertical split 
nnoremap <silent> <Leader>T :let word=expand("<cword>")<CR>:vertical topleft split<CR>:wincmd w<cr>:exec("tag ". word)<CR>

" Open a Quickfix window for the last search.
nnoremap <silent> <leader>? :execute 'vimgrep /'.@/.'/g %'<CR>:copen<CR>

" Keep the cursor in place while joining lines (emilyst)
nnoremap J mzJ`z
 
" [count]S: Repeat [count] times the last modification
nnoremap S :normal n.<CR>

" Folds {{{2
nnoremap <SPACE> za 
nnoremap g1 A<SPACE>{{{1<ESC>
nnoremap g2 A<SPACE>{{{2<ESC>
nnoremap g3 A<SPACE>{{{3<ESC>

" Windows {{{2
" Jump to a window
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
nnoremap <TAB> <C-w>w

" Close a window
nnoremap <C-c>h <C-w>h:q<CR>
nnoremap <C-c>j <C-w>j:q<CR>
nnoremap <C-c>k <C-w>k:q<CR>
nnoremap <C-c>l <C-w>l:q<CR>

" Resize a window
nnoremap <C-up> 5<C-W>+
nnoremap <C-down> 5<C-W>-
nnoremap <C-left> 5<C-W><
nnoremap <C-right> 5<C-W>>

" Tabs {{{2
nnoremap <C-w>t :tabedit %<CR>

" Faster  {{{2
nnoremap Y y$
nnoremap Q :q<CR>


" Options {{{1
set ttyfast
set hlsearch
set vb t_vb=
set splitright
set shiftwidth=4
set hidden
set expandtab
set showcmd
set noswapfile
set undofile
set guicursor+=n-v-c:blinkon0
set history=100
set virtualedit=block
set grepprg=git\ grep\ -n\ $*
" set grepprg=ag\ --nogroup\ --nocolor
set number

" Adapt the background to the current time
" if strftime("%H") > 8 && strftime("%H") < 17
"     set background=light
" else
"     set background=dark
" endif
set background=dark

" Folds
set nofoldenable


" Directories {{{2
set undodir=~/.vim/tmp/undo/     " undo files
set backupdir=~/.vim/tmp/backup/ " backups
set directory=~/.vim/tmp/swap/   " swap files

if !isdirectory(expand(&undodir))
    call mkdir(expand(&undodir), "p")
endif
if !isdirectory(expand(&backupdir))
    call mkdir(expand(&backupdir), "p")
endif
if !isdirectory(expand(&directory))
    call mkdir(expand(&directory), "p")
endif


" Tags {{{2
set tagstack
set tags=./tags,tags,.git/tags

" GUI {{{2
if has('gui_running')
    set guioptions=g
    " set guifont=Menlo:h17
    set guifont=Inconsolata:h22
    set linespace=6
else
    set t_Co=256
endif

" Statusline  {{{2
set statusline=
set statusline+=%-20.20(%f\ %m%)
set statusline+=%{fugitive#statusline()}
set statusline+=%=
set statusline+=%-14.(%c%V%)


" Functions {{{1
" StarRange {{{2
" Author: Shuhei Kubota
" Description: Search a string that you selected in visual mode.

let s:StarRange__reg = ''

function! s:StarRange__keepReg()
  let s:StarRange__reg = @*
endfunction

function! s:StarRange__restoreReg()
  let @* = s:StarRange__reg
endfunction

function! s:StarRange__substituteSpecialChars(str)
    let result = escape(a:str, '\')
    let result = substitute(result, '/', '\\/', 'g')
    let result = substitute(result, '\r\n\|\r\|\n', '\\n', 'g')
    return result
endfunction

xnoremap * :call <SID>StarRange__keepReg()<CR>gv"*y/\V<C-R>=<SID>StarRange__substituteSpecialChars(@*)<CR><CR>:call <SID>StarRange__restoreReg()<CR>:echo<CR>
xnoremap # :call <SID>StarRange__keepReg()<CR>gv"*y?\V<C-R>=<SID>StarRange__substituteSpecialChars(@*)<CR><CR>:call <SID>StarRange__restoreReg()<CR>:echo<CR>


" Useful file manipulation functions {{{2
function! RemoveFile(...)
    if a:0 == 0
        let s:file = expand("%:p")
    else
        let s:file = a:1
    endif
    execute "silent !rm " . s:file
    execute "bdelete " . s:file
    echom "Removed " . s:file
endfunction

command! -nargs=? -complete=file Rm :call RemoveFile(<f-args>)

function! RenameFile(newName)
    execute "saveas " . a:newName
    silent call RemoveFile(expand("#:p"))
endfunction

command! -nargs=1 -complete=file Mv :call RenameFile(<f-args>)


" Source the current selection {{{2
":[range]Source    Execute text lines as ex commands.
"           Handles |line-continuation|.
command! -bar -range Source silent <line1>,<line2>yank z | let @z = substitute(@z, '\n\s*\\', '', 'g') | @z


" Plugins {{{1
call plug#begin('~/.vim/bundle')

" Use GitHub username if local source dir isn't set
" (https://github.com/noahfrederick/dots/blob/master/vim/vimrc)
let $PLUG_SRC = exists('$PROJECTS') ? $PROJECTS : 'TaurusOlson'

Plug '$PLUG_SRC/darkburn.vim'
Plug '$PLUG_SRC/hornet.vim'
Plug '$PLUG_SRC/graffik.vim'
Plug '$PLUG_SRC/creature.vim'
Plug 'altercation/vim-colors-solarized'
Plug 'morhetz/gruvbox'
Plug 'w0ng/vim-hybrid'
Plug 'dracula/vim'
Plug 'sjl/badwolf'
Plug 'whatyouhide/vim-gotham'
Plug 'vim-scripts/plum.vim'


" ctrlpvim/ctrlp.vim {{{2
Plug 'ctrlpvim/ctrlp.vim'
let g:ctrlp_buftag_ctags_bin = '/usr/local/bin/ctags'
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
" map <D-t> :CtrlP<CR>
map <D-b> :CtrlPBuffer<CR>
map <D-g> :CtrlPBufTag<CR>
map <D-t> :CtrlPTag<CR>
map <D-r> :CtrlPCurFile<CR>
nnoremap <D-u> :CtrlPMRU<CR>
nnoremap <D-s> :CtrlP ~/.vim/bundle<CR>
nnoremap <LocalLeader>a :CtrlPBookmarkDirAdd .<CR>
let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

" tpope/vim-fugitive {{{2
Plug 'tpope/vim-fugitive'
nnoremap gs :Gstatus<CR>
nnoremap ga :Git add %<CR>
nnoremap gw :Gwrite<CR>
nnoremap go :Gcommit<CR>
nnoremap gD :Gdiff<CR>
nnoremap gl :Glog<CR>
nnoremap g<C-b> :echo fugitive#statusline()<CR>
autocmd BufReadPost fugitive://* set bufhidden=delete
autocmd FileType gitcommit setlocal cursorline


" tpope/vim-surround {{{2
Plug 'tpope/vim-surround'


" tpope/vim-commentary {{{2
Plug 'tpope/vim-commentary'


" tpope/vim-repeat {{{2
Plug 'tpope/vim-repeat'


" tpope/vim-sensible {{{2
Plug 'tpope/vim-sensible'


" tpope/vim-dispatch {{{2
Plug 'tpope/vim-dispatch'


" SirVer/ultisnips {{{2
Plug 'SirVer/ultisnips'
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
let g:UltiSnipsSnippetsDir='~/.vim/ultisnippets'
let g:UltiSnipsSnippetDirectories=['ultisnippets']
nnoremap <LocalLeader>s :split ~/.vim/ultisnippets<CR>


" ervandew/supertab {{{2
Plug 'ervandew/supertab'
let g:SuperTabDefaultCompletionType = "<C-N>"
let g:SuperTabContextTextOmniPrecedence = ['&omnifunc', '&completefunc']
let g:SuperTabContextDiscoverDiscovery =
    \ ["&omnifunc:<c-x><c-o>", "&completefunc:<c-x><c-u>",]
let g:SuperTabDefaultCompletionType = "context"


" " vim-scripts/Notes {{{2
" Plug 'vim-scripts/Notes'
" let g:notesRoot='~/Dropbox/Blogs/vimwiki/'
" let g:notesFileType = 'vimwiki'
" let g:notesFileExtension = '.wiki'
" let g:notesWordSeparator = '_'


" majutsushi/tagbar {{{2
Plug 'majutsushi/tagbar'
nnoremap ;t :TagbarToggle<CR>
let g:tagbar_sort = 0
let g:tagbar_compact = 1
let g:tagbar_autopreview = 0
let g:tagbar_iconchars = ['▸','▾']


" rking/ag.vim {{{2
Plug 'rking/ag.vim', {'on': 'Ag'}
nnoremap <Leader>a :Ag!<SPACE><c-r>=expand('<cword>')<CR><CR>
nnoremap <Leader>A :Ag<SPACE>


" plasticboy/vim-markdown {{{2
Plug 'plasticboy/vim-markdown'
let g:vim_markdown_folding_disabled=0
let g:vim_markdown_initial_foldlevel=0
autocmd BufEnter *.html.pmd setlocal ft=markdown


" godlygeek/tabular {{{2
Plug 'godlygeek/tabular', {'on': 'Tabularize'}
nnoremap =a<Space> :Tabularize  / /<CR>
vnoremap =a<Space> :Tabularize  / /<CR>
nnoremap =a=       :Tabularize  /=<CR>
vnoremap =a=       :Tabularize  /=<CR>
nnoremap =a:       :Tabularize  /:<CR>
vnoremap =a:       :Tabularize  /:<CR>
nnoremap =a,       :Tabularize  /,<CR>
vnoremap =a,       :Tabularize  /,<CR>
 

" wellle/targets.vim {{{2
Plug 'wellle/targets.vim'


" mattn/emmet-vim {{{2
Plug 'mattn/emmet-vim'


" vim-scripts/Vim-R-plugin {{{2
Plug 'jcfaria/Vim-R-plugin'
" Lines added by the Vim-R-plugin command :RpluginConfig (2014-Sep-24 00:10):
" Press the space bar to send lines (in Normal mode) and selections to R:
autocmd FileType r vmap <buffer> <Space> <Plug>RDSendSelection
autocmd FileType r nmap <buffer> <Space> <Plug>RDSendLine


" csexton/jekyll.vim {{{2
Plug 'csexton/jekyll.vim', {'on': 'JekyllList'}
let g:jekyll_path = "~/Blog/taurusolson.github.com"


" jeffkreeftmeijer/vim-numbertoggle {{{2
Plug 'jeffkreeftmeijer/vim-numbertoggle'


" itchyny/lightline.vim {{{2
Plug 'itchyny/lightline.vim'
let g:lightline = { 
            \ 'colorscheme': 'Tomorrow',
            \ 'separator': { 'left': '⮀', 'right': '⮂' },
            \ 'subseparator': { 'left': '⮁', 'right': '⮃' }
            \ }

let g:lightline.active = {
            \ 'left': [['mode', 'paste', 'modified'], ['filename', 'fugitive', 'virtualenv', 'syntastic']],
            \ 'right': [['tagbar', 'lineinfo']],
            \ }

let g:lightline.inactive = {
            \ 'left': [['mode', 'paste'], ['filename', 'fugitive']],
            \ 'right': [['lineinfo']],
            \ }

let g:lightline.component_function = {
            \ 'fugitive': 'MyFugitive',
            \ 'tagbar': 'MyTagBar',
            \ 'virtualenv': 'MyVirtualEnv',
            \ }

let g:lightline.component_expand = {
            \ 'syntastic': 'SyntasticStatuslineFlag',
            \ }

let g:lightline.component_type = {
            \ 'syntastic': 'error',
            \ }

" augroup AutoSyntastic
"     autocmd!
"     autocmd BufWritePost *.clj,*.py call s:syntastic()
" augroup END

" function! s:syntastic()
"     SyntasticCheck
"     call lightline#update()
" endfunction

let g:lightline.tab = {
            \ 'active': [ 'tabnum', 'filename', 'modified' ],
            \ 'inactive': [ 'tabnum', 'filename', 'modified' ] }

augroup LightLineColorscheme
    autocmd!
    autocmd ColorScheme * call s:lightline_update()
augroup END

function! s:lightline_update()
    if !exists('g:loaded_lightline')
        return
    endif
    try
        if g:colors_name =~# 'wombat\|solarized\|landscape\|jellybeans\|Tomorrow\|gotham'
            let g:lightline.colorscheme =
                        \ substitute(substitute(g:colors_name, '-', '_', 'g'), '256.*', '', '') .
                        \ (g:colors_name ==# 'solarized' ? '_' . &background : '')
            call lightline#init()
            call lightline#colorscheme()
            call lightline#update()
        endif
    catch
    endtry
endfunction

function! MyFugitive()
    if &ft !~? 'vimfiler' && exists("*fugitive#head")
        " return fugitive#head()
        return fugitive#statusline()
    endif
    return ''
endfunction

function! MyTagBar()
    return tagbar#currenttag('%s','')
endfunction

function! MyVirtualEnv()
    if &ft == 'python'
        return virtualenv#statusline()
    endif
    return ''
endfunction


" mbbill/undotree {{{2
Plug 'mbbill/undotree'
nnoremap <LocalLeader>g :UndotreeToggle<CR>


" Raimondi/delimitMate {{{2
Plug 'Raimondi/delimitMate'
let delimitMate_expand_cr = 1


" luochen1990/rainbow {{{2
Plug 'luochen1990/rainbow', { 'for': 'clojure' }
let g:rainbow_active = 1


" matze/vim-tex-fold {{{2
Plug 'matze/vim-tex-fold', { 'for': 'tex' }


" vim-pandoc/vim-pandoc {{{2
" Plug 'vim-pandoc/vim-pandoc'


" vim-pandoc/vim-pandoc-syntax
" Plug 'vim-pandoc/vim-pandoc-syntax'


" vim-pandoc/vim-rmarkdown {{{2
" Plug 'vim-pandoc/vim-rmarkdown', {'for': 'rmarkdown'}


" airblade/vim-gitgutter {{{2
Plug 'airblade/vim-gitgutter', {'on': 'GitGutterEnable'}


" ap/vim-css-color {{{2
Plug 'ap/vim-css-color'


" vim-scripts/jcommenter.vim {{{2
Plug 'vim-scripts/jcommenter.vim', {'for': 'java'}
autocmd FileType java let b:jcommenter_class_author='Taurus Olson (taurusolson@gmail.com)'
autocmd FileType java let b:jcommenter_file_author='Taurus Olson (taurusolson@gmail.com)'
autocmd FileType java source ~/.vim/bundle/jcommenter.vim/plugin/jcommenter.vim
autocmd FileType java map gm :call JCommentWriter()<CR>
" autocmd Filetype java set makeprg=javac\ %
autocmd Filetype java command! Java execute "! basename % .java | xargs java"


" cakebaker/scss-syntax.vim {{{2
Plug 'cakebaker/scss-syntax.vim', {'for': 'scss'}


" " fboender/bexec {{{2
" Plug 'fboender/bexec'
" let g:bexec_filter_types = {'python': 'python '}


" christoomey/vim-tmux-navigator {{{2
Plug 'christoomey/vim-tmux-navigator'
nnoremap <silent> <C-h> :TmuxNavigateLeft<cr>
nnoremap <silent> <C-j> :TmuxNavigateDown<cr>
nnoremap <silent> <C-k> :TmuxNavigateUp<cr>
nnoremap <silent> <C-l> :TmuxNavigateRight<cr>


" " joonty/vim-do {{{2
" Plug 'joonty/vim-do'
" let g:do_new_buffer_size=1000


" " rizzatti/dash.vim {{{2
" Plug 'rizzatti/dash.vim'


" junegunn/gv.vim {{{2
Plug 'junegunn/gv.vim', {'on': 'GV'}
nnoremap gv :GV<CR>
nnoremap gV :GV!<CR>


" chriskempson/vim-tomorrow-theme {{{2
Plug 'chriskempson/vim-tomorrow-theme'


" kristijanhusak/vim-hybrid-material {{{2
Plug 'kristijanhusak/vim-hybrid-material'
let g:enable_bold_font = 0


" tpope/vim-projectionist {{{2
Plug 'tpope/vim-projectionist'


" vim-latex/vim-latex {{{2
Plug 'vim-latex/vim-latex'
nmap <C-=> <Plug>IMAP_JumpForward
imap <C-j> <Plug>IMAP_JumpForward


" fmoralesc/molokayo {{{2
Plug 'fmoralesc/molokayo'


" scrooloose/nerdtree {{{2
Plug 'scrooloose/nerdtree', {'on': 'NERDTreeCWD'}
nnoremap <leader>n :NERDTreeCWD<CR>
let NERDTreeHijackNetrw = 0


" aperezdc/vim-template {{{2
Plug 'aperezdc/vim-template'
let g:username=$GITHUB_USER_NAME
let g:email=$GITHUB_USER_EMAIL


" " Valloric/YouCompleteMe {{{2
" Plug 'Valloric/YouCompleteMe'
" let g:ycm_confirm_extra_conf = 0
" let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
" let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']


"  fatih/vim-go {{{2
Plug 'fatih/vim-go'
let g:go_auto_type_info = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_interfaces = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
au FileType go nmap <buffer> <LocalLeader>r <Plug>(go-run)
au FileType go nmap <buffer> <LocalLeader>b <Plug>(go-build)
au FileType go nmap <buffer> <LocalLeader>t <Plug>(go-test)
au FileType go nmap <buffer> <LocalLeader>c <Plug>(go-coverage)
au FileType go nmap <buffer> <LocalLeader>ds <Plug>(go-def-split)
au FileType go nmap <buffer> <LocalLeader>dv <Plug>(go-def-vertical)
au FileType go nmap <buffer> <LocalLeader>dt <Plug>(go-def-tab)
au FileType go nmap <buffer> <LocalLeader>gd <Plug>(go-doc)
au FileType go nmap <buffer> <LocalLeader>gv <Plug>(go-doc-vertical)
au FileType go nmap <buffer> <LocalLeader>i <Plug>(go-info)
au FileType go nmap <buffer> <LocalLeader>e <Plug>(go-rename)
au FileType go nmap <buffer> <LocalLeader>gb <Plug>(go-doc-browser)


" junegunn/goyo.vim {{{2
Plug 'junegunn/goyo.vim', {'on': 'Goyo'}


" jmcantrell/vim-virtualenv {{{2
Plug 'jmcantrell/vim-virtualenv'


" jmcantrell/vim-reporoot {{{2
Plug 'jmcantrell/vim-reporoot' 


" " vim-ctrlspace/vim-ctrlspace {{{2
" Plug 'vim-ctrlspace/vim-ctrlspace'
" let g:CtrlSpaceSearchTiming = 500
" hi link CtrlSpaceNormal   PMenu
" hi link CtrlSpaceSelected PMenuSel
" hi link CtrlSpaceSearch   Search
" hi link CtrlSpaceStatus   StatusLine
" hi link CtrlSpaceSearch IncSearch
" if executable("ag")
"     let g:CtrlSpaceGlobCommand = 'ag -l --nocolor -g ""'
" endif


" Shougo/vimshell.vim {{{2
Plug 'Shougo/vimshell.vim'


" Shougo/vimproc.vim {{{2
Plug 'Shougo/vimproc.vim'


" tweekmonster/django-plus.vim {{{2
Plug 'tweekmonster/django-plus.vim'
 

" tweekmonster/braceless.vim {{{2
Plug 'tweekmonster/braceless.vim'
" autocmd FileType python nnoremap <space> :<C-u>call braceless#fold#close(line('.'), 0)<cr>
" let g:braceless_enable_easymotion = 0
" autocmd FileType python,coffee BracelessEnable +indent
autocmd FileType python BracelessEnable +fold
autocmd FileType python BracelessEnable +indent


" mhinz/vim-grepper {{{2
Plug 'mhinz/vim-grepper'
nmap gr <plug>(GrepperOperator)
xmap gr <plug>(GrepperOperator)

call plug#end()

" colorscheme Tomorrow-Night
colorscheme hybrid_material
