" Configurations of old plugins

" vim-scripts/Notes {{{2
Plug 'vim-scripts/Notes'
let g:notesRoot='~/Dropbox/Blogs/vimwiki/'
let g:notesFileType = 'vimwiki'
let g:notesFileExtension = '.wiki'
let g:notesWordSeparator = '_'


" vim-scripts/Vim-R-plugin {{{2
Plug 'jcfaria/Vim-R-plugin', {'for': 'r'}
" Lines added by the Vim-R-plugin command :RpluginConfig (2014-Sep-24 00:10):
" Press the space bar to send lines (in Normal mode) and selections to R:
autocmd FileType r vmap <buffer> <Space> <Plug>RDSendSelection
autocmd FileType r nmap <buffer> <Space> <Plug>RDSendLine


" csexton/jekyll.vim {{{2
Plug 'csexton/jekyll.vim', {'on': 'JekyllList'}
let g:jekyll_path = "~/Blog/taurusolson.github.com"


" matze/vim-tex-fold {{{2
Plug 'matze/vim-tex-fold', { 'for': 'tex' }


" vim-scripts/jcommenter.vim {{{2
Plug 'vim-scripts/jcommenter.vim', {'for': 'java'}
autocmd FileType java let b:jcommenter_class_author='Taurus Olson (taurusolson@gmail.com)'
autocmd FileType java let b:jcommenter_file_author='Taurus Olson (taurusolson@gmail.com)'
autocmd FileType java source ~/.vim/bundle/jcommenter.vim/plugin/jcommenter.vim
autocmd FileType java map gm :call JCommentWriter()<CR>
" autocmd Filetype java set makeprg=javac\ %
autocmd Filetype java command! Java execute "! basename % .java | xargs java"


" christoomey/vim-tmux-navigator {{{2
Plug 'christoomey/vim-tmux-navigator'
nnoremap <silent> <C-h> :TmuxNavigateLeft<cr>
nnoremap <silent> <C-j> :TmuxNavigateDown<cr>
nnoremap <silent> <C-k> :TmuxNavigateUp<cr>
nnoremap <silent> <C-l> :TmuxNavigateRight<cr>


" fboender/bexec {{{2
Plug 'fboender/bexec'
let g:bexec_filter_types = {'python': 'python '}


" joonty/vim-do {{{2
Plug 'joonty/vim-do'
let g:do_new_buffer_size=1000


" vim-ctrlspace/vim-ctrlspace {{{2
Plug 'vim-ctrlspace/vim-ctrlspace'
let g:CtrlSpaceSearchTiming = 500
hi link CtrlSpaceNormal   PMenu
hi link CtrlSpaceSelected PMenuSel
hi link CtrlSpaceSearch   Search
hi link CtrlSpaceStatus   StatusLine
hi link CtrlSpaceSearch IncSearch
if executable("ag")
    let g:CtrlSpaceGlobCommand = 'ag -l --nocolor -g ""'
endif


" tweekmonster/django-plus.vim {{{2
Plug 'tweekmonster/django-plus.vim'


" AndrewRadev/bufferize.vim {{{2
Plug 'AndrewRadev/bufferize.vim', {'on': 'Bufferize'}


" python-mode/python-mode {{{2
Plug 'python-mode/python-mode', {'for': 'python'}


" junegunn/fzf {{{2
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'


" blindFS/vim-taskwarrior {{{2
Plug 'blindFS/vim-taskwarrior'


" bpstahlman/txtfmt {{{2
Plug 'bpstahlman/txtfmt'
