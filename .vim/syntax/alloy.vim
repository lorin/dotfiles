" VIM syntax file
" Language: alloy
" Maintainer: Lorin Hochstein
"
if exists("b:current_synax")
    finish
endif
" Keywords
syn keyword alloyQuantifier one lone no some all
syn keyword alloyLogic not and or implies else iff
syn keyword alloySigs sig abstract set
syn keyword alloyCommands pred fact assert check fun
syn keyword alloyImports open as
syn keyword alloyOtherKeywords for but in let
syn region alloyBlock start="{" end="}" fold transparent
syn region alloyComment start="/\*"  end="\*/"
syn region alloyOneLineComment oneline start="//" end=/$/
" Syntax highlighting
let b:current_syntax = "alloy"

hi def link alloyQuantifier Keyword
hi def link alloyLogic Keyword
hi def link alloyOtherKeywords Keyword
hi def link alloySigs Type
hi def link alloyCommands Statement
hi def link alloyComment Comment
hi def link alloyOneLineComment Comment


