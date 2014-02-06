" Taurus Olson's really minimalist vim configuration file

set nocompatible 

syntax on
filetype plugin indent on


" Autocmds {{{1

augroup vimrc
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

augroup END


" Mappings {{{1
let mapleader = ","
let maplocalleader = "\\"
inoremap kj <ESC>
nnoremap <C-SPACE> :w<CR>

" Source files
nnoremap <Leader>u :so ~/.vimrc<CR>
nnoremap <Leader>s :so %<CR>

" Edit files
nnoremap <Leader>v :e ~/.vimrc<CR>
nnoremap <Leader>V :sp ~/.vimrc<CR>

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

" Replace visual selection
vnoremap <C-r> "hy:%s/<C-r>h//gc<left><left><left>

" NextTextObject          {{{2
" Author: Steve Losh
" Description: Motion for "next/last object". For example, "din(" would go to the next "()"
" pair and delete its contents.

function! s:NextTextObject(motion, dir)
  let c = nr2char(getchar())

  if c ==# "b"
      let c = "("
  elseif c ==# "B"
      let c = "{"
  elseif c ==# "r"
      let c = "["
  endif

  exe "normal! ".a:dir.c."v".a:motion.c
endfunction

onoremap an :<c-u>call <SID>NextTextObject('a', 'f')<cr>
xnoremap an :<c-u>call <SID>NextTextObject('a', 'f')<cr>
onoremap in :<c-u>call <SID>NextTextObject('i', 'f')<cr>
xnoremap in :<c-u>call <SID>NextTextObject('i', 'f')<cr>

onoremap al :<c-u>call <SID>NextTextObject('a', 'F')<cr>
xnoremap al :<c-u>call <SID>NextTextObject('a', 'F')<cr>
onoremap il :<c-u>call <SID>NextTextObject('i', 'F')<cr>
xnoremap il :<c-u>call <SID>NextTextObject('i', 'F')<cr>

" In insert mode {{{2
inoremap <C-E> <ESC>A
inoremap <C-A> <ESC>I
inoremap <C-K> <C-o>C
" inoremap <C-b> <C-o>h
" inoremap <C-f> <C-o>a
" inoremap <C-n> <C-o>j
" inoremap <C-k> <C-o>k
" inoremap <C-^> <C-o><C-^>

" In command mode {{{2
cnoremap <C-A> <HOME>
cnoremap <C-E> <END>

" Navigation {{{2
nnoremap ;e :Ex<CR>

" Jump to definition and open it in vertical split 
nnoremap <silent> <Leader>T :let word=expand("<cword>")<CR>:vsp<CR>:wincmd w<cr>:exec("tag ". word)<CR>

" Open a Quickfix window for the last search.
nnoremap <silent> <leader>? :execute 'vimgrep /'.@/.'/g %'<CR>:copen<CR>

" Folds {{{2
nnoremap <SPACE> za
nnoremap g1 A<SPACE>{{{1
nnoremap g2 A<SPACE>{{{2
nnoremap g3 A<SPACE>{{{3


" Windows {{{2
" Jump to a window
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

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
set statusline =
set statusline +=[%n]
set statusline +=%f\ %h%m%r%w
set statusline +=%y 
set statusline +=%=%-10L
set statusline +=%=%-14.(%l,%c%V%)\ %P


" Options {{{1
set hlsearch
set vb t_vb=
set splitright
set autowrite
set shiftwidth=4
set hidden
set expandtab
set showcmd
set noswapfile
set undofile
set guicursor+=n-v-c:blinkon0
set history=100

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
    colorscheme base16-default
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

Plug 'mbbill/VimExplorer'
Plug 'jiangmiao/auto-pairs'
Plug 'TaurusOlson/darkburn.vim'
Plug 'vim-scripts/genutils'
Plug 'oinksoft/proj.vim'
Plug 'SirVer/ultisnips'
Plug 'reedes/vim-colors-pencil'
Plug 'altercation/vim-colors-solarized'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-sensible'


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
let g:UltiSnipsSnippetDirectories=['bundle/ultisnips/UltiSnips']
nnoremap \s :split ~/.vim/bundle/ultisnips/UltiSnips<CR>


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
let mywiki.syntax = 'markdown'
let g:vimwiki_list = [mywiki]
let g:vimwiki_ext2syntax = {'.wiki': 'media'}
let g:vimwiki_hl_headers = 1


" vim-scripts/Notes {{{2
Plug 'vim-scripts/Notes'
let g:notesRoot='~/Dropbox/Blogs/vimwiki/'
let g:notesFileType = 'vimwiki'
let g:notesFileExtension = '.wiki'
let g:notesWordSeparator = '_'


" majutsushi/tagbar {{{2
Plug 'majutsushi/tagbar'
nnoremap ;t :TagbarToggle<CR>


" szw/vim-ctrlspace {{{2
Plug 'szw/vim-ctrlspace'
let g:ctrlspace_default_mapping_key = "<Leader><Space>"
hi def CtrlSpaceNormal guifg=fg guibg=bg
hi def CtrlSpaceSelected guifg=bg guifg=bg gui=underline
hi def CtrlSpaceFound guifg=red guibg=NONE gui=underline
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
Plug 'rking/ag.vim'
nnoremap ,a :Ag<SPACE><c-r>=expand("<cword>")<CR>
nnoremap ,A :Ag<SPACE>


" " vim-scripts/Workspace-manager {{{2
" Plug 'vim-scripts/Workspace-manager'
" nnoremap ;w :WsToggle<CR>
" let Ws_Enable_Fold_Column = 0
" let Ws_WinWidth = 35


" ervandew/supertab {{{2
Plug 'ervandew/supertab'
let g:SuperTabDefaultCompletionType = "<C-N>"


" gregsexton/gitv {{{2
Plug 'gregsexton/gitv'
nnoremap gv :Gitv<CR>
nnoremap gV :Gitv!<CR>


" plasticboy/vim-markdown {{{2
Plug 'plasticboy/vim-markdown'
let g:vim_markdown_folding_disabled=0
let g:vim_markdown_initial_foldlevel=0


" sjl/gundo.vim {{{2
Plug 'sjl/gundo.vim'
nnoremap ;g :GundoToggle<CR>


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


call plug#end()
