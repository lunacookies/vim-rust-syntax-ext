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

highlight default link rustElse rustConditional
highlight default link rustIf rustConditional
highlight default link rustMatch rustConditional

"
" Repeat
"

syntax keyword rustFor for
syntax keyword rustLoop loop
syntax keyword rustWhile while

highlight default link rustFor rustRepeat
highlight default link rustLoop rustRepeat
highlight default link rustWhile rustRepeat

"
" Includes
"

syntax keyword rustUse use
highlight default link rustUse rustInclude

"
" Other keywords
"

syntax keyword rustAs as
syntax keyword rustAsync async
syntax keyword rustAwait await
syntax keyword rustBreak break
syntax keyword rustConst const nextgroup=rustIdentDef skipwhite skipempty
syntax keyword rustContinue continue
syntax keyword rustCrate crate
syntax keyword rustDyn dyn
syntax keyword rustEnum enum nextgroup=rustTypeDef skipwhite skipempty
syntax keyword rustExtern extern
syntax keyword rustFn fn nextgroup=rustFuncDef skipwhite skipempty
syntax keyword rustImpl impl
syntax keyword rustIn in
syntax keyword rustLet let nextgroup=rustIdentDef,rustMut,rustRef skipwhite skipempty
syntax keyword rustMod mod
syntax keyword rustMove move
syntax keyword rustMut mut nextgroup=rustIdentDef,rustLibraryType,rustSelfType,rustSelfValue,rustUserType skipwhite skipempty
syntax keyword rustPub pub
syntax keyword rustRef ref nextgroup=rustIdentDef,rustMut skipwhite skipempty
syntax keyword rustReturn return
syntax keyword rustSelfType Self
syntax keyword rustSelfValue self
syntax keyword rustStatic static nextgroup=rustIdentDef,rustRef skipwhite skipempty
syntax keyword rustStruct struct nextgroup=rustTypeDef skipwhite skipempty
syntax keyword rustSuper super
syntax keyword rustTrait trait nextgroup=rustTypeDef skipwhite skipempty
syntax keyword rustTypeAlias type nextgroup=rustTypeDef skipwhite skipempty
syntax keyword rustUnsafe unsafe
syntax keyword rustWhere where

highlight default link rustAs rustKeyword
highlight default link rustAsync rustKeyword
highlight default link rustAwait rustKeyword
highlight default link rustBreak rustKeyword
highlight default link rustConst rustKeyword
highlight default link rustContinue rustKeyword
highlight default link rustCrate rustKeyword
highlight default link rustDyn rustKeyword
highlight default link rustEnum rustKeyword
highlight default link rustExtern rustKeyword
highlight default link rustFn rustKeyword
highlight default link rustImpl rustKeyword
highlight default link rustIn rustKeyword
highlight default link rustLet rustKeyword
highlight default link rustMod rustKeyword
highlight default link rustMove rustKeyword
highlight default link rustMut rustKeyword
highlight default link rustPub rustKeyword
highlight default link rustRef rustKeyword
highlight default link rustReturn rustKeyword
highlight default link rustSelfType rustKeyword
highlight default link rustSelfValue rustKeyword
highlight default link rustStatic rustKeyword
highlight default link rustStruct rustKeyword
highlight default link rustSuper rustKeyword
highlight default link rustTrait rustKeyword
highlight default link rustTypeAlias rustKeyword
highlight default link rustUnsafe rustKeyword
highlight default link rustWhere rustKeyword

"
" Strings
"

syntax region rustString start='"' end='"'

"
" User-defined types
"

syntax match rustUserType '\v<[A-Z][A-Za-z0-9]*'

"
" Standard library types
"

let s:standardLibraryTypes = ["bool", "char", "f32", "f64", "i128", "i16", "i32", "i64", "i8", "isize", "str", "u128", "u16", "u32", "u64", "u8", "usize", "AccessError", "Add", "AddAssign", "AddrParseError", "Alignment", "Alloc", "AllocErr", "Ancestors", "Any", "Arc", "Args", "ArgsOs", "Arguments", "AsMut", "AsRawFd", "AsRawHandle", "AsRawSocket", "AsRef", "AsciiExt", "AssertUnwindSafe", "AtomicBool", "AtomicI16", "AtomicI32", "AtomicI64", "AtomicI8", "AtomicIsize", "AtomicPtr", "AtomicU16", "AtomicU32", "AtomicU64", "AtomicU8", "AtomicUsize", "BTreeMap", "BTreeSet", "Backtrace", "BacktraceStatus", "Barrier", "BarrierWaitResult", "Binary", "BinaryHeap", "BitAnd", "BitAndAssign", "BitOr", "BitOrAssign", "BitXor", "BitXorAssign", "Borrow", "BorrowError", "BorrowMut", "BorrowMutError", "Bound", "Box", "BufRead", "BufReader", "BufWriter", "BuildHasher", "BuildHasherDefault", "Builder", "Bytes", "CStr", "CString", "CannotReallocInPlace", "Cell", "Chain", "CharIndices", "CharPredicateSearcher", "CharSearcher", "CharSliceSearcher", "CharTryFromError", "Chars", "Child", "ChildStderr", "ChildStdin", "ChildStdout", "Chunks", "ChunksExact", "ChunksExactMut", "ChunksMut", "Clone", "Cloned", "CoerceUnsized", "Command", "CommandExt", "Component", "Components", "Concat", "Condvar", "Context", "Copied", "Copy", "Cow", "Cursor", "Cycle", "Debug", "DebugList", "DebugMap", "DebugSet", "DebugStruct", "DebugTuple", "DecodeUtf16", "DecodeUtf16Error", "Default", "DefaultHasher", "Deref", "DerefMut", "Difference", "DirBuilder", "DirBuilderExt", "DirEntry", "DirEntryExt", "Discriminant", "DispatchFromDyn", "Display", "Div", "DivAssign", "DoubleEndedIterator", "DoubleEndedSearcher", "Drain", "DrainFilter", "DrainSorted", "Drop", "Duration", "Empty", "EncodeUtf16", "EncodeWide", "Entry", "Enumerate", "Eq", "Error", "ErrorKind", "EscapeDebug", "EscapeDefault", "EscapeUnicode", "ExactSizeIterator", "Excess", "ExitCode", "ExitStatus", "ExitStatusExt", "Extend", "File", "FileExt", "FileType", "FileTypeExt", "Filter", "FilterMap", "FixedSizeArray", "FlatMap", "Flatten", "FloatToInt", "Fn", "FnMut", "FnOnce", "Formatter", "FpCategory", "From", "FromBytesWithNulError", "FromFn", "FromIterator", "FromRawFd", "FromRawHandle", "FromRawSocket", "FromStr", "FromUtf16Error", "FromUtf8Error", "Fuse", "FusedIterator", "Future", "Generator", "GeneratorState", "Global", "GlobalAlloc", "Hash", "HashMap", "HashSet", "Hasher", "Incoming", "Index", "IndexMut", "Infallible", "Initializer", "Inspect", "Instant", "IntErrorKind", "Intersection", "Into", "IntoInnerError", "IntoIter", "IntoIterSorted", "IntoIterator", "IntoRawFd", "IntoRawHandle", "IntoRawSocket", "IntoStringError", "IoSlice", "IoSliceMut", "IpAddr", "Ipv4Addr", "Ipv6Addr", "Ipv6MulticastScope", "Iter", "IterMut", "Iterator", "Join", "JoinHandle", "JoinHandleExt", "JoinPathsError", "Keys", "Layout", "LayoutErr", "LengthAtMost32", "LineWriter", "Lines", "LinesAny", "LinkedList", "LocalKey", "Location", "LowerExp", "LowerHex", "ManuallyDrop", "Map", "MatchIndices", "Matches", "MaybeUninit", "Metadata", "MetadataExt", "Mul", "MulAssign", "Mutex", "MutexGuard", "Neg", "NonNull", "NonZeroI128", "NonZeroI16", "NonZeroI32", "NonZeroI64", "NonZeroI8", "NonZeroIsize", "NonZeroU128", "NonZeroU16", "NonZeroU32", "NonZeroU64", "NonZeroU8", "NonZeroUsize", "NoneError", "Not", "NulError", "OccupiedEntry", "Octal", "Once", "OnceState", "OnceWith", "OpenOptions", "OpenOptionsExt", "Option", "Ord", "Ordering", "OsStr", "OsStrExt", "OsString", "OsStringExt", "Output", "PanicInfo", "ParseBoolError", "ParseCharError", "ParseFloatError", "ParseIntError", "PartialEq", "PartialOrd", "Path", "PathBuf", "Pattern", "PeekMut", "Peekable", "Permissions", "PermissionsExt", "PhantomData", "PhantomPinned", "Pin", "Pointer", "PoisonError", "Poll", "Prefix", "PrefixComponent", "Product", "RChunks", "RChunksExact", "RChunksExactMut", "RChunksMut", "RMatchIndices", "RMatches", "RSplit", "RSplitMut", "RSplitN", "RSplitNMut", "RSplitTerminator", "RandomState", "Range", "RangeBounds", "RangeFrom", "RangeFull", "RangeInclusive", "RangeMut", "RangeTo", "RangeToInclusive", "RawEntryBuilder", "RawEntryBuilderMut", "RawEntryMut", "RawOccupiedEntryMut", "RawVacantEntryMut", "RawWaker", "RawWakerVTable", "Rc", "Read", "ReadDir", "Receiver", "RecvError", "RecvTimeoutError", "Ref", "RefCell", "RefMut", "RefUnwindSafe", "Rem", "RemAssign", "Repeat", "RepeatWith", "Result", "Rev", "Reverse", "ReverseSearcher", "RwLock", "RwLockReadGuard", "RwLockWriteGuard", "Scan", "SearchStep", "Searcher", "Seek", "SeekFrom", "Send", "SendError", "Sender", "Shl", "ShlAssign", "Shr", "ShrAssign", "Shutdown", "Sink", "SipHasher", "Sized", "Skip", "SkipWhile", "SliceIndex", "SocketAddr", "SocketAddrV4", "SocketAddrV6", "Splice", "Split", "SplitAsciiWhitespace", "SplitMut", "SplitN", "SplitNMut", "SplitPaths", "SplitTerminator", "SplitWhitespace", "Stderr", "StderrLock", "Stdin", "StdinLock", "Stdio", "Stdout", "StdoutLock", "Step", "StepBy", "StrSearcher", "String", "StripPrefixError", "StructuralEq", "StructuralPartialEq", "Sub", "SubAssign", "Successors", "Sum", "SymmetricDifference", "Sync", "SyncSender", "System", "SystemTime", "SystemTimeError", "Take", "TakeWhile", "TcpListener", "TcpStream", "Termination", "Thread", "ThreadId", "ToLowercase", "ToOwned", "ToSocketAddrs", "ToString", "ToUppercase", "TraitObject", "TrustedLen", "Try", "TryFrom", "TryFromIntError", "TryFromSliceError", "TryInto", "TryIter", "TryLockError", "TryRecvError", "TryReserveError", "TrySendError", "TypeId", "UdpSocket", "UnicodeVersion", "Union", "UnixDatagram", "UnixListener", "UnixStream", "Unpin", "UnsafeCell", "Unsize", "UnwindSafe", "UpperExp", "UpperHex", "Utf8Error", "VaList", "VaListImpl", "VacantEntry", "Values", "ValuesMut", "VarError", "Vars", "VarsOs", "Vec", "VecDeque", "WaitTimeoutResult", "Waker", "Weak", "Windows", "Wrapping", "Write", "Zip"]

for s:standardLibraryType in s:standardLibraryTypes
    execute 'syntax keyword rustLibraryType ' . s:standardLibraryType
endfor

"
" User-defined constants
"

syntax match rustUserConst '\v<[A-Z][A-Z0-9_]'

"
" Standard library constants
"

let s:standardLibraryConsts = ["ARCH", "ATOMIC_BOOL_INIT", "ATOMIC_I16_INIT", "ATOMIC_I32_INIT", "ATOMIC_I64_INIT", "ATOMIC_I8_INIT", "ATOMIC_ISIZE_INIT", "ATOMIC_U16_INIT", "ATOMIC_U32_INIT", "ATOMIC_U64_INIT", "ATOMIC_U8_INIT", "ATOMIC_USIZE_INIT", "DIGITS", "DLL_EXTENSION", "DLL_PREFIX", "DLL_SUFFIX", "EPSILON", "EXE_EXTENSION", "EXE_SUFFIX", "FAMILY", "FRAC_1_PI", "FRAC_1_SQRT_2", "FRAC_2_PI", "FRAC_2_SQRT_PI", "FRAC_PI_2", "FRAC_PI_3", "FRAC_PI_4", "FRAC_PI_6", "FRAC_PI_8", "INFINITY", "LN_10", "LN_2", "LOG10_2", "LOG10_E", "LOG2_10", "LOG2_E", "MAIN_SEPARATOR", "MANTISSA_DIGITS", "MAX", "MAX_10_EXP", "MAX_EXP", "MIN", "MIN_10_EXP", "MIN_EXP", "MIN_POSITIVE", "NAN", "NEG_INFINITY", "ONCE_INIT", "OS", "PI", "RADIX", "REPLACEMENT_CHARACTER", "SQRT_2", "TAU", "UNICODE_VERSION", "UNIX_EPOCH"]

for s:standardLibraryConst in s:standardLibraryConsts
    execute 'syntax keyword rustLibraryConst ' . s:standardLibraryConst
endfor

"
" Functions
"

syntax match rustFunction '\v[a-z][a-z0-9_]*(\()@='

"
" Type definitions
"

syntax match rustTypeDef '\v[A-Z][A-Za-z0-9]*' contained display

"
" Function definitions
"

syntax match rustFuncDef '\v<[a-z][a-z0-9_]*(\()@=' contained display

"
" Identifier definitions
"

syntax match rustIdentDef '\v[a-z][a-z0-9_]*' contained display
syntax match rustIdentDef '\v[A-Z][A-Z0-9_]*' contained display

"
" Comments
"

syntax region rustComment start='//' end='$'
syntax region rustDocComment start='///' end='$'
syntax region rustDocComment start='//!' end='$'

syntax match rustCommentNote '\v[A-Z]+(:)@=' containedin=rustComment,rustDocComment

"
" Numbers
"

syntax match rustNumber '\v<[0-9_]+>'
syntax match rustFloat '\v<[0-9_]+\.[0-9_]+>'

"
" Operators
"

let operators = ['+', '-', '\*', '/', '%', '\^', '!', '&', '|', '&&', '||', '<<', '>>', '+=', '-=', '\*=', '/=', '%=', '\^=', '&=', '|=', '<<=', '>>=', '=', '==', '!=', '>', '<', '>=', '<=', '@', '\.\.', '\.\.\.', '\.\.=', '->', '=>', '#', '?']

for operator in operators
    execute 'syntax match rustOperator "\S\@<!' . operator . '\S\@!"'
endfor

"
" Delimiters
"

syntax match rustDelimiter '[(){}\[\]<>,:;]\+'

"
" Default linkages
"

highlight default link rustComment Comment
highlight default link rustCommentNote Todo
highlight default link rustConditional Conditional
highlight default link rustDelimiter Delimiter
highlight default link rustDocComment SpecialComment
highlight default link rustFloat Float
highlight default link rustFuncDef Function
highlight default link rustFunction Function
highlight default link rustIdentDef Identifier
highlight default link rustInclude Include
highlight default link rustKeyword Keyword
highlight default link rustLibraryConst Constant
highlight default link rustLibraryType Type
highlight default link rustNumber Number
highlight default link rustOperator Operator
highlight default link rustRepeat Repeat
highlight default link rustString String
highlight default link rustTypeDef Typedef
highlight default link rustUserConst Constant
highlight default link rustUserType Type
