"""
"
" Name:       hos.vim
" Version:    0.1.0
" Maintainer: github.com/hossein-lap
" License:    The 3-clause BSD License (New BSD License)
"
" A minimal gray-scale colorscheme for Vim.
"
"""
hi clear

if exists('syntax on')
    syntax reset
endif

let g:colors_name='hos'

" Toggle bold, italics, underline
let g:fontfaces = 0

if g:fontfaces == 1
    let s:thebold = 'bold'
    let s:theitalic = 'italic'
    let s:theurl = 'underline'
else
    let s:thebold = 'none'
    let s:theitalic = 'none'
    let s:theurl = 'none'
endif

let s:actual          = { "gui": "NONE",    "cterm": "NONE" }
let s:comment         = { "gui": "#585858", "cterm": "240"  }
let s:constant        = { "gui": "#d0d0d0", "cterm": "252"  }
let s:error           = { "gui": "#870000", "cterm": "252"  }
let s:errormsg        = { "gui": "#af0000", "cterm": "252"  }
let s:keyword         = { "gui": "#eeeeee", "cterm": "255"  }
let s:special         = { "gui": "#4e4e4e", "cterm": "237"  }
let s:normal          = { "gui": "#bcbcbc", "cterm": "250"  }
let s:number          = { "gui": "#ff0000", "cterm": "196"  }
let s:search          = { "gui": "#8a8a8a", "cterm": "245"  }
let s:sign            = { "gui": "#121212", "cterm": "233"  }
let s:status          = { "gui": "#303030", "cterm": "236"  }
let s:line            = { "gui": "#cccccc", "cterm": "255"  }
let s:unfoc           = { "gui": "#767676", "cterm": "243"  }
let s:pmenu           = { "gui": "#080808", "cterm": "232"  }
let s:string          = { "gui": "#8a8a8a", "cterm": "245"  }
let s:visual          = { "gui": "#bcbcbc", "cterm": "250"  }

" https://github.com/noahfrederick/vim-hemisu/
function! s:h(group, style)
    execute "highlight" a:group
        \ "guifg="   (has_key(a:style, "fg")    ? a:style.fg.gui   : "NONE")
        \ "guibg="   (has_key(a:style, "bg")    ? a:style.bg.gui   : "NONE")
        \ "guisp="   (has_key(a:style, "sp")    ? a:style.sp.gui   : "NONE")
        \ "gui="     (has_key(a:style, "gui")   ? a:style.gui      : "NONE")
        \ "ctermfg=" (has_key(a:style, "fg")    ? a:style.fg.cterm : "NONE")
        \ "ctermbg=" (has_key(a:style, "bg")    ? a:style.bg.cterm : "NONE")
        \ "cterm="   (has_key(a:style, "cterm") ? a:style.cterm    : "NONE")
endfunction

call s:h("Cursor",  {"bg": s:sign, "fg": s:actual })
hi! link GitGutterChangeDelete  Cursor

call s:h("Number",  {"fg": s:number})

call s:h("Comment",        {"fg": s:comment, "gui": s:theitalic, "cterm": s:theitalic})
hi! link NonText           Comment
hi! link VertSplit         Comment
hi! link netrwDir          Comment
hi! link netrwTreeBar      Comment
hi! link DiffDelete        Comment
hi! link GitGutterDelete   Comment
hi! link SignifySignDelete Comment
hi! link diffRemoved       Comment
hi! link LineNr            Comment

call s:h("String",         {"fg": s:string})
hi! link StatusLineNr      String
hi! link SpecialComment    String
hi! link netrwDoc          String
hi! link netrwBak          String
hi! link netrwHdr          String
hi! link netrwObj          String
hi! link netrwMakefile     String
hi! link DiffChange        String
hi! link GitGutterChange   String
hi! link SignifySignChange String
hi! link CursorLineNr      String

call s:h("Constant", {"fg": s:number})
hi! link Character   Constant
hi! link Float       Constant

call s:h("Normal",     {"fg": s:normal})
hi! link Boolean       Normal
hi! link Debug         Normal
hi! link Identifier    Normal
hi! link Title         Normal
hi! link Delimiter     Normal
hi! link Exception     Normal
hi! link FoldColumn    Normal
hi! link Macro         Normal
hi! link ModeMsg       Normal
hi! link MoreMsg       Normal
hi! link Question      Normal
hi! link netrwCompress Normal
hi! link netrwPix      Normal
hi! link netrwPlain    Normal
hi! link netrwSymLink  Normal

call s:h("Statement",   {"fg": s:keyword})
hi! link Conditonal     Statement
hi! link Function       Statement
hi! link Keyword        Statement
hi! link Label          Statement
hi! link Repeat         Statement
hi! link Define         Statement
hi! link Directory      Statement
hi! link Include        Statement
hi! link Operator       Statement
hi! link PreCondit      Statement
hi! link PreProc        Statement
hi! link Special        Statement
hi! link SpecialChar    Statement
hi! link StorageClass   Statement
hi! link StorageClass   Statement 
hi! link Structure      Statement
hi! link Typedef        Statement
hi! link Todo           Statement
hi! link DiffAdd        Statement
hi! link GitGutterAdd   Statement
hi! link SignifySignAdd Statement
hi! link netrwExe       Statement

call s:h("Visual",     {"fg": s:status, "bg": s:visual})
hi! link PmenuNOS      Visual
hi! link PmenuSel      Visual
hi! link PmenuSbar     Visual
hi! link DiffText      Visual

call s:h("Underlined",   {"fg": s:normal, "gui": s:theurl, "cterm": s:theurl})
call s:h("Ignore",       {"fg": s:actual})
call s:h("Error",        {"fg": s:keyword, "bg": s:error, "cterm": s:thebold})
call s:h("ErrorMsg",     {"fg": s:keyword, "bg": s:errormsg, "cterm": s:thebold})
call s:h("SpecialKey",   {"fg": s:special})
call s:h("IncSearch",    {"bg": s:status, "fg": s:search})
call s:h("Search",       {"bg": s:search, "fg": s:keyword})
call s:h("StatusLine",   {"bg": s:line, "fg": s:sign})
call s:h("StatusLineNC", {"bg": s:sign, "fg": s:unfoc})
call s:h("WarningMsg",   {"fg": s:number})
call s:h("WildMenu",     {"fg": s:comment, "bg": s:keyword})
call s:h("Folded",       {"fg": s:errormsg})
call s:h("SignColumn",   {"fg": s:errormsg, "bg": s:actual})
call s:h("SpellBad",     {"fg": s:keyword,  "bg": s:error,    "gui": s:theurl})
call s:h("SpellCap",     {"fg": s:keyword,  "bg": s:errormsg, "gui": s:theurl})
call s:h("SpellRare",    {"fg": s:errormsg, "bg": s:actual,   "gui": s:theurl})
call s:h("SpellLocal",   {"fg": s:keyword,  "bg": s:errormsg, "gui": s:theurl})
call s:h("Pmenu",        {"fg": s:keyword, "bg": s:comment})
call s:h("PmenuThumb",   {"fg": s:pmenu,   "bg": s:comment})
call s:h("TabLine",      {"fg": s:normal,  "bg": s:sign})
call s:h("TabLineSel",   {"fg": s:line,    "bg": s:status, "gui": s:thebold, "cterm": s:thebold})
call s:h("TabLineFill",  {"fg": s:normal,  "bg": s:sign})
call s:h("CursorColumn", {"bg": s:error})
call s:h("CursorLine",   {"bg": s:sign,   "fg": s:actual})
call s:h("MatchParen",   {"bg": s:string, "fg": s:normal})
call s:h("qfLineNr",     {"fg": s:unfoc})

call s:h("Header", {"bg": s:actual, "fg": s:normal})
hi! link htmlH1 Header
hi! link htmlH2 Header
hi! link htmlH3 Header
hi! link htmlH4 Header
hi! link htmlH5 Header
hi! link htmlH6 Header

" Syntastic
call s:h("SyntasticWarningSign", {"fg": s:errormsg})
hi! link NeomakeWarningSign       SyntasticWarningSign
hi! link ALEWarningSign           SyntasticWarningSign

call s:h("SyntasticWarning",    {"bg": s:errormsg, "fg": s:actual, "gui": s:thebold, "cterm": s:thebold})
call s:h("SyntasticErrorSign",  {"fg": s:error})
hi! link NeomakeErrorSign        SyntasticErrorSign
hi! link ALEErrorSign            SyntasticErrorSign

call s:h("SyntasticError",       {"bg": s:error, "fg": s:normal, "gui": s:thebold, "cterm": s:thebold})

" which-key.nvim
call s:h("WhichKey",  {"bg": s:actual, "fg": s:visual, "gui": s:thebold, "cterm": s:thebold})
hi! link WhichKeyGroup WhichKey

call s:h("WhichKeyDesc",      {"bg": s:actual, "fg": s:unfoc,  "gui": s:thebold, "cterm": s:thebold})
call s:h("WhichKeySeparator", {"bg": s:actual, "fg": s:normal, "gui": s:thebold, "cterm": s:thebold})
call s:h("WhichKeyFloat",     {"bg": s:actual})

