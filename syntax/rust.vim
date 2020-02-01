if exists("b:current_syntax")
    finish
endif

let b:current_syntax = "rust"

"
" Conditionals
"

syntax keyword rustElse else
syntax keyword rustIf if
syntax keyword rustMatch match

highlight link rustElse rustConditional
highlight link rustIf rustConditional
highlight link rustMatch rustConditional

"
" Repeat
"

syntax keyword rustFor for
syntax keyword rustLoop loop
syntax keyword rustWhile while

highlight link rustFor rustRepeat
highlight link rustLoop rustRepeat
highlight link rustWhile rustRepeat

"
" Includes
"

syntax keyword rustUse use
highlight link rustUse rustInclude

"
" Other keywords
"

syntax keyword rustAs as
syntax keyword rustAsync async
syntax keyword rustAwait await
syntax keyword rustBreak break
syntax keyword rustConst const
syntax keyword rustContinue continue
syntax keyword rustCrate crate
syntax keyword rustDyn dyn
syntax keyword rustEnum enum
syntax keyword rustExtern extern
syntax keyword rustFn fn
syntax keyword rustImpl impl
syntax keyword rustIn in
syntax keyword rustLet let
syntax keyword rustMod mod
syntax keyword rustMove move
syntax keyword rustMut mut
syntax keyword rustPub pub
syntax keyword rustRef ref
syntax keyword rustReturn return
syntax keyword rustSelfType Self
syntax keyword rustSelfValue self
syntax keyword rustStatic static
syntax keyword rustStruct struct
syntax keyword rustSuper super
syntax keyword rustTrait trait
syntax keyword rustTypeAlias type
syntax keyword rustUnsafe unsafe
syntax keyword rustWhere where

highlight link rustAs rustKeyword
highlight link rustAsync rustKeyword
highlight link rustAwait rustKeyword
highlight link rustBreak rustKeyword
highlight link rustConst rustKeyword
highlight link rustContinue rustKeyword
highlight link rustCrate rustKeyword
highlight link rustDyn rustKeyword
highlight link rustEnum rustKeyword
highlight link rustExtern rustKeyword
highlight link rustFn rustKeyword
highlight link rustImpl rustKeyword
highlight link rustIn rustKeyword
highlight link rustLet rustKeyword
highlight link rustMod rustKeyword
highlight link rustMove rustKeyword
highlight link rustMut rustKeyword
highlight link rustPub rustKeyword
highlight link rustRef rustKeyword
highlight link rustReturn rustKeyword
highlight link rustSelfType rustKeyword
highlight link rustSelfValue rustKeyword
highlight link rustStatic rustKeyword
highlight link rustStruct rustKeyword
highlight link rustSuper rustKeyword
highlight link rustTrait rustKeyword
highlight link rustTypeAlias rustKeyword
highlight link rustUnsafe rustKeyword
highlight link rustWhere rustKeyword

"
" Default linkages
"

highlight link rustConditional Conditional
highlight link rustInclude Include
highlight link rustKeyword Keyword
highlight link rustRepeat Repeat
