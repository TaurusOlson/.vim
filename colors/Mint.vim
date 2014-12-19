" Vim color file
" Converted from Textmate theme Mint using Coloration v0.3.3 (http://github.com/sickill/coloration)

set background=dark
highlight clear

if exists("syntax_on")
  syntax reset
endif

let g:colors_name = "Mint"

hi Cursor ctermfg=234 ctermbg=144 cterm=NONE guifg=#1f1b18 guibg=#9daa7e gui=NONE
hi Visual ctermfg=NONE ctermbg=59 cterm=NONE guifg=NONE guibg=#483c33 gui=NONE
hi CursorLine ctermfg=NONE ctermbg=16 cterm=NONE guifg=NONE guibg=#2e2a25 gui=NONE
hi CursorColumn ctermfg=NONE ctermbg=16 cterm=NONE guifg=NONE guibg=#2e2a25 gui=NONE
hi ColorColumn ctermfg=NONE ctermbg=16 cterm=NONE guifg=NONE guibg=#2e2a25 gui=NONE
hi LineNr ctermfg=59 ctermbg=16 cterm=NONE guifg=#6c655b guibg=#2e2a25 gui=NONE
hi VertSplit ctermfg=59 ctermbg=59 cterm=NONE guifg=#4c463f guibg=#4c463f gui=NONE
hi MatchParen ctermfg=215 ctermbg=NONE cterm=underline guifg=#efaf63 guibg=NONE gui=underline
hi StatusLine ctermfg=145 ctermbg=59 cterm=bold guifg=#b9ae9e guibg=#4c463f gui=bold
hi StatusLineNC ctermfg=145 ctermbg=59 cterm=NONE guifg=#b9ae9e guibg=#4c463f gui=NONE
hi Pmenu ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
hi PmenuSel ctermfg=NONE ctermbg=59 cterm=NONE guifg=NONE guibg=#483c33 gui=NONE
hi IncSearch ctermfg=234 ctermbg=144 cterm=NONE guifg=#1f1b18 guibg=#afbf83 gui=NONE
hi Search ctermfg=NONE ctermbg=NONE cterm=underline guifg=NONE guibg=NONE gui=underline
hi Directory ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
hi Folded ctermfg=95 ctermbg=234 cterm=NONE guifg=#817267 guibg=#1f1b18 gui=NONE

hi Normal ctermfg=145 ctermbg=234 cterm=NONE guifg=#b9ae9e guibg=#1f1b18 gui=NONE
hi Boolean ctermfg=102 ctermbg=NONE cterm=NONE guifg=#9a7474 guibg=NONE gui=NONE
hi Character ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
hi Comment ctermfg=95 ctermbg=233 cterm=NONE guifg=#817267 guibg=#141210 gui=NONE
hi Conditional ctermfg=215 ctermbg=NONE cterm=NONE guifg=#efaf63 guibg=NONE gui=NONE
hi Constant ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
hi Define ctermfg=215 ctermbg=NONE cterm=NONE guifg=#efaf63 guibg=NONE gui=NONE
hi DiffAdd ctermfg=145 ctermbg=64 cterm=bold guifg=#b9ae9e guibg=#45810a gui=bold
hi DiffDelete ctermfg=88 ctermbg=NONE cterm=NONE guifg=#890505 guibg=NONE gui=NONE
hi DiffChange ctermfg=145 ctermbg=23 cterm=NONE guifg=#b9ae9e guibg=#203350 gui=NONE
hi DiffText ctermfg=145 ctermbg=24 cterm=bold guifg=#b9ae9e guibg=#204a87 gui=bold
hi ErrorMsg ctermfg=231 ctermbg=138 cterm=NONE guifg=#f8f8f0 guibg=#b88383 gui=NONE
hi WarningMsg ctermfg=231 ctermbg=138 cterm=NONE guifg=#f8f8f0 guibg=#b88383 gui=NONE
hi Float ctermfg=102 ctermbg=NONE cterm=NONE guifg=#9a7474 guibg=NONE gui=NONE
hi Function ctermfg=230 ctermbg=NONE cterm=NONE guifg=#fff0d9 guibg=NONE gui=NONE
hi Identifier ctermfg=101 ctermbg=NONE cterm=NONE guifg=#907f71 guibg=NONE gui=NONE
hi Keyword ctermfg=215 ctermbg=NONE cterm=NONE guifg=#efaf63 guibg=NONE gui=NONE
hi Label ctermfg=144 ctermbg=NONE cterm=NONE guifg=#afbf83 guibg=NONE gui=NONE
hi NonText ctermfg=59 ctermbg=16 cterm=NONE guifg=#3b3a32 guibg=#27221f gui=NONE
hi Number ctermfg=102 ctermbg=NONE cterm=NONE guifg=#9a7474 guibg=NONE gui=NONE
hi Operator ctermfg=215 ctermbg=NONE cterm=NONE guifg=#efaf63 guibg=NONE gui=NONE
hi PreProc ctermfg=215 ctermbg=NONE cterm=NONE guifg=#efaf63 guibg=NONE gui=NONE
hi Special ctermfg=145 ctermbg=NONE cterm=NONE guifg=#b9ae9e guibg=NONE gui=NONE
hi SpecialKey ctermfg=59 ctermbg=16 cterm=NONE guifg=#3b3a32 guibg=#2e2a25 gui=NONE
hi Statement ctermfg=215 ctermbg=NONE cterm=NONE guifg=#efaf63 guibg=NONE gui=NONE
hi StorageClass ctermfg=101 ctermbg=NONE cterm=NONE guifg=#907f71 guibg=NONE gui=NONE
hi String ctermfg=144 ctermbg=NONE cterm=NONE guifg=#afbf83 guibg=NONE gui=NONE
hi Tag ctermfg=95 ctermbg=NONE cterm=NONE guifg=#7d6b5d guibg=NONE gui=NONE
hi Title ctermfg=145 ctermbg=NONE cterm=bold guifg=#b9ae9e guibg=NONE gui=bold
hi Todo ctermfg=95 ctermbg=233 cterm=inverse,bold guifg=#817267 guibg=#141210 gui=inverse,bold
hi Type ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
hi Underlined ctermfg=NONE ctermbg=NONE cterm=underline guifg=NONE guibg=NONE gui=underline
hi rubyClass ctermfg=215 ctermbg=NONE cterm=NONE guifg=#efaf63 guibg=NONE gui=NONE
hi rubyFunction ctermfg=230 ctermbg=NONE cterm=NONE guifg=#fff0d9 guibg=NONE gui=NONE
hi rubyInterpolationDelimiter ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
hi rubySymbol ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
hi rubyConstant ctermfg=223 ctermbg=NONE cterm=NONE guifg=#f9cda2 guibg=NONE gui=NONE
hi rubyStringDelimiter ctermfg=144 ctermbg=NONE cterm=NONE guifg=#afbf83 guibg=NONE gui=NONE
hi rubyBlockParameter ctermfg=180 ctermbg=NONE cterm=NONE guifg=#e0b37d guibg=NONE gui=NONE
hi rubyInstanceVariable ctermfg=101 ctermbg=NONE cterm=NONE guifg=#907f71 guibg=NONE gui=NONE
hi rubyInclude ctermfg=215 ctermbg=NONE cterm=NONE guifg=#efaf63 guibg=NONE gui=NONE
hi rubyGlobalVariable ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
hi rubyRegexp ctermfg=144 ctermbg=NONE cterm=NONE guifg=#afbf83 guibg=NONE gui=NONE
hi rubyRegexpDelimiter ctermfg=144 ctermbg=NONE cterm=NONE guifg=#afbf83 guibg=NONE gui=NONE
hi rubyEscape ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
hi rubyControl ctermfg=215 ctermbg=NONE cterm=NONE guifg=#efaf63 guibg=NONE gui=NONE
hi rubyClassVariable ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
hi rubyOperator ctermfg=215 ctermbg=NONE cterm=NONE guifg=#efaf63 guibg=NONE gui=NONE
hi rubyException ctermfg=215 ctermbg=NONE cterm=NONE guifg=#efaf63 guibg=NONE gui=NONE
hi rubyPseudoVariable ctermfg=101 ctermbg=NONE cterm=NONE guifg=#907f71 guibg=NONE gui=NONE
hi rubyRailsUserClass ctermfg=223 ctermbg=NONE cterm=NONE guifg=#f9cda2 guibg=NONE gui=NONE
hi rubyRailsARAssociationMethod ctermfg=223 ctermbg=NONE cterm=NONE guifg=#f9cda2 guibg=NONE gui=NONE
hi rubyRailsARMethod ctermfg=223 ctermbg=NONE cterm=NONE guifg=#f9cda2 guibg=NONE gui=NONE
hi rubyRailsRenderMethod ctermfg=223 ctermbg=NONE cterm=NONE guifg=#f9cda2 guibg=NONE gui=NONE
hi rubyRailsMethod ctermfg=223 ctermbg=NONE cterm=NONE guifg=#f9cda2 guibg=NONE gui=NONE
hi erubyDelimiter ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
hi erubyComment ctermfg=95 ctermbg=233 cterm=NONE guifg=#817267 guibg=#141210 gui=NONE
hi erubyRailsMethod ctermfg=223 ctermbg=NONE cterm=NONE guifg=#f9cda2 guibg=NONE gui=NONE
hi htmlTag ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
hi htmlEndTag ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
hi htmlTagName ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
hi htmlArg ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
hi htmlSpecialChar ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
hi javaScriptFunction ctermfg=101 ctermbg=NONE cterm=NONE guifg=#907f71 guibg=NONE gui=NONE
hi javaScriptRailsFunction ctermfg=223 ctermbg=NONE cterm=NONE guifg=#f9cda2 guibg=NONE gui=NONE
hi javaScriptBraces ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
hi yamlKey ctermfg=95 ctermbg=NONE cterm=NONE guifg=#7d6b5d guibg=NONE gui=NONE
hi yamlAnchor ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
hi yamlAlias ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
hi yamlDocumentHeader ctermfg=144 ctermbg=NONE cterm=NONE guifg=#afbf83 guibg=NONE gui=NONE
hi cssURL ctermfg=144 ctermbg=NONE cterm=NONE guifg=#afbf83 guibg=NONE gui=NONE
hi cssFunctionName ctermfg=180 ctermbg=NONE cterm=NONE guifg=#e0b37d guibg=NONE gui=NONE
hi cssColor ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
hi cssPseudoClassId ctermfg=230 ctermbg=NONE cterm=NONE guifg=#fff0d9 guibg=NONE gui=NONE
hi cssClassName ctermfg=145 ctermbg=NONE cterm=NONE guifg=#b9ae9e guibg=NONE gui=NONE
hi cssValueLength ctermfg=230 ctermbg=NONE cterm=NONE guifg=#fff0d9 guibg=NONE gui=NONE
hi cssCommonAttr ctermfg=180 ctermbg=NONE cterm=NONE guifg=#e0b37d guibg=NONE gui=NONE
hi cssBraces ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
