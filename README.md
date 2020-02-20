# vim-rust-syntax-ext

This is a Vim plugin that enhances Rust syntax highlighting. It is ideally used in conjunction with [the official plugin](https://github.com/rust-lang/rust.vim) so that you can get all the latest non-syntax-related features.

## Why would I use this plugin when the existing Rust syntax highlighting is good enough?

Here is a screenshot of some code using the official plugin, rust.vim:

![Some code using the official Rust plugin for Vim](https://raw.githubusercontent.com/arzg/resources/master/vim-rust-syntax-ext/rust.vim.png)

And here is a screenshot using vim-rust-syntax-ext:

![The same code using vim-rust-syntax-ext](https://raw.githubusercontent.com/arzg/resources/master/vim-rust-syntax-ext/vim-rust-syntax-ext.png)

## Features (some of which rust.vim also has)

*Note that features which may require colourscheme support to be differentiated from other highlight groups are marked with an asterisk.*

vim-rust-syntax-ext highlights function definitions\*:

![](https://raw.githubusercontent.com/arzg/resources/master/vim-rust-syntax-ext/FunctionDefinitions.png)

Variable definitions\* too, whether they use `let`, `let mut`, `const`, `static ref`, or are in a tuple destructure pattern:

![](https://raw.githubusercontent.com/arzg/resources/master/vim-rust-syntax-ext/IdentifierDefinitions.png)

Struct/enum/union/type alias definitions are also highlighted:

![](https://raw.githubusercontent.com/arzg/resources/master/vim-rust-syntax-ext/TypeDefinitions.png)

Now that we’re on the subject of types, look at how the type parameter definitions in this screenshot are highlighted the same way other type definitions are:

![](https://raw.githubusercontent.com/arzg/resources/master/vim-rust-syntax-ext/TypeParameters.png)

One of vim-rust-syntax-ext’s most unique features is that it differentiates\* between things from your project, things from the standard library, and things from other modules. This feature was inspired by Xcode, which does this for Swift (but by using code analysis, not regular expressions)!. *Note that the constants and function calls being highlighted the same is just a quirk of the colourscheme I’m using. The same goes for things from other modules and things from the standard library being highlighted the same – you could make them different if you wanted to do so.*

![](https://raw.githubusercontent.com/arzg/resources/master/vim-rust-syntax-ext/OriginOfThings.png)

You might worry that that would break the highlighting of enum variants such as `LocalEnum::Variant`, because vim-rust-syntax-ext would think that `Variant` is a type from a separate module. This is not the case, however:

![](https://raw.githubusercontent.com/arzg/resources/master/vim-rust-syntax-ext/OriginOfThingsEnums.png)

Another one of vim-rust-syntax-ext’s unique features is its careful highlighting of punctuation. With this colourscheme, both delimiters and operators are highlighted the same:

![](https://raw.githubusercontent.com/arzg/resources/master/vim-rust-syntax-ext/Punctuation.png)

A large number of Vim colourschemes link `Operator` to `Statement`. I have recreated this effect here, so you can tell the two apart. Note how the less than and greater than operators are highlighted as, well, operators, while when they are used to denote a type parameter they are highlighted as delimiters.

![](https://raw.githubusercontent.com/arzg/resources/master/vim-rust-syntax-ext/PunctuationOtherThemes.png)

Field accesses are highlighted as `Identifer`s (which happens to be the same as the `Function`s with this theme):

![](https://raw.githubusercontent.com/arzg/resources/master/vim-rust-syntax-ext/FieldAccess.png)

vim-rust-syntax-ext also highlights lifetimes and attributes:

![](https://raw.githubusercontent.com/arzg/resources/master/vim-rust-syntax-ext/Lifetimes.png)
![](https://raw.githubusercontent.com/arzg/resources/master/vim-rust-syntax-ext/Derive.png)
