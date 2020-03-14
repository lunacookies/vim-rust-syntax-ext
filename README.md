# vim-rust-syntax-ext

This is a Vim plugin that enhances Rust syntax highlighting – it does nothing else. This means that it is ideally used in conjunction with [the official plugin](https://github.com/rust-lang/rust.vim), so that you can get all the latest non-syntax-related features.

## Installation

If you don’t have a plugin manager of choice I recommend [vim-plug](https://github.com/junegunn/vim-plug):

```viml
Plug 'arzg/vim-rust-syntax-ext'
```

## Why would I use this plugin when the existing Rust syntax highlighting is good enough?

Here is a screenshot of some code using the official plugin, rust.vim:

![Some code using the official Rust plugin for Vim](https://raw.githubusercontent.com/arzg/resources/master/vim-rust-syntax-ext/rust.vim.png)

And here is a screenshot using vim-rust-syntax-ext:

![The same code using vim-rust-syntax-ext](https://raw.githubusercontent.com/arzg/resources/master/vim-rust-syntax-ext/vim-rust-syntax-ext.png)

## Features (some of which rust.vim also has)

*Sorry for the bad/incorrect/inconsistent code in the following screenshots. After a while you start to run out of fake code ideas …*

*Note that features which may require colourscheme support to be differentiated from other highlight groups are marked with an asterisk.*

vim-rust-syntax-ext highlights function definitions\*:

![](https://raw.githubusercontent.com/arzg/resources/master/vim-rust-syntax-ext/FunctionDefinitions.png)

Variable definitions\* too, whether they use `let`, `let mut`, `const`, `static ref`, or are in a tuple destructure pattern:

![](https://raw.githubusercontent.com/arzg/resources/master/vim-rust-syntax-ext/IdentifierDefinitions.png)

Struct/enum/union/type alias definitions are also highlighted:

![](https://raw.githubusercontent.com/arzg/resources/master/vim-rust-syntax-ext/TypeDefinitions.png)

Now that we’re on the subject of types, look at how the type parameter definitions in this screenshot are highlighted the same way other type definitions are:

![](https://raw.githubusercontent.com/arzg/resources/master/vim-rust-syntax-ext/TypeParameters.png)

One of vim-rust-syntax-ext’s most unique features is that it differentiates\* between things from your project, things from the standard library, and things from other modules. This feature was inspired by Xcode, which does this for Swift (but by using code analysis, not regular expressions!). *Note that the constants and function calls being highlighted the same is just a quirk of the colourscheme I’m using. The same goes for things from other modules and things from the standard library being highlighted the same – you could make them different if you wanted to do so.*

![](https://raw.githubusercontent.com/arzg/resources/master/vim-rust-syntax-ext/OriginOfThings.png)

vim-rust-syntax-ext makes sure that items from the current crate are still highlighted as local items:

![](https://raw.githubusercontent.com/arzg/resources/master/vim-rust-syntax-ext/OriginOfThingsCrate.png)

You might worry that this would break the highlighting of enum variants such as `LocalEnum::Variant`, because vim-rust-syntax-ext would think that `Variant` is a type from a separate module. This is not the case, however:

![](https://raw.githubusercontent.com/arzg/resources/master/vim-rust-syntax-ext/OriginOfThingsEnums.png)

Another one of vim-rust-syntax-ext’s unique features is its careful highlighting of punctuation. With my colourscheme, both delimiters and operators are highlighted the same:

![](https://raw.githubusercontent.com/arzg/resources/master/vim-rust-syntax-ext/Punctuation.png)

To help you tell the two apart I have linked `Operator` to `Statement` in the next screenshot, which is also a common practice of many Vim colourschemes. Note how the less than and greater than operators are highlighted as, well, operators, while when they are used to denote a type parameter they are highlighted as delimiters.

![](https://raw.githubusercontent.com/arzg/resources/master/vim-rust-syntax-ext/PunctuationOtherThemes.png)

Lifetimes have been paid careful attention in vim-rust-syntax-ext. This screenshot shows that lifetimes are highlighted with a similar logic to variables:\* ‘special’ lifetimes like `'static` and `'_` are highlighted as library constants,\* lifetime definitions are highlighted like variable definitions\* (look at `enum Token<'a>`), and lifetime usages are highlighted the same way user variable usages are highlighted.\*

![](https://raw.githubusercontent.com/arzg/resources/master/vim-rust-syntax-ext/Lifetimes.png)

Field accesses are highlighted as `Identifer`s:

![](https://raw.githubusercontent.com/arzg/resources/master/vim-rust-syntax-ext/FieldAccess.png)

vim-rust-syntax-ext also highlights attributes:

![](https://raw.githubusercontent.com/arzg/resources/master/vim-rust-syntax-ext/Derive.png)

## Note for colourscheme authors

I have made sure that it is as easy as possible to take advantage of vim-rust-syntax-ext’s highlighting as a colourscheme designer, by using `highlight default link` instead of `highlight link` so that you can override any links this plugin makes. Additionally, as much as possible, every single syntactical element has its own highlight group so that you can be as granular as you want with your adjustments. To give you an idea of what I mean, the `let` keyword (`rsLet`) and macros that come with the standard library (`rsLibraryMacro`) both get their own highlight groups. I didn’t want to make any assumptions, however, so I have linked all of vim-rust-syntax-ext’s highlight groups to the standard ones found in `:help group-name`. This means, for example, that `rsLibraryMacro` and `rsUserMacro` are not differentiated by default.

Here are some of the more important links you may want to customise:

- `rs{User,Crate,Foreign,Library}{Type,Func,Macro,Ident}`: The `Library` set of highlight groups is for items from the standard library; the `Foreign` set of groups is for items from another module; `Crate`, which by default links to the `User` groups, is for items accessed by `crate::`; and `User` is essentially for everything else. By default the `Crate` highlight groups link to the `User` highlight groups. In case I haven’t explained well, some examples of these highlight groups include `rsUserType`, `rsLibraryFunc`, and so on.
- `rs{Type,Func,Ident,Lifetime}Def`: These highlight groups are used for definitions of various syntactical items. Note that `rsTypeDef` is linked by default to `Typedef`, which may not fit with your colourscheme.
- `rs{User,Special}Lifetime`: With ‘special’ lifetimes I really mean `'static` and `'_` – all other lifetimes get `rsUserLifetime`.
- `rsAttribute`: This is applied to `#[attributes]`, including `#[derive(...)]` for example. Arguably this should link to `Macro` (since attributes are usually defined with procedural macros), but I personally find it nicer when `rsAttribute` is highlighted as a keyword.

## Todo

- `r# ... #` syntax
- Format string parameters, e.g. `"{}"`, `"{:?}"`, `"{:#?}"`, `"{named}"`
- Markdown and code in doc comments

## Colophon

All screenshots use [xcodedark](https://github.com/arzg/vim-colors-xcode) (which takes advantage of the aforementioned highlight groups) with the SF Mono font in the Medium weight, with iTerm configured to use the Bold weight for bold text (rather than Heavy).
