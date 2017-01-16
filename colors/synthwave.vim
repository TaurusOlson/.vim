" synthwave.vim -- Vim color scheme.
" Author:       Dean Thomson
" Webpage:      https://fsociety.info
" Description:  A colorscheme

hi clear

set background=dark

if exists("syntax_on")
syntax reset
endif

let colors_name = "synthwave"

" highlight groups {{{

if &t_Co >= 256 || has("gui_running")
		hi Normal ctermbg=0 ctermfg=7 cterm=NONE guibg=#312e39 guifg=#c0a79a gui=NONE
	set background=dark
		hi NonText ctermbg=NONE ctermfg=0 cterm=NONE guibg=NONE guifg=#33303b gui=NONE
		hi Comment ctermbg=NONE ctermfg=8 cterm=NONE guibg=NONE guifg=#4f4b58 gui=NONE
		hi Constant ctermbg=NONE ctermfg=3 cterm=NONE guibg=NONE guifg=#71949a gui=NONE
		hi Error ctermbg=1 ctermfg=7 cterm=NONE guibg=#87404f guifg=#c0a79a gui=NONE
		hi Identifier ctermbg=NONE ctermfg=1 cterm=NONE guibg=NONE guifg=#87404f gui=NONE
		hi Ignore ctermbg=8 ctermfg=0 cterm=NONE guibg=#4f4b58 guifg=#33303b gui=NONE
		hi PreProc ctermbg=NONE ctermfg=3 cterm=NONE guibg=NONE guifg=#71949a gui=NONE
		hi Special ctermbg=NONE ctermfg=6 cterm=NONE guibg=NONE guifg=#554757 gui=NONE
		hi Statement ctermbg=NONE ctermfg=1 cterm=NONE guibg=NONE guifg=#87404f gui=NONE
		hi String ctermbg=NONE ctermfg=2 cterm=NONE guibg=NONE guifg=#4c9882 gui=NONE
		hi Number ctermbg=NONE ctermfg=3 cterm=NONE guibg=NONE guifg=#71949a gui=NONE
		hi Todo ctermbg=8 ctermfg=3 cterm=NONE guibg=#4f4b58 guifg=#71949a gui=NONE
		hi Type ctermbg=NONE ctermfg=3 cterm=NONE guibg=NONE guifg=#71949a gui=NONE
		hi Underlined ctermbg=NONE ctermfg=1 cterm=underline guibg=NONE guifg=#87404f gui=underline
		hi StatusLine ctermbg=7 ctermfg=0 cterm=NONE guibg=#c0a79a guifg=#33303b gui=NONE
		hi StatusLineNC ctermbg=NONE ctermfg=NONE cterm=NONE guibg=NONE guifg=NONE gui=NONE
		hi TabLine ctermbg=NONE ctermfg=8 cterm=NONE guibg=NONE guifg=#4f4b58 gui=NONE
		hi TabLineFill ctermbg=NONE ctermfg=8 cterm=NONE guibg=NONE guifg=#4f4b58 gui=NONE
		hi TabLineSel ctermbg=4 ctermfg=0 cterm=NONE guibg=#615772 guifg=#33303b gui=NONE
		hi TermCursorNC ctermbg=3 ctermfg=0 cterm=NONE guibg=#71949a guifg=#33303b gui=NONE
		hi VertSplit ctermbg=NONE ctermfg=NONE cterm=NONE guibg=NONE guifg=NONE gui=NONE
		hi Title ctermbg=NONE ctermfg=4 cterm=NONE guibg=NONE guifg=#615772 gui=NONE
		hi CursorLine ctermbg=NONE ctermfg=8 cterm=NONE guibg=#4c9882 guifg=#312e39 gui=NONE
		hi LineNr ctermbg=NONE ctermfg=8 cterm=NONE guibg=NONE guifg=#4f4b58 gui=NONE
		hi CursorLineNr ctermbg=NONE ctermfg=8 cterm=NONE guibg=NONE guifg=#4c9882 gui=NONE
		hi helpLeadBlank ctermbg=NONE ctermfg=7 cterm=NONE guibg=NONE guifg=#c0a79a gui=NONE
		hi helpNormal ctermbg=NONE ctermfg=7 cterm=NONE guibg=NONE guifg=#c0a79a gui=NONE
		hi Visual ctermbg=8 ctermfg=0 cterm=NONE guibg=#4f4b58 guifg=#33303b gui=NONE
		hi VisualNOS ctermbg=NONE ctermfg=1 cterm=NONE guibg=NONE guifg=#87404f gui=NONE
		hi Pmenu ctermbg=8 ctermfg=7 cterm=NONE guibg=#4f4b58 guifg=#c0a79a gui=NONE
		hi PmenuSbar ctermbg=6 ctermfg=7 cterm=NONE guibg=#554757 guifg=#c0a79a gui=NONE
		hi PmenuSel ctermbg=4 ctermfg=0 cterm=NONE guibg=#615772 guifg=#33303b gui=NONE
		hi PmenuThumb ctermbg=8 ctermfg=8 cterm=NONE guibg=#4f4b58 guifg=#70838c gui=NONE
		hi FoldColumn ctermbg=NONE ctermfg=7 cterm=NONE guibg=NONE guifg=#c0a79a gui=NONE
		hi Folded ctermbg=NONE ctermfg=8 cterm=NONE guibg=NONE guifg=#4f4b58 gui=NONE
		hi WildMenu ctermbg=2 ctermfg=0 cterm=NONE guibg=#4c9882 guifg=#33303b gui=NONE
		hi SpecialKey ctermbg=NONE ctermfg=8 cterm=NONE guibg=NONE guifg=#4f4b58 gui=NONE
		hi DiffAdd ctermbg=NONE ctermfg=2 cterm=NONE guibg=NONE guifg=#4c9882 gui=NONE
		hi DiffChange ctermbg=NONE ctermfg=8 cterm=NONE guibg=NONE guifg=#4f4b58 gui=NONE
		hi DiffDelete ctermbg=NONE ctermfg=1 cterm=NONE guibg=NONE guifg=#87404f gui=NONE
		hi DiffText ctermbg=NONE ctermfg=4 cterm=NONE guibg=NONE guifg=#615772 gui=NONE
		hi IncSearch ctermbg=3 ctermfg=0 cterm=NONE guibg=#71949a guifg=#33303b gui=NONE
		hi Search ctermbg=3 ctermfg=0 cterm=NONE guibg=#71949a guifg=#33303b gui=NONE
		hi Directory ctermbg=NONE ctermfg=4 cterm=NONE guibg=NONE guifg=#615772 gui=NONE
		hi MatchParen ctermbg=8 ctermfg=0 cterm=NONE guibg=#4f4b58 guifg=#33303b gui=NONE
		hi ColorColumn ctermbg=4 ctermfg=4 cterm=NONE guibg=#615772 guifg=#7c9fa6 gui=NONE
		hi signColumn ctermbg=NONE ctermfg=4 cterm=NONE guibg=NONE guifg=#615772 gui=NONE
		hi ErrorMsg ctermbg=NONE ctermfg=8 cterm=NONE guibg=NONE guifg=#4f4b58 gui=NONE
		hi ModeMsg ctermbg=NONE ctermfg=2 cterm=NONE guibg=NONE guifg=#4c9882 gui=NONE
		hi MoreMsg ctermbg=NONE ctermfg=2 cterm=NONE guibg=NONE guifg=#4c9882 gui=NONE
		hi Question ctermbg=NONE ctermfg=4 cterm=NONE guibg=NONE guifg=#615772 gui=NONE
		hi WarningMsg ctermbg=1 ctermfg=0 cterm=NONE guibg=#87404f guifg=#33303b gui=NONE
		hi Cursor ctermbg=NONE ctermfg=8 cterm=NONE guibg=#87404f guifg=NONE gui=NONE
		hi Structure ctermbg=NONE ctermfg=5 cterm=NONE guibg=NONE guifg=#783e57 gui=NONE
		hi CursorColumn ctermbg=8 ctermfg=7 cterm=NONE guibg=#4f4b58 guifg=#c0a79a gui=NONE
		hi ModeMsg ctermbg=NONE ctermfg=7 cterm=NONE guibg=NONE guifg=#c0a79a gui=NONE
		hi SpellBad ctermbg=NONE ctermfg=1 cterm=underline guibg=NONE guifg=#87404f gui=underline guisp=#99736e
		hi SpellCap ctermbg=NONE ctermfg=4 cterm=underline guibg=NONE guifg=#615772 gui=underline guisp=#7c9fa6
		hi SpellLocal ctermbg=NONE ctermfg=5 cterm=underline guibg=NONE guifg=#783e57 gui=underline guisp=#BF9C86
		hi SpellRare ctermbg=NONE ctermfg=6 cterm=underline guibg=NONE guifg=#554757 gui=underline guisp=#99BFBA
		hi Boolean ctermbg=NONE ctermfg=5 cterm=NONE guibg=NONE guifg=#783e57 gui=NONE
		hi Character ctermbg=NONE ctermfg=1 cterm=NONE guibg=NONE guifg=#87404f gui=NONE
		hi Conditional ctermbg=NONE ctermfg=5 cterm=NONE guibg=NONE guifg=#783e57 gui=NONE
		hi Define ctermbg=NONE ctermfg=5 cterm=NONE guibg=NONE guifg=#783e57 gui=NONE
		hi Delimiter ctermbg=NONE ctermfg=5 cterm=NONE guibg=NONE guifg=#783e57 gui=NONE
		hi Float ctermbg=NONE ctermfg=5 cterm=NONE guibg=NONE guifg=#783e57 gui=NONE
		hi Include ctermbg=NONE ctermfg=4 cterm=NONE guibg=NONE guifg=#615772 gui=NONE
		hi Keyword ctermbg=NONE ctermfg=5 cterm=NONE guibg=NONE guifg=#783e57 gui=NONE
		hi Label ctermbg=NONE ctermfg=3 cterm=NONE guibg=NONE guifg=#71949a gui=NONE
		hi Operator ctermbg=NONE ctermfg=7 cterm=NONE guibg=NONE guifg=#c0a79a gui=NONE
		hi Repeat ctermbg=NONE ctermfg=3 cterm=NONE guibg=NONE guifg=#71949a gui=NONE
		hi SpecialChar ctermbg=NONE ctermfg=5 cterm=NONE guibg=NONE guifg=#783e57 gui=NONE
		hi Tag ctermbg=NONE ctermfg=3 cterm=NONE guibg=NONE guifg=#71949a gui=NONE
		hi Typedef ctermbg=NONE ctermfg=3 cterm=NONE guibg=NONE guifg=#71949a gui=NONE
		hi vimUserCommand ctermbg=NONE ctermfg=1 cterm=BOLD guibg=NONE guifg=#87404f gui=BOLD
			hi link vimMap vimUserCommand
			hi link vimLet vimUserCommand
			hi link vimCommand vimUserCommand
			hi link vimFTCmd vimUserCommand
			hi link vimAutoCmd vimUserCommand
			hi link vimNotFunc vimUserCommand
		hi vimNotation ctermbg=NONE ctermfg=4 cterm=NONE guibg=NONE guifg=#615772 gui=NONE
		hi vimMapModKey ctermbg=NONE ctermfg=4 cterm=NONE guibg=NONE guifg=#615772 gui=NONE
		hi vimBracket ctermbg=NONE ctermfg=7 cterm=NONE guibg=NONE guifg=#c0a79a gui=NONE
		hi vimCommentString ctermbg=NONE ctermfg=8 cterm=NONE guibg=NONE guifg=#4f4b58 gui=NONE
		hi htmlLink ctermbg=NONE ctermfg=1 cterm=underline guibg=NONE guifg=#87404f gui=underline
		hi htmlBold ctermbg=NONE ctermfg=3 cterm=NONE guibg=NONE guifg=#71949a gui=NONE
		hi htmlItalic ctermbg=NONE ctermfg=5 cterm=NONE guibg=NONE guifg=#783e57 gui=NONE
		hi htmlEndTag ctermbg=NONE ctermfg=7 cterm=NONE guibg=NONE guifg=#c0a79a gui=NONE
		hi htmlTag ctermbg=NONE ctermfg=7 cterm=NONE guibg=NONE guifg=#c0a79a gui=NONE
		hi htmlTagName ctermbg=NONE ctermfg=1 cterm=BOLD guibg=NONE guifg=#87404f gui=BOLD
		hi htmlH1 ctermbg=NONE ctermfg=7 cterm=BOLD guibg=NONE guifg=#c0a79a gui=BOLD
			hi link htmlH2 htmlH1
			hi link htmlH3 htmlH1
			hi link htmlH4 htmlH1
			hi link htmlH5 htmlH1
			hi link htmlH6 htmlH1
		hi cssMultiColumnAttr ctermbg=NONE ctermfg=2 cterm=NONE guibg=NONE guifg=#4c9882 gui=NONE
			hi link cssFontAttr cssMultiColumnAttr
			hi link cssFlexibleBoxAttr cssMultiColumnAttr
		hi cssBraces ctermbg=NONE ctermfg=7 cterm=NONE guibg=NONE guifg=#c0a79a gui=NONE
			hi link cssAttrComma cssBraces
		hi cssValueLength ctermbg=NONE ctermfg=7 cterm=NONE guibg=NONE guifg=#c0a79a gui=NONE
		hi cssUnitDecorators ctermbg=NONE ctermfg=7 cterm=NONE guibg=NONE guifg=#c0a79a gui=NONE
		hi cssValueNumber ctermbg=NONE ctermfg=7 cterm=NONE guibg=NONE guifg=#c0a79a gui=NONE
			hi link cssValueLength cssValueNumber
		hi cssNoise ctermbg=NONE ctermfg=8 cterm=NONE guibg=NONE guifg=#4f4b58 gui=NONE
		hi cssTagName ctermbg=NONE ctermfg=1 cterm=NONE guibg=NONE guifg=#87404f gui=NONE
		hi cssFunctionName ctermbg=NONE ctermfg=4 cterm=NONE guibg=NONE guifg=#615772 gui=NONE
		hi scssSelectorChar ctermbg=NONE ctermfg=7 cterm=NONE guibg=NONE guifg=#c0a79a gui=NONE
		hi scssAttribute ctermbg=NONE ctermfg=7 cterm=NONE guibg=NONE guifg=#c0a79a gui=NONE
			hi link scssDefinition cssNoise
		hi sassidChar ctermbg=NONE ctermfg=1 cterm=NONE guibg=NONE guifg=#87404f gui=NONE
		hi sassClassChar ctermbg=NONE ctermfg=5 cterm=NONE guibg=NONE guifg=#783e57 gui=NONE
		hi sassInclude ctermbg=NONE ctermfg=5 cterm=NONE guibg=NONE guifg=#783e57 gui=NONE
		hi sassMixing ctermbg=NONE ctermfg=5 cterm=NONE guibg=NONE guifg=#783e57 gui=NONE
		hi sassMixinName ctermbg=NONE ctermfg=4 cterm=NONE guibg=NONE guifg=#615772 gui=NONE
		hi javaScript ctermbg=NONE ctermfg=7 cterm=NONE guibg=NONE guifg=#c0a79a gui=NONE
		hi javaScriptBraces ctermbg=NONE ctermfg=7 cterm=NONE guibg=NONE guifg=#c0a79a gui=NONE
		hi javaScriptNumber ctermbg=NONE ctermfg=5 cterm=NONE guibg=NONE guifg=#783e57 gui=NONE
		hi markdownAutomaticLink ctermbg=NONE ctermfg=1 cterm=underline guibg=NONE guifg=#87404f gui=underline
			hi link markdownUrl markdownAutomaticLink
		hi markdownError ctermbg=NONE ctermfg=7 cterm=NONE guibg=NONE guifg=#c0a79a gui=NONE
		hi markdownCode ctermbg=NONE ctermfg=3 cterm=NONE guibg=NONE guifg=#71949a gui=NONE
		hi markdownCodeBlock ctermbg=NONE ctermfg=3 cterm=NONE guibg=NONE guifg=#71949a gui=NONE
		hi markdownCodeDelimiter ctermbg=NONE ctermfg=5 cterm=NONE guibg=NONE guifg=#783e57 gui=NONE
		hi xdefaultsValue ctermbg=NONE ctermfg=7 cterm=NONE guibg=NONE guifg=#c0a79a gui=NONE
		hi rubyInclude ctermbg=NONE ctermfg=4 cterm=NONE guibg=NONE guifg=#615772 gui=NONE
		hi rubyDefine ctermbg=NONE ctermfg=5 cterm=NONE guibg=NONE guifg=#783e57 gui=NONE
		hi rubyFunction ctermbg=NONE ctermfg=4 cterm=NONE guibg=NONE guifg=#615772 gui=NONE
		hi rubyStringDelimiter ctermbg=NONE ctermfg=2 cterm=NONE guibg=NONE guifg=#4c9882 gui=NONE
		hi rubyInteger ctermbg=NONE ctermfg=3 cterm=NONE guibg=NONE guifg=#71949a gui=NONE
		hi rubyAttribute ctermbg=NONE ctermfg=4 cterm=NONE guibg=NONE guifg=#615772 gui=NONE
		hi rubyConstant ctermbg=NONE ctermfg=3 cterm=NONE guibg=NONE guifg=#71949a gui=NONE
		hi rubyInterpolation ctermbg=NONE ctermfg=2 cterm=NONE guibg=NONE guifg=#4c9882 gui=NONE
		hi rubyInterpolationDelimiter ctermbg=NONE ctermfg=3 cterm=NONE guibg=NONE guifg=#71949a gui=NONE
		hi rubyRegexp ctermbg=NONE ctermfg=6 cterm=NONE guibg=NONE guifg=#554757 gui=NONE
		hi rubySymbol ctermbg=NONE ctermfg=2 cterm=NONE guibg=NONE guifg=#4c9882 gui=NONE
		hi rubyTodo ctermbg=NONE ctermfg=8 cterm=NONE guibg=NONE guifg=#4f4b58 gui=NONE
		hi rubyRegexpAnchor ctermbg=NONE ctermfg=7 cterm=NONE guibg=NONE guifg=#c0a79a gui=NONE
			hi link rubyRegexpQuantifier rubyRegexpAnchor
		hi pythonOperator ctermbg=NONE ctermfg=5 cterm=NONE guibg=NONE guifg=#783e57 gui=NONE
		hi pythonFunction ctermbg=NONE ctermfg=4 cterm=NONE guibg=NONE guifg=#615772 gui=NONE
		hi pythonRepeat ctermbg=NONE ctermfg=5 cterm=NONE guibg=NONE guifg=#783e57 gui=NONE
		hi pythonStatement ctermbg=NONE ctermfg=1 cterm=Bold guibg=NONE guifg=#87404f gui=Bold
		hi pythonBuiltIn ctermbg=NONE ctermfg=4 cterm=NONE guibg=NONE guifg=#615772 gui=NONE
		hi phpMemberSelector ctermbg=NONE ctermfg=7 cterm=NONE guibg=NONE guifg=#c0a79a gui=NONE
		hi phpComparison ctermbg=NONE ctermfg=7 cterm=NONE guibg=NONE guifg=#c0a79a gui=NONE
		hi phpParent ctermbg=NONE ctermfg=7 cterm=NONE guibg=NONE guifg=#c0a79a gui=NONE
		hi cOperator ctermbg=NONE ctermfg=6 cterm=NONE guibg=NONE guifg=#554757 gui=NONE
		hi cPreCondit ctermbg=NONE ctermfg=5 cterm=NONE guibg=NONE guifg=#783e57 gui=NONE
		hi SignifySignAdd ctermbg=NONE ctermfg=2 cterm=NONE guibg=NONE guifg=#4c9882 gui=NONE
		hi SignifySignChange ctermbg=NONE ctermfg=4 cterm=NONE guibg=NONE guifg=#615772 gui=NONE
		hi SignifySignDelete ctermbg=NONE ctermfg=1 cterm=NONE guibg=NONE guifg=#87404f gui=NONE
		hi NERDTreeDirSlash ctermbg=NONE ctermfg=4 cterm=NONE guibg=NONE guifg=#615772 gui=NONE
		hi NERDTreeExecFile ctermbg=NONE ctermfg=7 cterm=NONE guibg=NONE guifg=#c0a79a gui=NONE
elseif &t_Co == 8 || $TERM !~# '^linux' || &t_Co == 16
set t_Co=16
		hi Normal ctermbg=black ctermfg=white cterm=NONE
	set background=dark
		hi NonText ctermbg=NONE ctermfg=black cterm=NONE
		hi Comment ctermbg=NONE ctermfg=gray cterm=NONE
		hi Constant ctermbg=NONE ctermfg=yellow cterm=NONE
		hi Error ctermbg=red ctermfg=white cterm=NONE
		hi Identifier ctermbg=NONE ctermfg=red cterm=NONE
		hi Ignore ctermbg=gray ctermfg=black cterm=NONE
		hi PreProc ctermbg=NONE ctermfg=yellow cterm=NONE
		hi Special ctermbg=NONE ctermfg=cyan cterm=NONE
		hi Statement ctermbg=NONE ctermfg=red cterm=NONE
		hi String ctermbg=NONE ctermfg=green cterm=NONE
		hi Number ctermbg=NONE ctermfg=yellow cterm=NONE
		hi Todo ctermbg=gray ctermfg=yellow cterm=NONE
		hi Type ctermbg=NONE ctermfg=yellow cterm=NONE
		hi Underlined ctermbg=NONE ctermfg=red cterm=underline
		hi StatusLine ctermbg=white ctermfg=black cterm=NONE
		hi StatusLineNC ctermbg=NONE ctermfg=NONE cterm=NONE
		hi TabLine ctermbg=NONE ctermfg=gray cterm=NONE
		hi TabLineFill ctermbg=NONE ctermfg=gray cterm=NONE
		hi TabLineSel ctermbg=blue ctermfg=black cterm=NONE
		hi TermCursorNC ctermbg=yellow ctermfg=black cterm=NONE
		hi VertSplit ctermbg=NONE ctermfg=NONE cterm=NONE
		hi Title ctermbg=NONE ctermfg=blue cterm=NONE
		hi CursorLine ctermbg=NONE ctermfg=gray cterm=NONE
		hi LineNr ctermbg=NONE ctermfg=gray cterm=NONE
		hi CursorLineNr ctermbg=NONE ctermfg=gray cterm=NONE
		hi helpLeadBlank ctermbg=NONE ctermfg=white cterm=NONE
		hi helpNormal ctermbg=NONE ctermfg=white cterm=NONE
		hi Visual ctermbg=gray ctermfg=black cterm=NONE
		hi VisualNOS ctermbg=NONE ctermfg=red cterm=NONE
		hi Pmenu ctermbg=gray ctermfg=white cterm=NONE
		hi PmenuSbar ctermbg=cyan ctermfg=white cterm=NONE
		hi PmenuSel ctermbg=blue ctermfg=black cterm=NONE
		hi PmenuThumb ctermbg=gray ctermfg=gray cterm=NONE
		hi FoldColumn ctermbg=NONE ctermfg=white cterm=NONE
		hi Folded ctermbg=NONE ctermfg=gray cterm=NONE
		hi WildMenu ctermbg=green ctermfg=black cterm=NONE
		hi SpecialKey ctermbg=NONE ctermfg=gray cterm=NONE
		hi DiffAdd ctermbg=NONE ctermfg=green cterm=NONE
		hi DiffChange ctermbg=NONE ctermfg=gray cterm=NONE
		hi DiffDelete ctermbg=NONE ctermfg=red cterm=NONE
		hi DiffText ctermbg=NONE ctermfg=blue cterm=NONE
		hi IncSearch ctermbg=yellow ctermfg=black cterm=NONE
		hi Search ctermbg=yellow ctermfg=black cterm=NONE
		hi Directory ctermbg=NONE ctermfg=blue cterm=NONE
		hi MatchParen ctermbg=gray ctermfg=black cterm=NONE
		hi ColorColumn ctermbg=blue ctermfg=blue cterm=NONE
		hi signColumn ctermbg=NONE ctermfg=blue cterm=NONE
		hi ErrorMsg ctermbg=NONE ctermfg=gray cterm=NONE
		hi ModeMsg ctermbg=NONE ctermfg=green cterm=NONE
		hi MoreMsg ctermbg=NONE ctermfg=green cterm=NONE
		hi Question ctermbg=NONE ctermfg=blue cterm=NONE
		hi WarningMsg ctermbg=red ctermfg=black cterm=NONE
		hi Cursor ctermbg=NONE ctermfg=gray cterm=NONE
		hi Structure ctermbg=NONE ctermfg=orange cterm=NONE
		hi CursorColumn ctermbg=gray ctermfg=white cterm=NONE
		hi ModeMsg ctermbg=NONE ctermfg=white cterm=NONE
		hi SpellBad ctermbg=NONE ctermfg=red cterm=underline
		hi SpellCap ctermbg=NONE ctermfg=blue cterm=underline
		hi SpellLocal ctermbg=NONE ctermfg=orange cterm=underline
		hi SpellRare ctermbg=NONE ctermfg=cyan cterm=underline
		hi Boolean ctermbg=NONE ctermfg=orange cterm=NONE
		hi Character ctermbg=NONE ctermfg=red cterm=NONE
		hi Conditional ctermbg=NONE ctermfg=orange cterm=NONE
		hi Define ctermbg=NONE ctermfg=orange cterm=NONE
		hi Delimiter ctermbg=NONE ctermfg=orange cterm=NONE
		hi Float ctermbg=NONE ctermfg=orange cterm=NONE
		hi Include ctermbg=NONE ctermfg=blue cterm=NONE
		hi Keyword ctermbg=NONE ctermfg=orange cterm=NONE
		hi Label ctermbg=NONE ctermfg=yellow cterm=NONE
		hi Operator ctermbg=NONE ctermfg=white cterm=NONE
		hi Repeat ctermbg=NONE ctermfg=yellow cterm=NONE
		hi SpecialChar ctermbg=NONE ctermfg=orange cterm=NONE
		hi Tag ctermbg=NONE ctermfg=yellow cterm=NONE
		hi Typedef ctermbg=NONE ctermfg=yellow cterm=NONE
		hi vimUserCommand ctermbg=NONE ctermfg=red cterm=BOLD
			hi link vimMap vimUserCommand
			hi link vimLet vimUserCommand
			hi link vimCommand vimUserCommand
			hi link vimFTCmd vimUserCommand
			hi link vimAutoCmd vimUserCommand
			hi link vimNotFunc vimUserCommand
		hi vimNotation ctermbg=NONE ctermfg=blue cterm=NONE
		hi vimMapModKey ctermbg=NONE ctermfg=blue cterm=NONE
		hi vimBracket ctermbg=NONE ctermfg=white cterm=NONE
		hi vimCommentString ctermbg=NONE ctermfg=gray cterm=NONE
		hi htmlLink ctermbg=NONE ctermfg=red cterm=underline
		hi htmlBold ctermbg=NONE ctermfg=yellow cterm=NONE
		hi htmlItalic ctermbg=NONE ctermfg=orange cterm=NONE
		hi htmlEndTag ctermbg=NONE ctermfg=white cterm=NONE
		hi htmlTag ctermbg=NONE ctermfg=white cterm=NONE
		hi htmlTagName ctermbg=NONE ctermfg=red cterm=BOLD
		hi htmlH1 ctermbg=NONE ctermfg=white cterm=BOLD
			hi link htmlH2 htmlH1
			hi link htmlH3 htmlH1
			hi link htmlH4 htmlH1
			hi link htmlH5 htmlH1
			hi link htmlH6 htmlH1
		hi cssMultiColumnAttr ctermbg=NONE ctermfg=green cterm=NONE
			hi link cssFontAttr cssMultiColumnAttr
			hi link cssFlexibleBoxAttr cssMultiColumnAttr
		hi cssBraces ctermbg=NONE ctermfg=white cterm=NONE
			hi link cssAttrComma cssBraces
		hi cssValueLength ctermbg=NONE ctermfg=white cterm=NONE
		hi cssUnitDecorators ctermbg=NONE ctermfg=white cterm=NONE
		hi cssValueNumber ctermbg=NONE ctermfg=white cterm=NONE
			hi link cssValueLength cssValueNumber
		hi cssNoise ctermbg=NONE ctermfg=gray cterm=NONE
		hi cssTagName ctermbg=NONE ctermfg=red cterm=NONE
		hi cssFunctionName ctermbg=NONE ctermfg=blue cterm=NONE
		hi scssSelectorChar ctermbg=NONE ctermfg=white cterm=NONE
		hi scssAttribute ctermbg=NONE ctermfg=white cterm=NONE
			hi link scssDefinition cssNoise
		hi sassidChar ctermbg=NONE ctermfg=red cterm=NONE
		hi sassClassChar ctermbg=NONE ctermfg=orange cterm=NONE
		hi sassInclude ctermbg=NONE ctermfg=orange cterm=NONE
		hi sassMixing ctermbg=NONE ctermfg=orange cterm=NONE
		hi sassMixinName ctermbg=NONE ctermfg=blue cterm=NONE
		hi javaScript ctermbg=NONE ctermfg=white cterm=NONE
		hi javaScriptBraces ctermbg=NONE ctermfg=white cterm=NONE
		hi javaScriptNumber ctermbg=NONE ctermfg=orange cterm=NONE
		hi markdownAutomaticLink ctermbg=NONE ctermfg=red cterm=underline
			hi link markdownUrl markdownAutomaticLink
		hi markdownError ctermbg=NONE ctermfg=white cterm=NONE
		hi markdownCode ctermbg=NONE ctermfg=yellow cterm=NONE
		hi markdownCodeBlock ctermbg=NONE ctermfg=yellow cterm=NONE
		hi markdownCodeDelimiter ctermbg=NONE ctermfg=orange cterm=NONE
		hi xdefaultsValue ctermbg=NONE ctermfg=white cterm=NONE
		hi rubyInclude ctermbg=NONE ctermfg=blue cterm=NONE
		hi rubyDefine ctermbg=NONE ctermfg=orange cterm=NONE
		hi rubyFunction ctermbg=NONE ctermfg=blue cterm=NONE
		hi rubyStringDelimiter ctermbg=NONE ctermfg=green cterm=NONE
		hi rubyInteger ctermbg=NONE ctermfg=yellow cterm=NONE
		hi rubyAttribute ctermbg=NONE ctermfg=blue cterm=NONE
		hi rubyConstant ctermbg=NONE ctermfg=yellow cterm=NONE
		hi rubyInterpolation ctermbg=NONE ctermfg=green cterm=NONE
		hi rubyInterpolationDelimiter ctermbg=NONE ctermfg=yellow cterm=NONE
		hi rubyRegexp ctermbg=NONE ctermfg=cyan cterm=NONE
		hi rubySymbol ctermbg=NONE ctermfg=green cterm=NONE
		hi rubyTodo ctermbg=NONE ctermfg=gray cterm=NONE
		hi rubyRegexpAnchor ctermbg=NONE ctermfg=white cterm=NONE
			hi link rubyRegexpQuantifier rubyRegexpAnchor
		hi pythonOperator ctermbg=NONE ctermfg=orange cterm=NONE
		hi pythonFunction ctermbg=NONE ctermfg=blue cterm=NONE
		hi pythonRepeat ctermbg=NONE ctermfg=orange cterm=NONE
		hi pythonStatement ctermbg=NONE ctermfg=red cterm=Bold
		hi pythonBuiltIn ctermbg=NONE ctermfg=blue cterm=NONE
		hi phpMemberSelector ctermbg=NONE ctermfg=white cterm=NONE
		hi phpComparison ctermbg=NONE ctermfg=white cterm=NONE
		hi phpParent ctermbg=NONE ctermfg=white cterm=NONE
		hi cOperator ctermbg=NONE ctermfg=cyan cterm=NONE
		hi cPreCondit ctermbg=NONE ctermfg=orange cterm=NONE
		hi SignifySignAdd ctermbg=NONE ctermfg=green cterm=NONE
		hi SignifySignChange ctermbg=NONE ctermfg=blue cterm=NONE
		hi SignifySignDelete ctermbg=NONE ctermfg=red cterm=NONE
		hi NERDTreeDirSlash ctermbg=NONE ctermfg=blue cterm=NONE
		hi NERDTreeExecFile ctermbg=NONE ctermfg=white cterm=NONE
endif


" }}}v



	" Neovim Terminal Mode Colors.
	let g:terminal_color_0 = "\#312e39"
	let g:terminal_color_1 = "\#87404f"
	let g:terminal_color_2 = "\#4c9882"
	let g:terminal_color_3 = "\#71949a"
	let g:terminal_color_4 = "\#615772"
	let g:terminal_color_5 = "\#783e57"
	let g:terminal_color_6 = "\#554757"
	let g:terminal_color_7 = "\#554757"
	let g:terminal_color_8 = "\#33303b"
	let g:terminal_color_9 = "\#87404f"
	let g:terminal_color_10 = "\#87404f"
	let g:terminal_color_11 = "\#71949a"
	let g:terminal_color_12 = "\#71949a"
	let g:terminal_color_13 = "\#783e57"
	let g:terminal_color_14 = "\#554757"
	let g:terminal_color_15 = "\#c0a79a"

" }}}
