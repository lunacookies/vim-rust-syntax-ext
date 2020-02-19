if exists("b:current_syntax")
    finish
endif

let b:current_syntax = "rust"

syntax region rustTypeParams matchgroup=rustDelimiter start='<' end='>' keepend contains=TOP

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
syntax keyword rustLet let nextgroup=rustIdentDef,rustMut,rustRef,rustPattern skipwhite skipempty
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
syntax keyword rustUnderscore _
syntax keyword rustUnion union nextgroup=rustTypeDef skipwhite skipempty
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
highlight default link rustUnderscore rustKeyword
highlight default link rustUnion rustKeyword
highlight default link rustUnsafe rustKeyword
highlight default link rustWhere rustKeyword

"
" Strings
"

syntax region rustString start='b\?"' skip='\\"' end='"'

"
" Lifetimes
"

syntax match rustLifetime "'_" " Inferred
syntax match rustLifetime "'static" " Static
syntax match rustLifetime "'[a-z][a-z0-9_]*"

"
" Characters
"

syntax match rustCharacter "'.'"

"
" User-defined types
"

syntax match rustUserType '\v<[A-Z][A-Za-z0-9]*' nextgroup=rustTypeParams

"
" Standard library types
"

let s:standardLibraryTypes = ["AccessError", "AcqRel", "Acquire", "Add", "AddAssign", "AddrInUse", "AddrNotAvailable", "AddrParseError", "AdminLocal", "Alignment", "Alloc", "AllocErr", "AllocError", "AlreadyExists", "Ancestors", "Any", "Arc", "Args", "ArgsOs", "Arguments", "AsMut", "AsRawFd", "AsRawHandle", "AsRawSocket", "AsRef", "AsciiExt", "AssertUnwindSafe", "AtomicBool", "AtomicI16", "AtomicI32", "AtomicI64", "AtomicI8", "AtomicIsize", "AtomicPtr", "AtomicU16", "AtomicU32", "AtomicU64", "AtomicU8", "AtomicUsize", "BTreeMap", "BTreeSet", "Backtrace", "BacktraceStatus", "Barrier", "BarrierWaitResult", "Binary", "BinaryHeap", "BitAnd", "BitAndAssign", "BitOr", "BitOrAssign", "BitXor", "BitXorAssign", "Borrow", "BorrowError", "BorrowMut", "BorrowMutError", "Borrowed", "Both", "Bound", "Box", "BrokenPipe", "BufRead", "BufReader", "BufWriter", "BuildHasher", "BuildHasherDefault", "Builder", "Bytes", "CStr", "CString", "CannotReallocInPlace", "CapacityOverflow", "Captured", "Cell", "Center", "Chain", "CharIndices", "CharPredicateSearcher", "CharSearcher", "CharSliceSearcher", "CharTryFromError", "Chars", "Child", "ChildStderr", "ChildStdin", "ChildStdout", "Chunks", "ChunksExact", "ChunksExactMut", "ChunksMut", "Clone", "Cloned", "CoerceUnsized", "Command", "CommandExt", "Complete", "Component", "Components", "Concat", "Condvar", "ConnectionAborted", "ConnectionRefused", "ConnectionReset", "Context", "Copied", "Copy", "Cow", "CurDir", "Current", "Cursor", "Cycle", "Debug", "DebugList", "DebugMap", "DebugSet", "DebugStruct", "DebugTuple", "DecodeUtf16", "DecodeUtf16Error", "Default", "DefaultHasher", "Deref", "DerefMut", "DeviceNS", "Difference", "DirBuilder", "DirBuilderExt", "DirEntry", "DirEntryExt", "Disabled", "Disconnected", "Discriminant", "Disk", "DispatchFromDyn", "Display", "Div", "DivAssign", "Done", "DoubleEndedIterator", "DoubleEndedSearcher", "Drain", "DrainFilter", "DrainSorted", "Drop", "Duration", "Empty", "EncodeUtf16", "EncodeWide", "End", "Entry", "Enumerate", "Eq", "Equal", "Err", "Error", "ErrorKind", "EscapeDebug", "EscapeDefault", "EscapeUnicode", "ExactSizeIterator", "Excess", "Excluded", "ExitCode", "ExitStatus", "ExitStatusExt", "Extend", "File", "FileExt", "FileType", "FileTypeExt", "Filter", "FilterMap", "FixedSizeArray", "FlatMap", "Flatten", "FloatToInt", "Fn", "FnMut", "FnOnce", "Formatter", "FpCategory", "From", "FromBytesWithNulError", "FromFn", "FromIterator", "FromRawFd", "FromRawHandle", "FromRawSocket", "FromStr", "FromUtf16Error", "FromUtf8Error", "Full", "Fuse", "FusedIterator", "Future", "Generator", "GeneratorState", "Global", "GlobalAlloc", "Greater", "HANDLE", "Hash", "HashMap", "HashSet", "Hasher", "Included", "Incoming", "Index", "IndexMut", "Infallible", "Infinite", "Initializer", "Inspect", "Instant", "IntErrorKind", "InterfaceLocal", "Interrupted", "Intersection", "Into", "IntoInnerError", "IntoIter", "IntoIterSorted", "IntoIterator", "IntoRawFd", "IntoRawHandle", "IntoRawSocket", "IntoStringError", "InvalidData", "InvalidDigit", "InvalidInput", "IoSlice", "IoSliceMut", "IpAddr", "Ipv4Addr", "Ipv6Addr", "Ipv6MulticastScope", "Iter", "IterMut", "Iterator", "Join", "JoinHandle", "JoinHandleExt", "JoinPathsError", "Keys", "Layout", "LayoutErr", "Left", "LengthAtMost32", "Less", "LineWriter", "Lines", "LinesAny", "LinkLocal", "LinkedList", "LocalKey", "Location", "LockResult", "LowerExp", "LowerHex", "ManuallyDrop", "Map", "Match", "MatchIndices", "Matches", "MaybeUninit", "Metadata", "MetadataExt", "Mul", "MulAssign", "Mutex", "MutexGuard", "Nan", "Neg", "NonNull", "NonZeroI128", "NonZeroI16", "NonZeroI32", "NonZeroI64", "NonZeroI8", "NonZeroIsize", "NonZeroU128", "NonZeroU16", "NonZeroU32", "NonZeroU64", "NonZeroU8", "NonZeroUsize", "None", "NoneError", "Normal", "Not", "NotConnected", "NotFound", "NotPresent", "NotUnicode", "NulError", "Occupied", "OccupiedEntry", "Octal", "Ok", "Once", "OnceState", "OnceWith", "OpenOptions", "OpenOptionsExt", "Option", "Ord", "Ordering", "OrganizationLocal", "OsStr", "OsStrExt", "OsString", "OsStringExt", "Other", "Output", "Overflow", "Owned", "PanicInfo", "ParentDir", "ParseBoolError", "ParseCharError", "ParseError", "ParseFloatError", "ParseIntError", "PartialEq", "PartialOrd", "Path", "PathBuf", "Pattern", "PeekMut", "Peekable", "Pending", "PermissionDenied", "Permissions", "PermissionsExt", "PhantomData", "PhantomPinned", "Pin", "Pointer", "PoisonError", "Poisoned", "Poll", "Prefix", "PrefixComponent", "Product", "RChunks", "RChunksExact", "RChunksExactMut", "RChunksMut", "RMatchIndices", "RMatches", "RSplit", "RSplitMut", "RSplitN", "RSplitNMut", "RSplitTerminator", "RandomState", "Range", "RangeBounds", "RangeFrom", "RangeFull", "RangeInclusive", "RangeMut", "RangeTo", "RangeToInclusive", "RawEntryBuilder", "RawEntryBuilderMut", "RawEntryMut", "RawFd", "RawHandle", "RawOccupiedEntryMut", "RawPthread", "RawSocket", "RawVacantEntryMut", "RawWaker", "RawWakerVTable", "Rc", "Read", "ReadDir", "Ready", "RealmLocal", "Receiver", "RecvError", "RecvTimeoutError", "Ref", "RefCell", "RefMut", "RefUnwindSafe", "Reject", "Relaxed", "Release", "Rem", "RemAssign", "Repeat", "RepeatWith", "Result", "Rev", "Reverse", "ReverseSearcher", "Right", "RootDir", "RwLock", "RwLockReadGuard", "RwLockWriteGuard", "SOCKET", "Scan", "SearchStep", "Searcher", "Seek", "SeekFrom", "Send", "SendError", "Sender", "SeqCst", "Shl", "ShlAssign", "Shr", "ShrAssign", "Shutdown", "Sink", "SipHasher", "SiteLocal", "Sized", "Skip", "SkipWhile", "SliceIndex", "SocketAddr", "SocketAddrV4", "SocketAddrV6", "Some", "Splice", "Split", "SplitAsciiWhitespace", "SplitMut", "SplitN", "SplitNMut", "SplitPaths", "SplitTerminator", "SplitWhitespace", "Start", "Stderr", "StderrLock", "Stdin", "StdinLock", "Stdio", "Stdout", "StdoutLock", "Step", "StepBy", "StrSearcher", "String", "StripPrefixError", "StructuralEq", "StructuralPartialEq", "Sub", "SubAssign", "Subnormal", "Successors", "Sum", "SymmetricDifference", "Sync", "SyncSender", "System", "SystemTime", "SystemTimeError", "Take", "TakeWhile", "TcpListener", "TcpStream", "Termination", "Thread", "ThreadId", "TimedOut", "Timeout", "ToLowercase", "ToOwned", "ToSocketAddrs", "ToString", "ToUppercase", "TraitObject", "TrustedLen", "Try", "TryFrom", "TryFromIntError", "TryFromSliceError", "TryInto", "TryIter", "TryLockError", "TryLockResult", "TryRecvError", "TryReserveError", "TrySendError", "TypeId", "UNC", "UdpSocket", "Unbounded", "Underflow", "UnexpectedEof", "UnicodeVersion", "Union", "UnixDatagram", "UnixListener", "UnixStream", "Unpin", "UnsafeCell", "Unsize", "Unsupported", "UnwindSafe", "UpperExp", "UpperHex", "Utf8Error", "V4", "V6", "VaList", "VaListImpl", "Vacant", "VacantEntry", "Values", "ValuesMut", "VarError", "Vars", "VarsOs", "Vec", "VecDeque", "Verbatim", "VerbatimDisk", "VerbatimUNC", "WaitTimeoutResult", "Waker", "Weak", "Windows", "WouldBlock", "Wrapping", "Write", "WriteZero", "Yielded", "Zero", "Zip", "blkcnt_t", "blksize_t", "bool", "c_char", "c_double", "c_float", "c_int", "c_long", "c_longlong", "c_schar", "c_short", "c_uchar", "c_uint", "c_ulong", "c_ulonglong", "c_ushort", "char", "dev_t", "f32", "f64", "gid_t", "i128", "i16", "i32", "i64", "i8", "ino_t", "isize", "mode_t", "nlink_t", "off_t", "pid_t", "pthread_t", "str", "time_t", "u128", "u16", "u32", "u64", "u8", "uid_t", "usize"]

for s:standardLibraryType in s:standardLibraryTypes
    execute 'syntax keyword rustLibraryType ' . s:standardLibraryType . ' nextgroup=rustTypeParams'
endfor

"
" User-defined constants
"

syntax match rustUserConst '\v<[A-Z][A-Z0-9_]+>'

"
" Standard library constants
"

let s:standardLibraryConsts = ["ARCH", "ATOMIC_BOOL_INIT", "ATOMIC_I16_INIT", "ATOMIC_I32_INIT", "ATOMIC_I64_INIT", "ATOMIC_I8_INIT", "ATOMIC_ISIZE_INIT", "ATOMIC_U16_INIT", "ATOMIC_U32_INIT", "ATOMIC_U64_INIT", "ATOMIC_U8_INIT", "ATOMIC_USIZE_INIT", "DIGITS", "DLL_EXTENSION", "DLL_PREFIX", "DLL_SUFFIX", "EPSILON", "EXE_EXTENSION", "EXE_SUFFIX", "FAMILY", "FRAC_1_PI", "FRAC_1_SQRT_2", "FRAC_2_PI", "FRAC_2_SQRT_PI", "FRAC_PI_2", "FRAC_PI_3", "FRAC_PI_4", "FRAC_PI_6", "FRAC_PI_8", "INFINITY", "LN_10", "LN_2", "LOG10_2", "LOG10_E", "LOG2_10", "LOG2_E", "MAIN_SEPARATOR", "MANTISSA_DIGITS", "MAX", "MAX_10_EXP", "MAX_EXP", "MIN", "MIN_10_EXP", "MIN_EXP", "MIN_POSITIVE", "NAN", "NEG_INFINITY", "ONCE_INIT", "OS", "PI", "RADIX", "REPLACEMENT_CHARACTER", "SQRT_2", "TAU", "UNICODE_VERSION", "UNIX_EPOCH"]

for s:standardLibraryConst in s:standardLibraryConsts
    execute 'syntax keyword rustLibraryConst ' . s:standardLibraryConst
endfor

"
" User-defined macros
"

syntax match rustUserMacro '\v<[a-z][a-z0-9_]*!'

"
" Standard library macros
"

let s:standardLibraryMacros = ["asm", "assert", "assert_eq", "assert_ne", "cfg", "column", "compile_error", "concat", "concat_idents", "dbg", "debug_assert", "debug_assert_eq", "debug_assert_ne", "env", "eprint", "eprintln", "file", "format", "format_args", "format_args_nl", "global_asm", "include", "include_bytes", "include_str", "is_aarch64_feature_detected", "is_arm_feature_detected", "is_mips64_feature_detected", "is_mips_feature_detected", "is_powerpc64_feature_detected", "is_powerpc_feature_detected", "is_x86_feature_detected", "line", "log_syntax", "matches", "module_path", "option_env", "panic", "print", "println", "stringify", "thread_local", "todo", "trace_macros", "try", "unimplemented", "unreachable", "vec", "write", "writeln"]

for s:standardLibraryMacro in s:standardLibraryMacros
    execute 'syntax match rustLibraryMacro "\v<' . s:standardLibraryMacro . '!"'
endfor

"
" Functions
"

syntax match rustFunction '\v[a-z][a-z0-9_]*(\()@='

"
" Type definitions
"

syntax match rustTypeDef '\v[A-Z][A-Za-z0-9]*'
            \ contained
            \ nextgroup=rustTypeDefParams

" Type parameters
syntax region rustTypeDefParams
            \ matchgroup=rustDelimiter
            \ start='<'
            \ end='>'
            \ keepend
            \ contains=TOP

syntax match rustTypeParamDef '\v(:\s*)@<![A-Z][A-Za-z0-9]*'
            \ contained
            \ containedin=rustTypeDefParams

highlight default link rustTypeParamDef rustTypeDef

"
" Function definitions
"

syntax match rustFuncDef '\v<[a-z][a-z0-9_]*'
            \ contained
            \ nextgroup=rustTypeDefParams

"
" Identifier definitions
"

syntax match rustIdentDef '\v<[a-z][a-z0-9_]*>' contained display
syntax match rustIdentDef '\v<[A-Z][A-Z0-9_]*>' contained display

syntax region rustPattern
            \ matchgroup=rustDelimiter
            \ start='('
            \ end=')'
            \ contained
            \ contains=rustMut,rustDelimiter,rustOperator,rustLibraryType,rustUserType,rustIdentDef

"
" Field access
"

syntax match rustFieldAccess '\v(\.)@<=[a-z][a-z0-9_]*>(\()@!'

"
" Numbers
"

syntax match rustNumber '\v<[0-9_]+>'
syntax match rustFloat '\v<[0-9_]+\.[0-9_]+>'

"
" Attributes
"

syntax region rustAttribute
            \ matchgroup=rustDelimiter
            \ start='#\['
            \ skip='\v\(.*\)'
            \ end='\]'

syntax region rustAttributeParenWrapped
            \ start='('
            \ end=')'
            \ containedin=rustAttribute
            \ contains=TOP
            \ keepend

"
" Delimiters
"

syntax match rustDelimiter '[(){}\[\]|\.,:;]\+'

"
" Operators
"

syntax match rustOperator '[!%&/\*+<=>?\^-]\+'

" We highlight mutable references separately as an operator because otherwise
" they would be recognised as the ‘mut’ keyword, thus whatever comes after the
" ‘mut’ is highlighted as an identifier definition.
syntax match rustOperator '&mut'

"
" Comments
"

syntax region rustComment start='//' end='$'
syntax region rustDocComment start='///' end='$'
syntax region rustDocComment start='//!' end='$'

syntax match rustCommentNote '\v[A-Z]+(:)@='
            \ contained
            \ containedin=rustComment,rustDocComment

"
" Default linkages
"

highlight default link rustAttribute rustKeyword
highlight default link rustCharacter Character
highlight default link rustComment Comment
highlight default link rustCommentNote Todo
highlight default link rustConditional Conditional
highlight default link rustDelimiter Delimiter
highlight default link rustDocComment SpecialComment
highlight default link rustFieldAccess Identifier
highlight default link rustFloat Float
highlight default link rustFuncDef Function
highlight default link rustFunction Function
highlight default link rustIdentDef Identifier
highlight default link rustInclude Include
highlight default link rustKeyword Keyword
highlight default link rustLibraryConst Constant
highlight default link rustLibraryMacro Macro
highlight default link rustLibraryType Type
highlight default link rustLifetime Special
highlight default link rustNumber Number
highlight default link rustOperator Operator
highlight default link rustRepeat Repeat
highlight default link rustString String
highlight default link rustTypeDef Typedef
highlight default link rustUserConst Constant
highlight default link rustUserMacro Macro
highlight default link rustUserType Type
