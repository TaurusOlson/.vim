" Taurus Olson's really minimalist vim configuration file

set nocompatible 

syntax on
filetype plugin indent on


" Autocmds {{{1

augroup vimrc_group
    autocmd!

    " cd into the current directory
    autocmd BufEnter * if strpart(expand("%:h"), 0, 8) !=# 'fugitive' | silent cd %:p:h

    " Resize splits when the window is resized
    autocmd VimResized * exe "normal! \<c-w>="

    " Save when losing focus
    autocmd FocusLost * :silent! wall

    " Fold method is fold marker for any filetype
    autocmd Filetype vim,python setlocal fdm=marker

    " Prevent auto comment prefixing
    autocmd FileType * setlocal formatoptions-=r formatoptions-=o

    " In netrw, go to above directory
    autocmd FileType netrw nmap <buffer> <backspace> -

    " Open vim help for word under cursor
    autocmd Filetype vim,help nnoremap <silent> K :let word=expand("<cword>")<CR>:exec("help ". word)<CR>

    " Execute the current line
    autocmd FileType vim nnoremap <Leader>S ^vg_y:execute @@<CR>

    autocmd FileType python set softtabstop=4 tabstop=4 shiftwidth=4 textwidth=79
    autocmd FileType reprocessed set fdm=syntax sw=2 textwidth=79 commentstring=//\ %s
    autocmd FileType reprocessed nnoremap <buffer> <LocalLeader>r :RunProcessing<CR>
    autocmd FileType reprocessed nnoremap <buffer> <LocalLeader>o :silent !open -a Processing.app %<CR>

    " CSS
    au Filetype css setlocal foldmethod=marker
    au Filetype css setlocal foldmarker={,}
    au Filetype css setlocal omnifunc=csscomplete#CompleteCSS
    au Filetype css setlocal iskeyword+=-
    " Sort properties alphabetically
    au FileType css nnoremap <buffer> <LocalLeader>S ?{<CR>jV/\v^\s*\}?$<CR>k:sort<CR>:noh<CR>

    au FileType rst setlocal suffixesadd=.rst

    " Quickfix
    au FileType qf setlocal cursorline

    " Clojure
    " Eval current line and jump to next element (use vim-sexp)
    au FileType clojure nmap <buffer> <CR> :Eval<CR><Plug>(sexp_move_to_next_element_head)
    " Eval current line
    au FileType clojure nnoremap <buffer> <S-CR> :Eval<CR>
    " Eval current line and write its result at the end of the line (use
    " vim-fireplace)
    au FileType clojure nmap <C-CR> yyp<Plug>FireplaceFilterabI;;<SPACE>=><SPACE><ESC>kJ0
    au FileType clojure imap <C-CR> <ESC>yyp<Plug>FireplaceFilterabI;;<SPACE>=><SPACE><ESC>kJ0
    au FileType clojure nnoremap m'g$ f;D``
augroup END


" Mappings {{{1
let mapleader = ","
let maplocalleader = "\\"
inoremap kj <ESC>
nnoremap <C-SPACE> :w<CR>

" Movements for wrapped lines
nnoremap j gj
nnoremap k gk

" Source files
nnoremap <Leader>u :so ~/.vimrc<CR>
nnoremap <Leader>s :so %<CR>

" Edit files
nnoremap <Leader>v :e ~/.vimrc<CR>
nnoremap <Leader>V :sp ~/.vimrc<CR>

" Search 
nnoremap <Leader>* /\<\><Left><Left>

" Tags
nnoremap <Leader>t <C-]>
nnoremap <LocalLeader>t :!/usr/local/bin/ctags -R .<CR>

nnoremap <Leader>n :set number!<CR>
nnoremap \<SPACE> :nohlsearch<CR>
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
nnoremap ;e :Ex<CR>
 
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


" Statusline {{{1
" source ~/Desktop/sandbox/mode_switcher.vim
set statusline =
set statusline +=[%n]                                    " buffer number
set statusline +=\ %f                                    " Full path to file
set statusline +=\ %1*%m%0*                              " modified flag
set statusline +=\ %=%-20.30{tagbar#currenttag('%s','')} " Current function
set statusline +=\ %h                                    " [help]
set statusline +=%r                                      " read only flag
set statusline +=%w                                      " preview window flag
set statusline +=%=%-14.(%l,%c%V%)                       " Line, column-virtual column"
set statusline +=%=lines:\ %-5L                          " Lines in the buffer


" Options {{{1
set ttyfast
set hlsearch
set vb t_vb=
set splitright
" set autowrite
set shiftwidth=4
set hidden
set expandtab
set showcmd
set noswapfile
set undofile
set guicursor+=n-v-c:blinkon0
set history=100
set virtualedit=block

" Adapt the background to the current time
if strftime("%H") > 8 && strftime("%H") < 17
    set background=light
else
    set background=dark
endif


" Folds
set nofoldenable


" Directories {{{2
set undodir=~/.vim/tmp/undo/     " undo files
set backupdir=~/.vim/tmp/backup/ " backups
set directory=~/.vim/tmp/swap/   " swap files

" Tags {{{2
set tagstack          
set tags=./tags,tags,.git/tags


" GUI {{{2
if has('gui_running')
    set guioptions=g
    set guifont=Cousine:h14
    set linespace=5
else
    set t_Co=256
endif


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


" Fuzzy matching {{{2
" Author: junegunn

function! s:fuzzy_matching()
  set shortmess+=T " required :p
  normal! m`

  try
    let mid = 0
    let q = ''
    while 1
      redraw
      echon "\rf/". q
      let c  = getchar()
      let ch = nr2char(c)

      if ch == "\<C-C>" || ch == "\<Esc>" || (c == "\<bs>" && len(q) <= 1)
        echon "\r".repeat(' ', len(q) + 2)
        keepjumps normal! ``
        break
      elseif ch == "\<Enter>"    | let @/ = regex | set hls | break
      elseif ch == "\<C-U>"      | let q  = ''
      elseif c  == "\<bs>"       | let q  = q[0 : -2]
      elseif ch =~ '[[:print:]]' | let q .= ch
      else                       | continue
      endif

      let chars = map(split(q, '.\zs'), 'escape(v:val, "\\[]^$.*")')
      let regex = join(
        \ extend(map(chars[0 : -2], 'v:val . "[^" .v:val. "]\\{-}"'),
        \ chars[-1:-1]), '')

      silent! call matchdelete(mid)
      keepjumps normal! ``
      if !empty(regex)
        if search('\c'.regex, 'c') == 0
          keepjumps normal! ``
        else
          let mid = matchadd("IncSearch", '\c\%'.line('.').'l'.regex)
        endif
      endif
    endwhile
  finally
    silent! call matchdelete(mid)
    redraw
  endtry
endfunction

nnoremap <silent> <leader>f :call <SID>fuzzy_matching()<cr>


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


" Focus mode {{{2
let g:focus_is_on = 0
function! Focus() 
    if g:focus_is_on ==# 0
        syntax off
        set cursorline
        hi CursorLine guifg=red guibg=#1A1A1A
        hi Normal guifg=#777777 guibg=#1A1A1A
        hi Statusline guifg=red guibg=#262626 gui=bold
        hi StatuslineNC guifg=#777777 guibg=#262626 gui=bold
        hi Visual guifg=red guibg=#262626 gui=bold
        hi Search guifg=red guibg=#262626 gui=bold
        hi IncSearch guifg=red guibg=#262626 gui=none
        let g:focus_is_on = 1
    else
        syntax on
        set cursorline!
        let g:focus_is_on = 0
    endif
endfunction

command! -bar -nargs=0 ToggleFocus :call Focus()


" Plugins {{{1

call plug#begin('~/.vim/bundle')

Plug 'mbbill/VimExplorer', {'on': 'VE'}
Plug 'jiangmiao/auto-pairs'
Plug 'TaurusOlson/darkburn.vim'
Plug 'vim-scripts/genutils'
Plug 'oinksoft/proj.vim'
Plug 'reedes/vim-colors-pencil'
Plug 'altercation/vim-colors-solarized'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-sensible'
Plug 'morhetz/gruvbox'


" kien/ctrlp.vim {{{2
Plug 'kien/ctrlp.vim'
let g:ctrlp_buftag_ctags_bin = '/usr/local/bin/ctags'
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
map <D-t> :CtrlP<CR>
map <D-b> :CtrlPBuffer<CR>
map <D-g> :CtrlPBufTag<CR>
map <D-r> :CtrlPCurFile<CR>
nnoremap <D-u> :CtrlPMRU<CR>
nnoremap <D-s> :CtrlP ~/.vim/bundle<CR>
nnoremap <D-p> :CtrlPBookmarkDir<CR>
nnoremap <LocalLeader>a :CtrlPBookmarkDirAdd .<CR>


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


" SirVer/ultisnips {{{2
Plug 'SirVer/ultisnips'
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
let g:UltiSnipsSnippetDir='~/.vim/ultisnippets'
let g:UltiSnipsSnippetDirectories=['ultisnippets']
nnoremap <LocalLeader>s :split ~/.vim/ultisnippets<CR>


" ervandew/supertab {{{2
Plug 'ervandew/supertab'
let g:SuperTabDefaultCompletionType = "<C-N>"
let g:SuperTabContextTextOmniPrecedence = ['&omnifunc', '&completefunc']
let g:SuperTabContextDiscoverDiscovery =
    \ ["&omnifunc:<c-x><c-o>", "&completefunc:<c-x><c-u>",]
let g:SuperTabDefaultCompletionType = "context"


" vimwiki/vimwiki {{{2
Plug 'vimwiki/vimwiki'
let g:vimwiki_fold_lists = 1
let mywiki = {}
let mywiki.path = '~/Dropbox/Blogs/vimwiki/'
let mywiki.path_html = '~/Dropbox/Blogs/vimwiki_html/'
let mywiki.template_path = '~/Dropbox/Blogs/vimwiki/templates/'
let mywiki.template_default = 'def_template'
let mywiki.template_ext = '.html'
let mywiki.css_name = 'main.css'
" let mywiki.syntax = ''
let g:vimwiki_list = [mywiki]
let g:vimwiki_ext2syntax = {'.wiki': 'media'}
let g:vimwiki_hl_headers = 1
let g:vimwiki_folding = 'syntax'


" vim-scripts/Notes {{{2
Plug 'vim-scripts/Notes'
let g:notesRoot='~/Dropbox/Blogs/vimwiki/'
let g:notesFileType = 'vimwiki'
let g:notesFileExtension = '.wiki'
let g:notesWordSeparator = '_'


" majutsushi/tagbar {{{2
Plug 'majutsushi/tagbar'
nnoremap ;t :TagbarToggle<CR>
let g:tagbar_sort = 0
let g:tagbar_compact = 1
let g:tagbar_autopreview = 0


" szw/vim-ctrlspace {{{2
Plug 'szw/vim-ctrlspace'
let g:ctrlspace_default_mapping_key = "<Leader><Space>"
hi CtrlSpaceNormal guifg=fg guibg=bg
hi CtrlSpaceSelected guifg=bg guibg=fg gui=none
hi CtrlSpaceFound guifg=red guibg=NONE gui=none
let g:ctrlspace_symbols = {
            \ "cs"      : "CS",
            \ "tab"     : "TAB",
            \ "all"     : "ALL",
            \ "add"     : "ADD",
            \ "load"    : "LOAD",
            \ "save"    : "SAVE",
            \ "ord"     : "123",
            \ "abc"     : "ABC",
            \ "prv"     : "*",
            \ "s_left"  : "[",
            \ "s_right" : "]"
            \ }


" vim-scripts/opsplorer {{{2
Plug 'vim-scripts/opsplorer'
nnoremap ;v :call ToggleShowOpsplorer()<CR>
autocmd BufEnter __Opsplorer__ set bufhidden=delete


" Processing {{{2
Plug 'goonzoid/vim-reprocessed'
autocmd BufRead,BufEnter *.pde nnoremap <buffer> ;s :split $PROJECTS/Processing/snippets<CR>

" Run procesing from the command line
function! RunProcessing()
     let s:fullpath  = expand("%:p:h")
     let s:splitpath = split(s:fullpath, '/')
     let s:processing_project = s:splitpath[-1]
     echo "Launching " .s:processing_project
     execute "silent !processing-java --output=/tmp/sketches/" .s:processing_project. "  --sketch=" .s:fullpath.  " --force --run &"
endfunction

command! -nargs=0 RunProcessing :call RunProcessing()


" rking/ag.vim {{{2
Plug 'rking/ag.vim', {'on': 'Ag'}
nnoremap <Leader>a :Ag<SPACE><c-r>=expand("<cword>")<CR>
nnoremap <Leader>A :Ag<SPACE>

" vim-scripts/Workspace-manager {{{2
Plug 'https://github.com/vim-scripts/Workspace-Manager.git'
nnoremap ;w :WsToggle<CR>
let Ws_Enable_Fold_Column = 0
let Ws_WinWidth = 35

" vim-scripts/Workspace-manager {{{2
Plug 'https://github.com/vim-scripts/Workspace-Manager.git'
nnoremap ;w :WsToggle<CR>
let Ws_Enable_Fold_Column = 0
let Ws_WinWidth = 35


" gregsexton/gitv {{{2
Plug 'gregsexton/gitv', {'on': 'Gitv'}
nnoremap gv :Gitv<CR>
nnoremap gV :Gitv!<CR>


" plasticboy/vim-markdown {{{2
Plug 'plasticboy/vim-markdown'
let g:vim_markdown_folding_disabled=0
let g:vim_markdown_initial_foldlevel=0


" sjl/gundo.vim {{{2
Plug 'sjl/gundo.vim'
nnoremap ;g :GundoToggle<CR>


" godlygeek/tabular {{{2
Plug 'godlygeek/tabular', {'on': 'Tabularize'}
nnoremap <Leader>a<Space> :Tabularize  / /<CR>
vnoremap <Leader>a<Space> :Tabularize  / /<CR>
nnoremap <Leader>a=       :Tabularize  /=<CR>
vnoremap <Leader>a=       :Tabularize  /=<CR>
nnoremap <Leader>a:       :Tabularize  /:<CR>
vnoremap <Leader>a:       :Tabularize  /:<CR>
nnoremap <Leader>a,       :Tabularize  /,<CR>
vnoremap <Leader>a,       :Tabularize  /,<CR>
 

" tpope/vim-fireplace {{{2
Plug 'tpope/vim-fireplace'


" tpope/vim-classpath {{{2
Plug 'tpope/vim-classpath'


" tpope/vim-sexp-mappings-for-regular-people {{{2
Plug 'tpope/vim-sexp-mappings-for-regular-people'


" guns/vim-clojure-static {{{2
Plug 'guns/vim-clojure-static'


" guns/vim-sexp {{{2
Plug 'guns/vim-sexp'


" wellle/targets.vim {{{2
Plug 'wellle/targets.vim'


" mhinz/vim-startify {{{2
Plug 'mhinz/vim-startify'
let g:startify_session_dir = '~/.vim/sessions'
let g:startify_files_number = 10


" Taurus/creature.vim {{{2
Plug 'git@github.com:TaurusOlson/creature.vim.git'


" someboddy/psearch.vim {{{2
Plug 'someboddy/psearch.vim', {'on': 'PSearch'}
nnoremap <D-s> :PSearch<CR>


" tpope/vim-dispatch {{{2
Plug 'tpope/vim-dispatch'


" tpope/vim-projectile {{{2
Plug 'tpope/vim-projectile'


" eagletmt/ghcmod-vim {{{2
Plug 'eagletmt/ghcmod-vim'


" Shougo/vimproc {{{2
Plug 'Shougo/vimproc'


" tpope/timl {{{2
Plug 'tpope/timl'


" vim-scripts/vcscommand.vim {{{2
Plug 'vim-scripts/vcscommand.vim'


" tpope/vim-dispatch  {{{2
Plug 'tpope/vim-dispatch'


call plug#end()

