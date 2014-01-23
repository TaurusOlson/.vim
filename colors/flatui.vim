" --------------------------------------------- 
"
" Name: Flat UI colorscheme
" Author: Taurus Olson <taurusolson@gmail.com>
"
" --------------------------------------------- 


" Initialization {{{1
hi clear
if exists("syntax_on")
  syntax reset
endif
let colors_name = "flatui"


let s:flatui_white = "#FFFFFF"
let s:flatui_black = "#1A1A1A"

" Swatch 1 {{{1
let s:flatui_turquoise  = "#1ABC9C"
let s:flatui_emerald    = "#2ECC71"
let s:flatui_peterriver = "#3498DB"
let s:flatui_amethyst   = "#9B59B6"
let s:flatui_wetasphalt = "#34495E"
let s:flatui_sunflower  = "#F1C40F"
let s:flatui_carrot     = "#E67E22"
let s:flatui_alizarin   = "#E74C3C"
let s:flatui_clouds     = "#ECF0F1"
let s:flatui_concrete   = "#95A5A6"

let s:solstice_brown      = "#262626"
let s:solstice_dark_brown = "#222222"
let s:solstice_black      = "#1A1A1A"

" Swatch 2 {{{1
let s:flatui_greensea     = "#16A085"
let s:flatui_nephritis    = "#27AE60"
let s:flatui_nephritis    = "#27AE60"
let s:flatui_belizehole   = "#2980B9"
let s:flatui_wisteria     = "#8E44AD"
let s:flatui_midnightblue = "#2C3E50"
let s:flatui_orange       = "#F39C12"
let s:flatui_pumpkin      = "#D35400"
let s:flatui_pomegranate  = "C0392B"
let s:flatui_silver       = "#BDC3C7"
let s:flatui_asbestos     = "#7F8C8D"


function! Colorize(group, fg, bg, gui)
    exe "hi " .a:group. " guifg=" .a:fg. " guibg=".a:bg. " gui="a:gui
endfunction



call Colorize("Character"   , s:flatui_sunflower , "NONE"    , "none")
call Colorize("String"      , s:flatui_alizarin , "NONE"    , "none")
call Colorize("Boolean"     , s:flatui_amethyst        , "NONE"    , "none")
call Colorize("Number"      , s:flatui_amethyst        , "NONE"    , "none")
call Colorize("Conditional" , s:flatui_turquoise , "NONE"    , "bold")
call Colorize("Constant"    , s:flatui_amethyst        , "NONE"    , "bold")
call Colorize("Cursor"      , "bg"        , s:flatui_peterriver, "bold")
call Colorize("Debug"       , "#BCA3A3"        , "NONE"    , "bold")
call Colorize("Define"      , s:flatui_peterriver   , "NONE"    , "bold")
call Colorize("Delimiter"   , "#8F8F8F"        , "NONE"    , "bold")

" Msg {{{

call Colorize("ErrorMsg" , s:flatui_alizarin   , "#232526" , "bold")
call Colorize("ModeMsg"  , s:flatui_sunflower , "NONE"    , "none")
call Colorize("MoreMsg"  , s:flatui_sunflower , "NONE"    , "none")

" }}}

" Diff {{{

call Colorize("DiffAdd"    , "#1E0010"      , s:flatui_turquoise      , "none")
call Colorize("DiffChange" , "fg"           , s:flatui_concrete , "none")
call Colorize("DiffDelete" , "#960050"      , "#1E0010"            , "none")
call Colorize("DiffText"   , s:flatui_sunflower , s:flatui_concrete , "italic")

" }}}

call Colorize("Directory"  , s:flatui_turquoise  , "NONE"           , "bold")
call Colorize("Error"      , "#960050"        , "#1E0010"        , "NONE")
call Colorize("Exception"  , s:flatui_turquoise  , "NONE"           , "bold")
call Colorize("Float"      , s:flatui_amethyst        , "NONE"           , "none")
call Colorize("FoldColumn" , "#465457"        , "#000000"        , "none")
call Colorize("Folded"     , "#666666"        , "bg"             , "none")
call Colorize("Function"   , s:flatui_turquoise  , "NONE"           , "none")
call Colorize("Identifier" , s:flatui_turquoise , "NONE"           , "none")
call Colorize("Ignore"     , "#808080"        , "bg"             , "none")
call Colorize("IncSearch"  , "#C4BE89"        , "#000000"        , "none")
call Colorize("Keyword"    , s:flatui_alizarin   , "NONE"           , "bold")
call Colorize("Label"      , s:flatui_sunflower , "NONE"           , "none")
call Colorize("Macro"      , "#C4BE89"        , "NONE"           , "italic")
call Colorize("MatchParen" , "fg"        , s:flatui_turquoise , "none")
call Colorize("Operator"   , s:flatui_alizarin   , "NONE"           , "none")

" Completion menu {{{

call Colorize("Pmenu"      , s:flatui_sunflower   , s:solstice_brown , "none")
call Colorize("PmenuSel"   , s:flatui_turquoise , "bg"            , "none")
call Colorize("PmenuSbar"  , "NONE"           , "#080808"       , "none")
call Colorize("PmenuThumb" , s:flatui_alizarin   , "NONE"          , "none")

" }}}


" Tabs {{{

call Colorize("TabLine"     , s:flatui_concrete , s:solstice_brown , "none")
call Colorize("TabLineSel"  , "bg" , s:flatui_emerald , "bold")
call Colorize("TabLineFill" , "bg" , s:solstice_brown , "none")

" }}}


call Colorize("PreCondit" , s:flatui_turquoise      , "NONE"           , "bold")
call Colorize("PreProc"   , s:flatui_turquoise      , "NONE"           , "bold")
call Colorize("Question"  , s:flatui_sunflower , "NONE"           , "bold")
call Colorize("Repeat"    , s:flatui_alizarin , "NONE"           , "bold")
call Colorize("Search"    , "#000000"      , s:flatui_turquoise , "none")

" marks column
call Colorize("SignColumn", s:flatui_turquoise, "bg", "bold")

" Special {{{

call Colorize("SpecialKey"     , s:solstice_brown , "NONE" , "none")
call Colorize("SpecialChar"    , s:flatui_alizarin  , "NONE" , "bold")
call Colorize("SpecialComment" , "#465457"       , "NONE" , "bold")
call Colorize("Special"        , s:flatui_sunflower  , "bg"   , "italic")
call Colorize("NonText"        , "#465457"       , "NONE" , "none")

" }}}

call Colorize("Statement", s:flatui_pumpkin, "NONE", "bold")

" Statusline {{{

call Colorize("Statusline"   , "bg" , s:flatui_emerald  , "bold")
call Colorize("StatuslineNC" , s:flatui_turquoise , s:solstice_dark_brown , "bold")

" }}}

if &background == "light"
    call Colorize("Normal"       , s:flatui_clouds     , s:flatui_white , "none")
else
    call Colorize("Normal"       , s:flatui_clouds     , s:flatui_black , "none")
endif

call Colorize("StorageClass" , s:flatui_turquoise    , "NONE"          , "italic")
call Colorize("Todo"         , s:flatui_turquoise    , "bg"            , "bold")
call Colorize("Tag"          , s:flatui_alizarin      , "NONE"          , "italic")
call Colorize("Structure"    , s:flatui_sunflower      , "NONE"          , "none")
call Colorize("Title"        , "#ef5939"           , "NONE"          , "none")
call Colorize("Typedef"      , s:flatui_sunflower      , "NONE"          , "none")
call Colorize("Type"         , s:flatui_sunflower      , "NONE"          , "none")
call Colorize("Underlined"   , "#808080"           , "NONE"          , "underline")
call Colorize("VertSplit"    , "#808080"           , "bg"            , "bold")
call Colorize("VisualNOS"    , "NONE"              , "#403D3D"       , "none")
call Colorize("Visual"       , "NONE"              , "#403D3D"       , "none")
call Colorize("WarningMsg"   , "#FFFFFF"           , "#333333"       , "bold")
call Colorize("WildMenu"     , s:flatui_sunflower      , "bg"            , "none")
call Colorize("Comment"      , s:flatui_concrete      , "NONE"          , "none")
call Colorize("CursorLine"   , "NONE"              , s:solstice_dark_brown , "none")
call Colorize("CursorColumn" , "NONE"              , s:solstice_brown , "none")
call Colorize("ColorColumn"  , "NONE"              , s:solstice_brown , "none")
call Colorize("LineNr"       , s:flatui_midnightblue , "bg"            , "none")
call Colorize("CursorLineNr" , s:flatui_turquoise    , s:solstice_brown , "none")
