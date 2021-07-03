" Taurus Olson's vim configuration file


" set nocompatible

syntax on
filetype plugin indent on


" Autocmds {{{1


augroup vimrc_group
    autocmd!
    " Save when losing focus
    autocmd FocusLost * :silent! wall

    " Fold method is fold marker for any filetype
    autocmd Filetype vim,r setlocal fdm=marker

    " Prevent auto comment prefixing
    autocmd FileType * setlocal formatoptions-=r formatoptions-=o

    " In netrw, go to above directory
    autocmd FileType netrw nmap <buffer> <backspace> -

    " Open vim help for word under cursor
    autocmd Filetype vim,help nnoremap <buffer> <silent> K :let word=expand("<cword>")<CR>:exec("help ". word)<CR>
    autocmd Filetype help nnoremap <buffer> <silent> q :q<CR>

    " Execute the current line
    autocmd FileType vim nnoremap <Leader>S ^vg_y:execute @@<CR>

    " PYTHON
    autocmd FileType python setlocal foldenable softtabstop=4 tabstop=4 shiftwidth=4 textwidth=88 fdm=marker foldlevelstart=0
    " autocmd FileType python setlocal omnifunc=pythoncomplete#Complete

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
    autocmd FileType qf nnoremap <buffer> <silent> q :q<CR>

    autocmd QuickFixCmdPost grep,make,grepadd,vimgrep,vimgrepadd,cscope,cfile,cgetfile,caddfile,helpgrep cwindow
    autocmd QuickFixCmdPost lgrep,lmake,lgrepadd,lvimgrep,lvimgrepadd,lfile,lgetfile,laddfile lwindow

    " LATEX
    autocmd FileType tex inoremap <buffer> é \'e
    autocmd FileType tex inoremap <buffer> è \`e
    autocmd FileType tex inoremap <buffer> à \`a

    " GO
    autocmd FileType go setlocal softtabstop=4 tabstop=4 shiftwidth=4 textwidth=79

    " JSON
    autocmd FileType json setlocal equalprg=python\ -m\ json.tool

    " SQL
    autocmd FileType sql setlocal equalprg=sqlformat\ --reindent\ --keywords\ upper\ --identifiers\ lower\ -

    " Save last position
    au BufReadPost * if line("'\"") | execute("normal `\"") | endif
augroup END


" HTML {{{1
let g:html_indent_inctags = "html,body,head,tbody"


" Mappings {{{1
let mapleader = ","
let maplocalleader = "\\"
inoremap kj <ESC>
nnoremap <C-SPACE> :w<CR>
tnoremap <Esc> <C-\><C-n>

" For some reason <C-^> doesn
nnoremap ² :e #<CR>
nnoremap œ :e #<CR>

" Paste (by sheerun)
vnoremap <silent> y y`]

" Paste and indent
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
" nnoremap <LocalLeader>t :!/usr/local/bin/ctags -R .<CR>

" Togglable options
nnoremap cor :set relativenumber!<CR>
nnoremap con :set number!<CR>
nnoremap cul :set cul!<CR>
nnoremap cuc :set cuc!<CR>

nnoremap <LocalLeader><SPACE> :nohlsearch<CR>
vnoremap $ g_
nnoremap <Leader>c :cd %:p:h<CR>:echo 'Changed to ' . getcwd()<CR>
nnoremap <Leader>b :let &background = ( &background == "dark"? "light" : "dark" )<CR>

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
nnoremap <silent> <leader>P :cprev<CR>
nnoremap <silent> <leader>N :cnext<CR>

" [count]S: Repeat [count] times the last modification
nnoremap S :normal n.<CR>

" Folds {{{2
nnoremap <SPACE> za
nnoremap g1 A<SPACE>{{{1<ESC>
nnoremap g2 A<SPACE>{{{2<ESC>
nnoremap g3 A<SPACE>{{{3<ESC

" Windows {{{2
" Jump to a window
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
" nnoremap <TAB> <C-w>w

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

" Faster  {{{2
nnoremap Y y$
nnoremap Q :q<CR>


" Options {{{1
" set exrc
" set secure
set mouse=a
set wildignore+=*/.git/*,*/tmp/*,*.swp
set ttyfast
set hlsearch
set novb vb t_vb=
set novisualbell
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
" set colorcolumn=80
set clipboard=unnamed
set maxmempattern=100000

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

if !isdirectory(expand(&undodir))
    call mkdir(expand(&undodir), "p")
endif
if !isdirectory(expand(&backupdir))
    call mkdir(expand(&backupdir), "p")
endif
if !isdirectory(expand(&directory))
    call mkdir(expand(&directory), "p")
endif

set encoding=utf-8

" Tags {{{2
set tagstack
set tags=./tags,tags,.git/tags

" GUI {{{2
if has('gui_running')
    set guioptions=g
    " set guifont=InconsolataForPowerline\ Nerd\ Font\ Medium\ 15
    " set guifont=FuraMonoForPowerline\ Nerd\ Font\ Medium\ 14
    set guifont=Iosevka\ Regular\ 15
    " set guifont=FiraCode\ Regular\ 14
    " set guifont=Menlo:h19
    " set guifont=Inconsolata:h20
    " set guifont=Droid\ Sans\ Mono\ for\ Powerline\ Nerd\ Font\ Complete:h18
    set linespace=3
elseif exists('g:GuiLoaded')
    " GuiFont! Iosevka:h15:l
    GuiFont! JetBrains Mono:h14:w50
    GuiLinespace 3
elseif exists('g:gonvim_running')
    set linespace=5
    set guifont=Iosevka:h15:l
else
    set t_Co=256
endif

" Functions {{{1
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
let $PLUG_SRC = exists('$DBOX/Projects') ? $DBOX . '/Projects' : 'TaurusOlson'

" colors {{{2
Plug 'co1ncidence/mountaineer.vim'
Plug 'co1ncidence/javacafe.vim'
Plug 'ghifarit53/tokyonight-vim'
let g:tokyonight_style = 'storm' " available: night, storm
let g:tokyonight_enable_italic = 0
let g:tokyonight_menu_selection_background = 'red'

Plug '$PLUG_SRC/darkburn.vim'
Plug '$PLUG_SRC/hornet.vim'
Plug '$PLUG_SRC/graffik.vim'
Plug '$PLUG_SRC/creature.vim'
Plug 'morhetz/gruvbox'
Plug 'w0ng/vim-hybrid'
Plug 'dracula/vim'
Plug 'chriskempson/vim-tomorrow-theme'
Plug 'kristijanhusak/vim-hybrid-material'
let g:enable_bold_font = 0
Plug 'rakr/vim-two-firewatch'
Plug 'arcticicestudio/nord-vim'
let g:nord_italic = 0
let g:nord_underline = 1
let g:nord_italic_comments = 0
let g:nord_uniform_status_lines = 1
Plug 'franbach/miramare'
Plug 'AhmedAbdulrahman/aylin.vim'


" ctrlpvim/ctrlp.vim {{{2
Plug 'ctrlpvim/ctrlp.vim'
let g:ctrlp_buftag_ctags_bin = '/usr/bin/ctags'
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
if executable('rg')
    set grepprg=rg\ --color=never
    let g:ctrlp_user_command = 'rg %s --files --color=never --glob ""'
    let g:ctrlp_use_caching = 1
else
    let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
    let g:ctrlp_use_caching = 1
endif
let g:ctrlp_by_filename = 1

if has('gui_running')
    execute "set <M-b>=\eb"
    execute "set <M-g>=\eg"
    execute "set <M-u>=\eu"
    execute "set <M-r>=\er"
    " execute "set <M-t>=\et"
    " execute "set <M-t>=\es"
endif

nnoremap <M-b> :CtrlPBuffer<CR>
nnoremap <M-g> :CtrlPTag<CR>
nnoremap <M-t> :CtrlPBufTag<CR>
" nnoremap <M-t> :CtrlPTag<CR>
nnoremap <M-u> :CtrlPMRU<CR>
nnoremap <M-r> :CtrlPRoot<CR>
nnoremap <LocalLeader>a :CtrlPBookmarkDirAdd .<CR>
nnoremap <M-s> :CtrlPLine<CR>
let g:ctrlp_clear_cache_on_exit = 1


" tpope/vim-projectionist {{{2
Plug 'tpope/vim-projectionist'


" tpope/vim-fugitive {{{2
Plug 'tpope/vim-fugitive'
nnoremap <silent> gs :Git<CR>
nnoremap <silent> gw :Gwrite<CR>
nnoremap <silent> go :Git commit<CR>
nnoremap <silent> gD :Gvdiffsplit<CR>
nnoremap <silent> gb :Git blame<CR>
nnoremap <silent> g<C-b> :echo fugitive#statusline()<CR>
autocmd BufReadPost fugitive://* set bufhidden=delete
autocmd FileType gitcommit setlocal cursorline
autocmd FileType fugitive nnoremap <silent> <buffer> q :q<CR>
autocmd FileType fugitiveblame nnoremap <silent> <buffer> q :q<CR>


" tpope/vim-surround {{{2
Plug 'tpope/vim-surround'


" tpope/vim-commentary {{{2
Plug 'tpope/vim-commentary'


" tpope/vim-repeat {{{2
Plug 'tpope/vim-repeat'


" tpope/vim-sensible {{{2
Plug 'tpope/vim-sensible'


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
" let g:SuperTabContextTextOmniPrecedence = ['&omnifunc', '&completefunc']
"     \ ["&omnifunc:<c-x><c-n>", "&completefunc:<c-x><c-u>",]
let g:SuperTabDefaultCompletionType = "context"


" majutsushi/tagbar {{{2
Plug 'majutsushi/tagbar'
nnoremap ;t :TagbarToggle<CR>
let g:tagbar_sort = 0
let g:tagbar_compact = 1
let g:tagbar_autopreview = 0
let g:tagbar_iconchars = ['▸','▾']


" plasticboy/vim-markdown {{{2
Plug 'plasticboy/vim-markdown', {'for': 'markdown'}
let g:vim_markdown_folding_disabled=0
let g:vim_markdown_initial_foldlevel=0
autocmd BufEnter *.html.pmd setlocal ft=markdown


" wellle/targets.vim {{{2
Plug 'wellle/targets.vim'


" mattn/emmet-vim {{{2
Plug 'mattn/emmet-vim', {'for': ['html', 'htmldjango']}


" jeffkreeftmeijer/vim-numbertoggle {{{2
Plug 'jeffkreeftmeijer/vim-numbertoggle'


" itchyny/lightline.vim {{{2
Plug 'itchyny/lightline.vim'
let g:lightline = {
            \ 'separator': { 'left': '', 'right': '' },
            \ 'subseparator': { 'left': '•', 'right': '•' }
            \ }

let g:lightline.active = {
            \ 'left': [['mode', 'paste', 'modified'],
            \ ['filename', 'virtualenv', 'fugitive']],
            \ 'right': [['tagbar', 'lineinfo']],
            \ }

let g:lightline.inactive = {
            \ 'left': [['mode', 'paste'], ['filename', 'fugitive']],
            \ 'right': [['lineinfo']],
            \ }

let g:lightline.component_function = {
            \ 'fugitive': 'MyFugitive',
            \ 'virtualenv': 'MyVirtualEnv',
            \ 'tagbar': 'MyTagBar',
            \ }
            " \ 'ale': 'ALEGetStatusLine',

let g:lightline.component = {
    \ 'mode': '%{lightline#mode()}',
    \ 'absolutepath': '%F',
    \ 'relativepath': '%f',
    \ 'filename': '%t',
    \ 'modified': '%M',
    \ 'bufnum': '%n',
    \ 'paste': '%{&paste?"PASTE":""}',
    \ 'readonly': '%R',
    \ 'fileformat': '%{&ff}',
    \ 'filetype': '%{&ft!=#""?&ft:"no ft"}',
    \ 'percent': '%3p%%',
    \ 'percentwin': '%P',
    \ 'spell': '%{&spell?&spelllang:""}',
    \ 'lineinfo': '%3l:%-2v' }

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
        if g:colors_name =~# 'gruvbox\|hybrid\|molokai\|dracula\|wombat\|solarized\|jellybeans\|Tomorrow\|synthwave\|nord\|miramare\|tokyonight\|mountaineer'
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


function! AleStatusLine() 
    return ale#statusline#Status()
endfunction

function! MyFugitive()
    if &ft !~? 'vimfiler' && exists("*fugitive#head")
        return fugitive#statusline()
    endif
    return ''
endfunction

function! MyTagBar()
    return tagbar#currenttag('%s','', 'f')
endfunction

function! MyVirtualEnv()
    if &ft == 'python'
        return virtualenv#statusline()
    endif
    return ''
endfunction

" Raimondi/delimitMate {{{2
Plug 'Raimondi/delimitMate'
let delimitMate_expand_cr = 1
let delimitMate_expand_space = 1


" airblade/vim-rooter {{{2
Plug 'airblade/vim-rooter'
let g:rooter_change_directory_for_non_project_files = ''
let g:rooter_change_directory_for_non_project_files = 'current'
let g:rooter_silent_chdir = 1


" junegunn/gv.vim {{{2
Plug 'junegunn/gv.vim', {'on': 'GV'}
nnoremap gl :GV<CR>
nnoremap gL :GV!<CR>


" plytophogy/vim-virtualenv {{{2
let g:virtualenv_stl_format = '[%n]'
Plug 'plytophogy/vim-virtualenv', {'for': 'python'}


" tweekmonster/braceless.vim {{{2
Plug 'tweekmonster/braceless.vim', {'for': 'python'}
" autocmd FileType python BracelessEnable +fold
autocmd FileType python BracelessEnable +indent
" let g:braceless_jump_prev_key = '['
" let g:braceless_jump_next_key = ']'


" mhinz/vim-grepper {{{2
Plug 'mhinz/vim-grepper', { 'on': ['Grepper', 'GrepperRg', '<plug>(GrepperOperator)'] }
let g:grepper = {}
let g:grepper.tools = ['rg', 'grep', 'git']
nmap gr <plug>(GrepperOperator)
xmap gr <plug>(GrepperOperator)
nnoremap <leader>* :Grepper -tool rg -cword -noprompt<cr>
nnoremap g: :GrepperRg<SPACE>
" let g:grepper.prompt = 0
" let g:grepper.side = 0
let g:grepper.highlight = 1

command! Todo Grepper -noprompt -tool rg -query '(TODO|FIXME|XXX|NOTE)'
command! TodoBuffer Grepper-buffer -noprompt -tool rg -query '(TODO|FIXME|XXX|NOTE)'
nnoremap <silent> <LocalLeader>t :TodoBuffer<CR>
nnoremap <silent> <LocalLeader>T :Todo<CR>

" nvie/vim-flake8 {{{2
Plug 'nvie/vim-flake8', {'for': 'python'}


" psf/black {{{2
Plug 'psf/black', {'for': 'python'}


" w0rp/ale {{{2
Plug 'w0rp/ale'
" Write this in your vimrc file
let g:ale_lint_on_save = 1
let g:ale_lint_on_text_changed = 0
" You can disable this option too
" if you don't want linters to run on opening a file
let g:ale_lint_on_enter = 1
let g:ale_linters = {'python': ['black', 'flake8']}


" davidhalter/jedi-vim {{{2
Plug 'davidhalter/jedi-vim', {'for': 'python'}
" let g:jedi#completions_command = "<C-N>"
let g:jedi#auto_initialization = 1
let g:jedi#popup_on_dot = 0
" let g:jedi#show_call_signatures = 1

" Vimjas/vim-python-pep8-indent {{{2
Plug 'Vimjas/vim-python-pep8-indent', {'for': 'python'}


" AaronLasseigne/yank-code {{{2
Plug 'AaronLasseigne/yank-code', {'on': 'YankCode'}


" " Konfekt/FastFold {{{2
" Plug 'Konfekt/FastFold'
" nmap zuz <Plug>(FastFoldUpdate)
" let g:fastfold_savehook = 1
" let g:fastfold_fold_command_suffixes =  ['x','X','a','A','o','O','c','C']
" let g:fastfold_fold_movement_commands = [']z', '[z', 'zj', 'zk']


" Olical/conjure {{{2
Plug 'Olical/conjure', {'tag': 'v4.20.0'}

" Olical/aniseed {{{2
Plug 'Olical/aniseed', { 'tag': 'v3.16.0' }

" luochen1990/rainbow {{{2
Plug 'luochen1990/rainbow', {'do': 'RainbowToggleOn'}
let g:rainbow_active = 0


" fatih/vim-go {{{2
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

" pechorin/any-jump.vim {{{2
Plug 'pechorin/any-jump.vim'

" Or override all default colors
let g:any_jump_colors = {
      \"plain_text":         "Comment",
      \"preview":            "Comment",
      \"preview_keyword":    "Operator",
      \"heading_text":       "Function",
      \"heading_keyword":    "Identifier",
      \"group_text":         "Comment",
      \"group_name":         "Function",
      \"more_button":        "Operator",
      \"more_explain":       "Comment",
      \"result_line_number": "Comment",
      \"result_text":        "Statement",
      \"result_path":        "String",
      \"help":               "Comment"
      \}

" guns/vim-sexp {{{2
Plug 'guns/vim-sexp', {'for': 'clojure'}
autocmd FileType clojure nnoremap <buffer> <M-b> :CtrlPBuffer<CR>


" voldikss/vim-floaterm {{{2
Plug 'voldikss/vim-floaterm'
hi FloatermBorder guibg=normal guifg=foreground
let g:floaterm_wintype='vsplit'
let g:floaterm_width=0.4
let g:floaterm_autohide=2
nnoremap <M-e> :FloatermToggle<CR>
tnoremap <M-e> <C-\><C-n>:FloatermToggle<CR>
tnoremap <M-k> <C-\><C-n>:FloatermKill<CR>
tnoremap <M-h> <C-\><C-n>:FloatermHide<CR>
nnoremap <Leader>f :FloatermNew nnn<CR>


" junegunn/fzf.vim
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'


" tpope/vim-dadbod {{{2
Plug 'tpope/vim-dadbod'


" tpope/vim-dispatch {{{2
Plug 'tpope/vim-dispatch'


" neovim/nvim-lspconfig {{{2
Plug 'neovim/nvim-lspconfig'


" nvim-treesitter/nvim-treesitter {{{2
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}


" nvim-treesitter/nvim-treesitter-textobjects {{{2
Plug 'nvim-treesitter/nvim-treesitter-textobjects'

" nvim-treesitter/nvim-treesitter-refactor
Plug 'nvim-treesitter/nvim-treesitter-refactor'

" lewis6991/gitsigns.nvim {{{2
Plug 'nvim-lua/plenary.nvim'
Plug 'lewis6991/gitsigns.nvim'

" End of plugins {{{1
call plug#end()

" Colorscheme {{{2
if has('gui_running') || exists('g:GuiLoaded')
    colorscheme nord
else
    colorscheme nord
endif

if (has("termguicolors"))
  set termguicolors
endif


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


" Projects

" TODO Allow to select any directory in g:projects_dir instead of defining g:projects_names
let g:projects_dir = '~/Projects/work/'
let g:projects_names = [
            \'platform_integration',
            \'kazuhira',
            \'backoffice',
            \'pricing',
            \'cdiscount',
            \'rakuten-ws',
            \'skully',
            \]

function! ListProjects(A, L, P)
    return g:projects_names
endfunction
 
function! JumpToProject(name)
    execute "edit" . g:projects_dir . a:name
endfunction

command! -nargs=1 -complete=customlist,ListProjects Project :call JumpToProject(<f-args>)
