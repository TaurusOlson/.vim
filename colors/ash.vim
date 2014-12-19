" Vim color file
" Converted from Textmate theme Ash using Coloration v0.3.3 (http://github.com/sickill/coloration)

set background=dark
highlight clear

if exists("syntax_on")
  syntax reset
endif

let g:colors_name = "Ash"

hi Cursor ctermfg=236 ctermbg=144 cterm=NONE guifg=#2d2d2d guibg=#9daa7e gui=NONE
hi Visual ctermfg=NONE ctermbg=238 cterm=NONE guifg=NONE guibg=#484848 gui=NONE
hi CursorLine ctermfg=NONE ctermbg=237 cterm=NONE guifg=NONE guibg=#3b3b3a gui=NONE
hi CursorColumn ctermfg=NONE ctermbg=237 cterm=NONE guifg=NONE guibg=#3b3b3a gui=NONE
hi ColorColumn ctermfg=NONE ctermbg=237 cterm=NONE guifg=NONE guibg=#3b3b3a gui=NONE
hi LineNr ctermfg=59 ctermbg=237 cterm=NONE guifg=#73716f guibg=#3b3b3a gui=NONE
hi VertSplit ctermfg=59 ctermbg=59 cterm=NONE guifg=#565453 guibg=#565453 gui=NONE
hi MatchParen ctermfg=167 ctermbg=NONE cterm=underline guifg=#d96f57 guibg=NONE gui=underline
hi StatusLine ctermfg=145 ctermbg=59 cterm=bold guifg=#b9b5b0 guibg=#565453 gui=bold
hi StatusLineNC ctermfg=145 ctermbg=59 cterm=NONE guifg=#b9b5b0 guibg=#565453 gui=NONE
hi Pmenu ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
hi PmenuSel ctermfg=NONE ctermbg=238 cterm=NONE guifg=NONE guibg=#484848 gui=NONE
hi IncSearch ctermfg=236 ctermbg=179 cterm=NONE guifg=#2d2d2d guibg=#dda66a gui=NONE
hi Search ctermfg=NONE ctermbg=NONE cterm=underline guifg=NONE guibg=NONE gui=underline
hi Directory ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
hi Folded ctermfg=59 ctermbg=236 cterm=NONE guifg=#615c59 guibg=#2d2d2d gui=NONE

hi Normal ctermfg=145 ctermbg=236 cterm=NONE guifg=#b9b5b0 guibg=#2d2d2d gui=NONE
hi Boolean ctermfg=102 ctermbg=NONE cterm=NONE guifg=#9a7474 guibg=NONE gui=NONE
hi Character ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
hi Comment ctermfg=59 ctermbg=235 cterm=NONE guifg=#615c59 guibg=#232323 gui=NONE
hi Conditional ctermfg=167 ctermbg=NONE cterm=NONE guifg=#d96f57 guibg=NONE gui=NONE
hi Constant ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
hi Define ctermfg=167 ctermbg=NONE cterm=NONE guifg=#d96f57 guibg=NONE gui=NONE
hi DiffAdd ctermfg=145 ctermbg=64 cterm=bold guifg=#b9b5b0 guibg=#47840e gui=bold
hi DiffDelete ctermfg=88 ctermbg=NONE cterm=NONE guifg=#8c0909 guibg=NONE gui=NONE
hi DiffChange ctermfg=145 ctermbg=23 cterm=NONE guifg=#b9b5b0 guibg=#273c5a gui=NONE
hi DiffText ctermfg=145 ctermbg=24 cterm=bold guifg=#b9b5b0 guibg=#204a87 gui=bold
hi ErrorMsg ctermfg=231 ctermbg=138 cterm=NONE guifg=#f8f8f0 guibg=#b88383 gui=NONE
hi WarningMsg ctermfg=231 ctermbg=138 cterm=NONE guifg=#f8f8f0 guibg=#b88383 gui=NONE
hi Float ctermfg=102 ctermbg=NONE cterm=NONE guifg=#9a7474 guibg=NONE gui=NONE
hi Function ctermfg=230 ctermbg=NONE cterm=NONE guifg=#fff7eb guibg=NONE gui=NONE
hi Identifier ctermfg=59 ctermbg=NONE cterm=NONE guifg=#736c68 guibg=NONE gui=NONE
hi Keyword ctermfg=167 ctermbg=NONE cterm=NONE guifg=#d96f57 guibg=NONE gui=NONE
hi Label ctermfg=179 ctermbg=NONE cterm=NONE guifg=#dda66a guibg=NONE gui=NONE
hi NonText ctermfg=59 ctermbg=236 cterm=NONE guifg=#3b3a32 guibg=#343434 gui=NONE
hi Number ctermfg=102 ctermbg=NONE cterm=NONE guifg=#9a7474 guibg=NONE gui=NONE
hi Operator ctermfg=167 ctermbg=NONE cterm=NONE guifg=#d96f57 guibg=NONE gui=NONE
hi PreProc ctermfg=167 ctermbg=NONE cterm=NONE guifg=#d96f57 guibg=NONE gui=NONE
hi Special ctermfg=145 ctermbg=NONE cterm=NONE guifg=#b9b5b0 guibg=NONE gui=NONE
hi SpecialKey ctermfg=59 ctermbg=237 cterm=NONE guifg=#3b3a32 guibg=#3b3b3a gui=NONE
hi Statement ctermfg=167 ctermbg=NONE cterm=NONE guifg=#d96f57 guibg=NONE gui=NONE
hi StorageClass ctermfg=59 ctermbg=NONE cterm=NONE guifg=#736c68 guibg=NONE gui=NONE
hi String ctermfg=179 ctermbg=NONE cterm=NONE guifg=#dda66a guibg=NONE gui=NONE
hi Tag ctermfg=59 ctermbg=NONE cterm=NONE guifg=#615c59 guibg=NONE gui=NONE
hi Title ctermfg=145 ctermbg=NONE cterm=bold guifg=#b9b5b0 guibg=NONE gui=bold
hi Todo ctermfg=59 ctermbg=235 cterm=inverse,bold guifg=#615c59 guibg=#232323 gui=inverse,bold
hi Type ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
hi Underlined ctermfg=NONE ctermbg=NONE cterm=underline guifg=NONE guibg=NONE gui=underline
hi rubyClass ctermfg=167 ctermbg=NONE cterm=NONE guifg=#d96f57 guibg=NONE gui=NONE
hi rubyFunction ctermfg=230 ctermbg=NONE cterm=NONE guifg=#fff7eb guibg=NONE gui=NONE
hi rubyInterpolationDelimiter ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
hi rubySymbol ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
hi rubyConstant ctermfg=149 ctermbg=NONE cterm=NONE guifg=#bddd6a guibg=NONE gui=NONE
hi rubyStringDelimiter ctermfg=179 ctermbg=NONE cterm=NONE guifg=#dda66a guibg=NONE gui=NONE
hi rubyBlockParameter ctermfg=102 ctermbg=NONE cterm=NONE guifg=#908882 guibg=NONE gui=NONE
hi rubyInstanceVariable ctermfg=102 ctermbg=NONE cterm=NONE guifg=#908882 guibg=NONE gui=NONE
hi rubyInclude ctermfg=167 ctermbg=NONE cterm=NONE guifg=#d96f57 guibg=NONE gui=NONE
hi rubyGlobalVariable ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
hi rubyRegexp ctermfg=179 ctermbg=NONE cterm=NONE guifg=#dda66a guibg=NONE gui=NONE
hi rubyRegexpDelimiter ctermfg=179 ctermbg=NONE cterm=NONE guifg=#dda66a guibg=NONE gui=NONE
hi rubyEscape ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
hi rubyControl ctermfg=167 ctermbg=NONE cterm=NONE guifg=#d96f57 guibg=NONE gui=NONE
hi rubyClassVariable ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
hi rubyOperator ctermfg=167 ctermbg=NONE cterm=NONE guifg=#d96f57 guibg=NONE gui=NONE
hi rubyException ctermfg=167 ctermbg=NONE cterm=NONE guifg=#d96f57 guibg=NONE gui=NONE
hi rubyPseudoVariable ctermfg=102 ctermbg=NONE cterm=NONE guifg=#908882 guibg=NONE gui=NONE
hi rubyRailsUserClass ctermfg=149 ctermbg=NONE cterm=NONE guifg=#bddd6a guibg=NONE gui=NONE
hi rubyRailsARAssociationMethod ctermfg=149 ctermbg=NONE cterm=NONE guifg=#bddd6a guibg=NONE gui=NONE
hi rubyRailsARMethod ctermfg=149 ctermbg=NONE cterm=NONE guifg=#bddd6a guibg=NONE gui=NONE
hi rubyRailsRenderMethod ctermfg=149 ctermbg=NONE cterm=NONE guifg=#bddd6a guibg=NONE gui=NONE
hi rubyRailsMethod ctermfg=149 ctermbg=NONE cterm=NONE guifg=#bddd6a guibg=NONE gui=NONE
hi erubyDelimiter ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
hi erubyComment ctermfg=59 ctermbg=235 cterm=NONE guifg=#615c59 guibg=#232323 gui=NONE
hi erubyRailsMethod ctermfg=149 ctermbg=NONE cterm=NONE guifg=#bddd6a guibg=NONE gui=NONE
hi htmlTag ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
hi htmlEndTag ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
hi htmlTagName ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
hi htmlArg ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
hi htmlSpecialChar ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
hi javaScriptFunction ctermfg=59 ctermbg=NONE cterm=NONE guifg=#736c68 guibg=NONE gui=NONE
hi javaScriptRailsFunction ctermfg=149 ctermbg=NONE cterm=NONE guifg=#bddd6a guibg=NONE gui=NONE
hi javaScriptBraces ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
hi yamlKey ctermfg=167 ctermbg=NONE cterm=NONE guifg=#d96f57 guibg=NONE gui=NONE
hi yamlAnchor ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
hi yamlAlias ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
hi yamlDocumentHeader ctermfg=179 ctermbg=NONE cterm=NONE guifg=#dda66a guibg=NONE gui=NONE
hi cssURL ctermfg=102 ctermbg=NONE cterm=NONE guifg=#9a7474 guibg=NONE gui=NONE
hi cssFunctionName ctermfg=179 ctermbg=NONE cterm=NONE guifg=#dda66a guibg=NONE gui=NONE
hi cssColor ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
hi cssPseudoClassId ctermfg=149 ctermbg=NONE cterm=NONE guifg=#bddd6a guibg=NONE gui=NONE
hi cssClassName ctermfg=145 ctermbg=NONE cterm=NONE guifg=#b9b5b0 guibg=NONE gui=NONE
hi cssValueLength ctermfg=230 ctermbg=NONE cterm=NONE guifg=#fff7eb guibg=NONE gui=NONE
hi cssCommonAttr ctermfg=179 ctermbg=NONE cterm=NONE guifg=#dda66a guibg=NONE gui=NONE
hi cssBraces ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
